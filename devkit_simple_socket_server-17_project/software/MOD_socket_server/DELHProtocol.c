/*
 * 10-18-2021	Tom McDermott, N5EG
 *
 * Copyright 2021, Thomas C. McDermott.
 * Licensed under GNU Public License, version 2 or later.
 *
 * Implementation of the Data Engine (host) side of
 * the LH_DE protocol for TangerineSDR.
 *
 * This dynamically creates connections as described by
 * the protocol. Future feature: clear connections when
 * they are inactive for a long time.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

#include "system.h"

#include "alt_error_handler.h"
#include "DELHProtocol.h"

#include "simple_socket_server.h"	// LED Queue

#include "altera_avalon_i2c.h"		// I2C interface
#include "altera_avalon_spi.h"		// SPI interface


/* Allocate the channel table in global memory so
 * the timer task can manipulate the timers in it.
 * The LED command also needs to be in global memory
 * for the same reason.
 */
static struct UDPCHAN Connections[MAXUDPCHAN];
struct ITFCMAP ItfcTable[MAXITFC];
static INT32U LEDCommand;



/* Initialize the connection table,
 * Add a connection to the table,
 * Delete a connection from the table.
 * Find a connection in the table.
 * Build a UDPCONN struct from pieces and add.
 * Return array of all active fd's in the table.
 * fd == -1 implies an empty connection slot.
 *
 * NOTE: fd = 0 could be stdin or stdout ?
 */

void initChan()
{
	for (int i=0; i < MAXUDPCHAN; i++)
	{
		Connections[i].fd = -1;
		Connections[i].chantype = 'I';	// Inactive
	}
};

int addChan(struct UDPCHAN * Conn)
{
	if (Conn->fd < 0)
		return(-2);	// bad fd value to add.

	for (int i=0; i < MAXUDPCHAN; i++)
	{
		if (Connections[i].fd == -1)
		{
			memcpy(&Connections[i], Conn, sizeof(struct UDPCHAN));
			return(i);
		}
	}

	return(-1);  // out of space in the table
};

int delChan(struct UDPCHAN * Conn)
{
	if (Conn->fd < 0)
		return(-2);	// bad fd value to delete.

	for (int i=0; i < MAXUDPCHAN; i++)
	{
		if (Connections[i].fd == Conn->fd)
		{
			Connections[i].fd = -1;
			Connections[i].chantype = 'I';
			return(i);
		}
	}

	return(-1);  // didn't find in the table
};

int findfdChan(int fd)
{
	if (fd < 0)
		return(-2);	// bad fd value to search for.

	for (int i=0; i < MAXUDPCHAN; i++)
	{

		if (Connections[i].fd == fd)
			return(i);  // index of the matching connection
	}

	return(-1);  // didn't find in the table
};

int findExistingChan(char chantype, struct sockaddr_in * client)
{
	// See if we already have a channel to the client IP

	for (int i=0; i < MAXUDPCHAN; i++)
	{
		if ((Connections[i].chantype == chantype)      &&
		   (memcmp(&(Connections[i].client_ip.sin_addr), &(client->sin_addr), sizeof(struct in_addr) ) == 0))
		{
			return(i);	// have existing channel
		}
	}

	return(-1);		// didn't find in the table

}

int buildaddChan(int fd, char type, struct sockaddr_in * host, struct sockaddr_in * client)
{
	struct UDPCHAN conn;

	if (fd < 0)
		return(-2);	// bad fd value

	conn.fd = fd;
	conn.chantype = type;
	memcpy(&conn.host_ip, host, sizeof(struct sockaddr_in));
	memcpy(&conn.client_ip, client, sizeof(struct sockaddr_in));

	return addChan(&conn);
};

int allListeners(int * theList)			// return array of active channels to listen for
{
	int count = 0;

	//memset(theList, -1, MAXUDPCHAN);	// clear the returned list

	for(int i=0; i<MAXUDPCHAN; i++)
		if (Connections[i].fd > 0)		// valid fd
			theList[count++] = Connections[i].fd;

	return count;
};


