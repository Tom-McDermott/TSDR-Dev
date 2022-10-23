
`ifndef TANGERINE_H		// include guard for this module if needed
`define TANGERINE_H

/*
 September 3, 2022
 Updated  September 9, 2022
 Tom McDermott, N5EG
 filename:   Tangerine.v
 
 This module is included in the top-level m10_rgmii entity so
 that it instantiates like a top module, while not demoting m10_rgmii.
 
 It should not declare new modules, but instantiate previously
 defined modules in other files instead. A kludge, but seems to
 solve the problem.
 
 Updates (clean compile 09-09-2022):
 
 1. Change the CLK_C0 and CLK_C1 I2C interfaces to 2.5v (default) logic as that bank
 cannot be 3.3v because it hosts pins that drive Ethernet and DDR3 RAM.
 
 2. Wire up SPI pins - preliminary - 2.5v (default).  The MOSI pin is set as output.
 Need to write Verilog to build that MISO+MISO to bidirectional converter as required by
 the AD9648 dual ADC. The module needs to analyze the transmitted SPI command to see if
 it is a  read, then tri-state the Tx driver to enable readback from the ADC.

  
 */


module Tangerine();

// Assign I2C signals to open-drain buffers so they can be wired to FPGA
// IO pins.


	// Receive Module Control relays and LEDs
I2CBUF RXM_CTRL (
	.sda_oe	(i2c_rxm_ctrl_i2c_serial_sda_oe),
	.sda		(i2c_rxm_ctrl_i2c_serial_sda),
	.scl_oe	(i2c_rxm_ctrl_i2c_serial_scl_oe),
	.scl		(i2c_ram_ctrl_i2c_serial_scl)
	);

	// Receive Module Ident Eprom
I2CBUF RXM_ID (
	.sda_oe	(i2c_rxm_id_i2c_serial_sda_oe),
	.sda		(i2c_rxm_id_i2c_serial_sda),
	.scl_oe	(i2c_rxm_id_i2c_serial_scl_oe),
	.scl		(i2c_ram_id_i2c_serial_scl)
	);

	// Clock Module Control C0
I2CBUF CKM_C0 (
	.sda_oe	(i2c_ckm_c0_i2c_serial_sda_oe),
	.sda		(i2c_ckm_c0_i2c_serial_sda),
	.scl_oe	(i2c_ckm_c0_i2c_serial_scl_oe),
	.scl		(i2c_ckm_c0_i2c_serial_scl)
	);

		// Clock Module Control C1
I2CBUF CKM_C1 (
	.sda_oe	(i2c_ckm_c1_i2c_serial_sda_oe),
	.sda		(i2c_ckm_c1_i2c_serial_sda),
	.scl_oe	(i2c_ckm_c1_i2c_serial_scl_oe),
	.scl		(i2c_ckm_c1_i2c_serial_scl)
	);
	
		// CLock module Ident Eprom
I2CBUF CKM_ID (
	.sda_oe	(i2c_ckm_id_i2c_serial_sda_oe),
	.sda		(i2c_ckm_id_i2c_serial_sda),
	.scl_oe	(i2c_ckm_id_i2c_serial_scl_oe),
	.scl		(i2c_ckm_id_i2c_serial_scl)
	);
	
endmodule
	
`endif	//TANGERINE_H


