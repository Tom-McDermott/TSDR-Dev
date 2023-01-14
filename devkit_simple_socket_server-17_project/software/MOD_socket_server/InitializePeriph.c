/*
 * InitializePeriph.c
 *
 *  Created on: Jan 10, 2023
 *  	License: Gnu Public License (GPL) Version 2 or later.
 *      Author: Tom McDermott, N5EG
 *      Copyright 2023, Thomas C. McDermott
 */

// Right now this just writes the ClockBuiilder Pro compiler register file to the
// clock module synthesizer chip.
// Other modules can be added later if they need initialization


#include <stdio.h>
#include <string.h>
#include <ctype.h>

#include "InitializePeriph.h"
#include "DELHProtocol.h"
#include "ClockModInit.h"
#include "system.h"
#include "alt_error_handler.h"
#include "altera_avalon_i2c.h"		// I2C interface



int initPeriph()		// List all peripheral initializers that need to run
{
	int status = 0;
	status = SynthInit();
	return status;
}




int SynthInit()			// Clock Module Initializer.
{
	// This initializer needs to know where to find the Clock Module Synthesizer.
	// The interface number is defined via a #DEFINE in DELHProtocol.h

	ALT_AVALON_I2C_DEV_t *i2c_dev; 		//pointer to instance structure
	alt_32 status = 0;					// Altera defines this as unsigned, but then uses it as signed

	i2c_dev = alt_avalon_i2c_open(ItfcTable[CLOCKSYNTHITFC].name);

	if (NULL==i2c_dev)
	{
		printf("Device Error: Cannot find: %s\n", ItfcTable[CLOCKSYNTHITFC].name);
		return -1;
	}

    // Si5345 slave address is dependent on the value A1 A0 are. A0 supposed to be pulled up.
	//  A1 is on pin 17 of the device (a corner pin).  Then slave address >> 1 is:
	//   if A1 high - 0x6B
	//   if A1 low - 0x69		The Clock Module was reworked to ground pin A1.

	alt_u32 slave_addr = 0x69;  	  // Right shifted by one bit

	alt_avalon_i2c_master_target_set(i2c_dev, slave_addr);

	// Need to set the I2C I/O voltage to 3.3v:  bank 0x09 register 0x43

	alt_u8 bank9[2] = {0x01, 0x09 };	// write 9 to bank 1 (selector)
	status += alt_avalon_i2c_master_tx(i2c_dev, bank9, 2, ALT_AVALON_I2C_NO_INTERRUPTS);

	// write 0x01 to 9:43
	alt_u8 vccio[2] = { 0x43, 0x01 };	// set I2C vccio to 3.3v
	status += alt_avalon_i2c_master_tx(i2c_dev, vccio, 2, ALT_AVALON_I2C_NO_INTERRUPTS);

	alt_u8 banksel[2] = {0x01, 0x00 };	// write 0 (as bank 0 for future reads) to bank 1 (bank selector)
	status += alt_avalon_i2c_master_tx(i2c_dev, banksel, 2, ALT_AVALON_I2C_NO_INTERRUPTS);

	alt_u8 selMSBPN = {0x02 };	// bank 0 : MSB of the part number
	status += alt_avalon_i2c_master_tx(i2c_dev, &selMSBPN, 1, ALT_AVALON_I2C_NO_INTERRUPTS);
	alt_u8 LSBPN;
	status += alt_avalon_i2c_master_rx(i2c_dev, &LSBPN, 1, ALT_AVALON_I2C_NO_INTERRUPTS);

	alt_u8 selLSBPN = {0x03 };	// bank 0 : LSB of the part number
	status += alt_avalon_i2c_master_tx(i2c_dev, &selLSBPN, 1, ALT_AVALON_I2C_NO_INTERRUPTS);
	alt_u8 MSBPN;
	status += alt_avalon_i2c_master_rx(i2c_dev, &MSBPN, 1, ALT_AVALON_I2C_NO_INTERRUPTS);

	// Above test is OK after board rework.

	if (status == 0)
		printf("Si5345 OK. Part number of device:  %02x%02x\n", MSBPN, LSBPN);
	else
	{
		printf("Si5345 i2C error. Error status code: %04ld\n", status);
		return status;
	}

	alt_u8 bankselector[2]; 		// bank selector + page
	alt_u8 bank, address, data;		// to hold retrieved record
	alt_u8 adddata[2];				// two consecutive bytes to hold address + data

	int recindex = 0;							// record number
	int eor = 0;								// 1 = end-of-record
	int synstatus;									// i2c action status

	while (eor == 0)
	{
		eor = ParseClockRec(&ClockPreface[recindex], &bank, &address, &data);
		if (eor == 1) break;					// don't process the end-of-record

		bankselector[0] = 0x01;		// register on Si5345 that programs bank#
		bankselector[1] = bank;

		status = 0;

		adddata[0] = address;
		adddata[1] = data;

		synstatus += alt_avalon_i2c_master_tx(i2c_dev, bankselector, 2, ALT_AVALON_I2C_NO_INTERRUPTS);
		synstatus += alt_avalon_i2c_master_tx(i2c_dev, adddata, 2, ALT_AVALON_I2C_NO_INTERRUPTS);

		if (synstatus < 0)
		{
			printf("Error trying to write Si5345 program. ClockPreface Record # %i\n", recindex);
			return -1;
		}
		recindex++;
	}

	OSTimeDlyHMSM(0, 0, 0, 300); 	// sleep for 300 milliseconds to allow synthesizer to self-calibrate

	recindex = 0;
	eor = 0;

	while (eor == 0)
	{
		eor = ParseClockRec(&ClockBody[recindex], &bank, &address, &data);
		if (eor == 1) break;					// don't process the end-of-record

		bankselector[0] = 0x01;		// register on Si5345 that programs bank#
		bankselector[1] = bank;

		synstatus = 0;

		adddata[0] = address;
		adddata[1] = data;

		synstatus += alt_avalon_i2c_master_tx(i2c_dev, bankselector, 2, ALT_AVALON_I2C_NO_INTERRUPTS);
		synstatus += alt_avalon_i2c_master_tx(i2c_dev, adddata, 2, ALT_AVALON_I2C_NO_INTERRUPTS);

		if (synstatus < 0)
		{
			printf("Error trying to write Si5345 program. ClockBody Record # %i   bank = %02x  address = %02x  data = %02x  status = %i\n",
					recindex, bank, address, data, synstatus);
			return -1;
		}
		recindex++;
	}

	printf("Si5345 Synthesizer initialized without errors\n");

	return 0;
}
