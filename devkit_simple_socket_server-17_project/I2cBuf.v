/* I2cBuf.v


Open-drain buffers for I2C_SCL and I2C_DAT

  September 3, 2022
  Tom McDermott, N5EG

*/

//`ifndef I2CBUF_H
//`define I2CBUF_H

module I2CBUF (
	input wire sda_oe,
	inout wire sda,
	input wire scl_oe,
	inout wire scl
);

assign i2c_serial_scl_in = scl;
assign scl = scl_oe ? 1'b0 : 1'bz;
assign i2c_serial_sda_in = sda;
assign sda = sda_oe ? 1'b0 : 1'bz;


endmodule

//`endif	//I2CBUF_H
