`timescale 1ns / 1ps
module MUX32(
	input [31:0]A,
	input [31:0]B,
	input [31:0]C,
	input [1:0]MUXOP,
	output [31:0]OUT
    );
	assign OUT =   (MUXOP==2'b00)? A:
						(MUXOP==2'b01)? B:
						(MUXOP==2'b10)? C:
						32'bx;
endmodule


module MUX5(
	input [4:0]A,
	input [4:0]B,
	input [1:0]MUXOP,
	output [4:0]OUT
);
	assign OUT =   (MUXOP==2'b00)? A:
						(MUXOP==2'b01)? B:
						(MUXOP==2'b10)? 5'b11111:
						32'bx;
endmodule