/*************************************************************************************************
 * Handle received packets according to the type of channel they are received on.
 * Also transmit packets in response as necessary.
 * ***********************************************************************************************/

#define MAXLINE 1500
unsigned char buffer[MAXLINE+1];  // room to hold string terminating \0


int ProcessRxPacket(int index)
{

    int                 len, bufflen;
    struct sockaddr_in  client_addr;

	// Discovery channel has to process the receive buffer itself

	if (Connections[index].chantype == 'D')  // Discovery
		return DiscChanMessage(index);

	// Get the received buffer
    memset(&client_addr, 0, sizeof(struct sockaddr_in));

    len = sizeof(struct sockaddr_in);
	bufflen = recvfrom(Connections[index].fd, (char *)buffer, MAXLINE,
			/*MSG_WAITALL*/ 0, (struct sockaddr *) &client_addr, &len);
	buffer[bufflen] = '\0';

	if (Connections[index].chantype == 'P')  // Provisioning
		return ProvChanMessage(index, bufflen);

	if (Connections[index].chantype == 'C')  // Configuration
		return ConfigChanMessage(index, bufflen);

	if (Connections[index].chantype == 'T')  // Traffic (Data rx'd from Ethernet to be RF transmitted)
		return TrafficChanMessage(index, bufflen);

	return -1;		// unknown or Idle chantype
};


int DiscChanMessage(int index)
{
    /* Received HPSDR discovery request.
     * If it's a new one, create a provisioning channel and reply
     * using it.  Else reply using existing provisioning channel.
     * If it's not a request message, we don't know what to do with it.
     */

    int                 len, n, fd_prov_tx;
    struct sockaddr_in  client_addr, host_addr;

    memset(&client_addr, 0, sizeof(struct sockaddr_in));
    memset(&host_addr, 0, sizeof(struct sockaddr_in));

    /* Discovery reply format:
     * 0xEF 0xFE 0x02 (not sending data yet) 6-byte ourMACaddress code_ver
     * board_id (0x07 from TSDR)
     */
    uint8_t disc_resp[64] = { 0xfe, 0xef, 0x02, 0x00, 0x07, 0xed, 0x2a, 0x22, 0x16, 0x07 };
    memset(&disc_resp[10], 0, 54);  // discovery reply is padded with zeros

    len = sizeof(struct sockaddr_in);
	n = recvfrom(Connections[index].fd, (char *)buffer, MAXLINE,
			/*MSG_WAITALL*/ 0, (struct sockaddr *) &client_addr, &len);
	buffer[n] = '\0';

    /* check for 0xef 0xfe 0x02 signifying discovery request */
	if ((buffer[0] == 0xef) && (buffer[1] == 0xfe) && (buffer[2] == 0x02))
	  printf("Valid OpenHPSDR Discovery request received\n");
	else
		return -1;	// unknown discovery message - throw away

	printf("From: %s   Port: %u\n", inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
	printf("Received buffer : 0x%2x 0x%2x 0x%2x 0x%2x\n", buffer[0], buffer[1], buffer[2], buffer[3]);

    // See if we already have a Provisioning Channel open from this client

    int existingIndex = findExistingChan('P', &client_addr);
    if (existingIndex >= 0)		// Have an existing provisioning channel - send a duplicate reply
    {
    	int result = sendto(Connections[existingIndex].fd, (void *)disc_resp, sizeof(disc_resp),
				/*MSG_CONFIRM*/ 0, (struct sockaddr *) &client_addr, sizeof(struct sockaddr_in));
    	return result;
    }

    // Don't have an existing channel. Create a new Provisioning channel to send the discovery reply

    if ((fd_prov_tx = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
    {
      alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[TSDR_task] Provisioning Socket creation failed");
    }

    // Use a new sending socket. sendto implicitly binds a new (random) receive port number

    sendto(fd_prov_tx, (void *)disc_resp, sizeof(disc_resp),
    		/*MSG_CONFIRM*/ 0, (struct sockaddr *) &client_addr, sizeof(struct sockaddr_in));

    len = sizeof(struct sockaddr_in);
    if (getsockname(fd_prov_tx, (struct sockaddr *)&host_addr, &len) == -1)
    {
    	perror("getsockname() error\n");
    	return -1;	// Error
    }
    else
    {
    	printf("Provisioning port number: %d\n", ntohs(host_addr.sin_port));
    	int addresult = buildaddChan(fd_prov_tx, 'P', &host_addr, &client_addr);
    	printf("Result of adding new provisioning channel to table: %u\n", addresult);
    	return addresult;   // return the result of adding the channel to the table
    }
};

int ProvChanMessage(int index, int bufflen)
{

    /* Received a Provisioning Channel message command:
	 * MR - Module Read
	 * MW - Module Write
	 * CC - Create a Config Chan
	 * UC - Uncreate (Delete) a Config chan
	 * XR - Reboot DE
	 * S? - status request
	 * Yn - Turn on LED n.  The DEVKIT has 4 LEDs
	 * Xn - Turn off LED n
	 */

	int result;
	char resultmessage[40];

	printf("Received Provisioning Channel Message: %s\n", buffer);

	if (buffer[0] == 'Y' || buffer[0] == 'X')
		result = ProvisioningLEDCommand(index, bufflen);


	if (buffer[0] == 'M')
		result = ProvisioningModuleRegisterCommand(index, buffer, resultmessage);

	if (result < 0)
	{
        sendto(Connections[index].fd, (void *)"NAK\n", 4, 0, (struct sockaddr *) &Connections[index].client_ip, sizeof(struct sockaddr_in));
        return result;
	}

    sendto(Connections[index].fd, (void *)"AK\n", 4, 0, (struct sockaddr *) &Connections[index].client_ip, sizeof(struct sockaddr_in));

    if (result > 0)
        sendto(Connections[index].fd, (void *)resultmessage, 4, 0, (struct sockaddr *) &Connections[index].client_ip, sizeof(struct sockaddr_in));

	return result;
};

int ConfigChanMessage(int index, int bufflen)
{
    // Received Configuration Channel message

	printf("Received Configuration Channel Message: %s\n", buffer);
	return -2;	// not yet implemented
};

int TrafficChanMessage(int index, int bufflen)
{
    // Received Traffic (Data) Channel message

	printf("Received Traffic Channel Message: %s\n",buffer);
	return -2;	// not yet implemented
};


int ProvisioningLEDCommand(int index, int bufflen)
{
	if (buffer[0] == 'Y')	// Turn on LED0 - 3
	{
		if (buffer[1] == '0')
		{
			LEDCommand = 0x01;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		if (buffer[1] == '1')
		{
			LEDCommand = 0x02;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		if (buffer[1] == '2')
		{
			LEDCommand = 0x04;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		if (buffer[1] == '3')
		{
			LEDCommand = 0x08;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		return -1;	// unknown LED number
	}

	if (buffer[0] == 'X')	// Turn off LED0 - 3
	{
		if (buffer[1] == '0')
		{
			LEDCommand = 0x10;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		if (buffer[1] == '1')
		{
			LEDCommand = 0x20;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		if (buffer[1] == '2')
		{
			LEDCommand = 0x40;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		if (buffer[1] == '3')
		{
			LEDCommand = 0x80;
			OSQPost(SSSLEDCommandQ, (void *) LEDCommand);
			return 0;
		}
		return -1;	// unknown LED number
	}
	return -2;		// How did we get here?

};

int SI5345(struct PARSEDCMD *cmds, char resultmessage[], int itfcindex) 		// Handler for ATECC 608A ID PROM
{
	return -3;	// unimplemented
}
int ZEDF9T(struct PARSEDCMD *cmds, char resultmessage[], int itfcindex) 		// Handler for F9T GPS
{
	return -3;	// unimplemented
}
int AD9648(struct PARSEDCMD *cmds, char resultmessage[], int itfcindex) 		// Handler for ADC AD9648 SPI interface
{
	return -3;	// unimplemented
}

int ATECC608(struct PARSEDCMD *cmds, char resultmessage[], int itfcindex)
{
	// Ident ROM Microchip ATECC 608A - used just to read the unique 72-bit serial number.
	// Write not supported.  We need to do a dummy write of 0x00 in order to wake up
	// the device first.

	ALT_AVALON_I2C_DEV_t *i2c_dev; 		//pointer to instance structure
	ALT_AVALON_I2C_STATUS_CODE status;

	i2c_dev = alt_avalon_i2c_open(ItfcTable[itfcindex].name);

	if (NULL==i2c_dev)
	{
		printf("Device Error: Cannot find: %s\n", ItfcTable[itfcindex].name);
		return -1;
	}


   // ATECC Write address (0x61 is the corresponding read addr)
	alt_u32 slave_addr = 0x30;  	  // Right shifted by one bit

	alt_avalon_i2c_master_target_set(i2c_dev, slave_addr);

	if (cmds->cmd[1] == 'R')
	{

	// wakeup the device from sleep

	alt_u8 txdata = 0x00;
	alt_u32 count = 0x01;

	status = alt_avalon_i2c_master_tx(i2c_dev, &txdata, count, ALT_AVALON_I2C_NO_INTERRUPTS);

	// we expect the call to fail, but wake up the ATECC device. Other errors are not OK.

	if (status == ALT_AVALON_I2C_NACK_ERR)
	{
		printf("Received NACK error from ATECC608A device. That's OK\n");
	}
	else if (status != ALT_AVALON_I2C_SUCCESS)
	{
		printf("i2c_master_tx: ATECC608A wake-up attempt error = %ld\n", status);
		return -1; //FAIL
	}

	// To get the 72-bit serial number we need to read three 32-bit (4 hex digit) values.
	// Each requires writing a command + CRC to the device in the correct zone. Each enables
	// a 4-byte read. All 3 {command+CRC} have been computed externally and are declared
	// as constants in this code.

	alt_u8 rxbuffer[16];
	alt_u32 rxcount = 4;

	alt_u8 cmd1[8] = { 0x03, 0x07, 0x02, 0x00, 0x00, 0x00, 0x1E, 0x2D } ;  // first four bytes of ID
	alt_u8 cmd2[8] = { 0x03, 0x07, 0x02, 0x00, 0x02, 0x00, 0x18, 0xAD } ;  // second four bytes of ID
	alt_u8 cmd3[8] = { 0x03, 0x07, 0x02, 0x00, 0x03, 0x00, 0x11, 0x2D } ;  // last byte of ID + 3 don't care bytes

	// If the corresponding read is all ones, then the device was not ready and the
	// read needs to be retried.

	// Read the first four bytes of the serial number
	status = alt_avalon_i2c_master_tx(i2c_dev, cmd1, 8, ALT_AVALON_I2C_NO_INTERRUPTS);
	status = alt_avalon_i2c_master_rx(i2c_dev, rxbuffer, rxcount, ALT_AVALON_I2C_NO_INTERRUPTS);

	// Test if it returned all ones for the four byes (meaning not ready).
	if ((buffer[0] == 0xFF ) && (buffer[1] == 0xFF) && (buffer[2] == 0xFF) && (buffer[3] == 0xFF))
	{
		printf("Rxm Ident PROM not ready\n");
		// probably do some kind of retry with a max count limit
	}

	// Read the second four bytes of the serial number
	status = alt_avalon_i2c_master_tx(i2c_dev, cmd2, 8, ALT_AVALON_I2C_NO_INTERRUPTS);
	status = alt_avalon_i2c_master_rx(i2c_dev, &rxbuffer[4], rxcount, ALT_AVALON_I2C_NO_INTERRUPTS);

	// Read the third four bytes of the serial number
	status = alt_avalon_i2c_master_tx(i2c_dev, cmd3, 8, ALT_AVALON_I2C_NO_INTERRUPTS);
	status = alt_avalon_i2c_master_rx(i2c_dev, &rxbuffer[8], rxcount, ALT_AVALON_I2C_NO_INTERRUPTS);

	// turn the results into a readable string

	return 1;		// OK - don't return AK string , instead return the string we define (RR ....)
	}
	if (cmds->cmd[1] == 'W')
	{

		return -3;	// unimplemented
	}

	return -1;		// unknown command
}


int PCF8574(struct PARSEDCMD *cmds, char resultmessage[], int itfcindex)
{
	// TI PCF8574 8-bit I/O latch and driver.

	ALT_AVALON_I2C_DEV_t *i2c_dev; 		//pointer to instance structure
	ALT_AVALON_I2C_STATUS_CODE status;

	i2c_dev = alt_avalon_i2c_open(ItfcTable[itfcindex].name);

	if (NULL==i2c_dev)
	{
		printf("Device Error: Cannot find: %s\n", ItfcTable[itfcindex].name);
		return -1;
	}

	// PCF8574 Write address is 0x70, 0x71 is the corresponding read addr.
	alt_u32 slave_addr = 0x38;  	  // PCF8574 address - the i2c driver left shifts then appends 0 for
									  // write or 1 for read translating this to 0x70 for write, 0x71 for read
	alt_avalon_i2c_master_target_set(i2c_dev, slave_addr);


	if (cmds->cmd[1] == 'W')
	{
		alt_u8 txdata = cmds->data;
		alt_u32 count = 0x01;				// num bytes to send

		//
		// Receive Module. All data are ACTIVE LOW.
		// Bit7 = Red LED   		Bit6 = Green LED  		Bit5 = Ch2 20dB Atten  	Bit4 = Ch2 10 dB Atten
		// Bit3 = Ch2 Noise Enable 	Bit2 = Ch1 20 dB Atten  Bit1 = Ch1 10 dB Atten  Bit0 = Ch1 Noise Enable


		status = alt_avalon_i2c_master_tx(i2c_dev, &txdata, count, ALT_AVALON_I2C_NO_INTERRUPTS);

		if (status == ALT_AVALON_I2C_NACK_ERR)		// retry the write
		{
			printf("Received NACK error from I2C device. Retry once\n");
			status = alt_avalon_i2c_master_tx(i2c_dev, &txdata, count, ALT_AVALON_I2C_NO_INTERRUPTS);
		}


		if (status != ALT_AVALON_I2C_SUCCESS)
		{
			printf("i2c_master_tx: error = %ld\n", status);
			return -1; //FAIL
		}

		return 0;		// OK


	}
	if (cmds->cmd[1] == 'R')
	{
		return -3;	// not yet implemented
	}
	return -1;		// unknown command type
}


int ProvisioningModuleRegisterCommand(int index, unsigned char buffer [], char resultmessage[])
{

	/* Define a table mapping the slot# and interface# to a specific
	 * I2C or SPI interface for the test system based on the DEV_KIT.
	 * For a real system this table needs to be constructed based on
	 * how the DE is actually equipped with modules which probably
	 * needs to be determined at run time.
	 *
	 * The various types of I2C devices are different. The table holds
	 * a pointer to the routine used for the particular device. Note that
	 * two different devices can share a physical I2C interface. Those need to
	 * have different interface numbers, as they use different handlers.
	 *
	 * The name of the low-level drivers for each physical interface
	 * are manually encoded here based 	on direct knowledge of the SOPCINFO
	 * file and Quartus Qsys planner.
	 */

	// Note: buffer gets modified by strtok(), so don't further reuse it.
	//              Cmd  Slot# Intfc#  Addr   Data
	// Module Read:  MR 0xssss 0xiiii 0xaaaa
	// Module Write: MW 0xssss 0xiiii 0xaaaa 0xZZZZ

	struct PARSEDCMD provcmd;		// hold the parsed provisioning command

	char * cmd = strtok((char *)buffer, " ");
	char * module = strtok(NULL, " ");
	char * slot = strtok(NULL, " ");
	char * regaddr = strtok(NULL, " ");
	char * regdata = strtok(NULL, " ");

	unsigned long moduleint, itfcint, regaddrint, regdataint;

	char * ptr;		// dummy used to make strtoul work

	moduleint = strtoul(module, &ptr, 0);
	itfcint = strtoul(slot, &ptr, 0);
	regaddrint = strtoul(regaddr, &ptr, 0);
	if (regdata != NULL)
		regdataint = strtoul(regdata, &ptr, 0);
	else
		regdataint = 0;

	// copy parsed command into struct
	strcpy(provcmd.cmd, cmd);
	provcmd.module = moduleint;
	provcmd.interface = itfcint;
	provcmd.data = regdataint;
	provcmd.address = regaddrint;

	// TODO
	// TODO - refactor the handler to take &provcmd rather than buffer and regdataint
	// TODO


	int itfcindex = FindItfcIndex(moduleint, itfcint);	// Find index of requested interface in map

	if (itfcindex == -1)	// Not found
		return -1;		// Unknown Module / Slot combination.  Send NAK.

	// Call the proper device handler. The handler returns:
	//		status < 0 for error, send NAK
	//		status == 0 for success, send AK
	//      status == +1 send AK then send response message defined by the handler back to the Local Host.

	int result = (*ItfcTable[itfcindex].handler)(&provcmd, resultmessage, itfcindex);

	return result;
};


/* Routines to initialize the Interface Map table and to find the index
 * of the entry that matches the module # / interface #
 *
 * Base address defined in the BSP system.h file.
 * Name copied from the BSP generated system.h file.
 * If the Qsys blocks have their names changed, then these must change.
 * Often need to rebuild the Project Indexes when BSP --> system.h is regenerated.
 *
 */

// Initialize the Interface Map Table.
void initItfcMap()
{
	ItfcTable[0].module = 0;	// CKM_C0
	ItfcTable[0].interface = 0;
	ItfcTable[0].base = I2C_CKM_C0_BASE;
	strcpy(&ItfcTable[0].name[0], I2C_CKM_C0_NAME);
	ItfcTable[0].handler = SI5345;

	ItfcTable[1].module = 0;	// CKM_C0
	ItfcTable[1].interface = 1;
	ItfcTable[1].base = I2C_CKM_C0_BASE;
	strcpy(&ItfcTable[1].name[0], I2C_CKM_C0_NAME);
	ItfcTable[1].handler = ZEDF9T;

//	ItfcTable[1].module = 0;	// CKM_C1
//	ItfcTable[1].interface = 1;
//	ItfcTable[1].base = I2C_CKM_C1_BASE;
//	strcpy(&ItfcTable[1].name[0], I2C_CKM_C1_NAME);
//	ItfcTable[1].handler = 2;

	ItfcTable[2].module = 0;	// CKM_ID
	ItfcTable[2].interface = 2;
	ItfcTable[2].base = I2C_CKM_ID_BASE;
	strcpy(&ItfcTable[2].name[0], I2C_CKM_ID_NAME);
	ItfcTable[2].handler = ATECC608;

	ItfcTable[3].module = 1;	// RXM_CTRL
	ItfcTable[3].interface = 0;
	ItfcTable[3].base = I2C_RXM_CTRL_BASE;
	strcpy(&ItfcTable[3].name[0], I2C_RXM_CTRL_NAME);
	ItfcTable[3].handler = PCF8574;

	ItfcTable[4].module = 1;	// RXM_ID
	ItfcTable[4].interface = 1;
	ItfcTable[4].base = I2C_RXM_ID_BASE;
	strcpy(&ItfcTable[4].name[0], I2C_RXM_ID_NAME);
	ItfcTable[4].handler = ATECC608;

	ItfcTable[5].module = 1;	// RXM_SPI_ADC
	ItfcTable[5].interface = 2;
	ItfcTable[5].base = SPI_RXM_BASE;
	strcpy(&ItfcTable[5].name[0], SPI_RXM_NAME);
	ItfcTable[5].handler = AD9648;
};

// Find the index of the Module / Interface in the Interface Map table
int FindItfcIndex(int module, int itfcnum)
{
	for (int i=0; i< MAXITFC; i++)		if ((module == ItfcTable[i].module) && (itfcnum == ItfcTable[i].interface))
			return i;

	return -1;	// Didn't find it in the table
};
