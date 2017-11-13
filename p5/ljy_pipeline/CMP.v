`timescale 1ns / 1ps
module CMP(
    input [31:0] RD1,
    input [31:0] RD2,
    output BIG_ZERO,
    output EQUAL_ZERO,
    output LESS_ZERO,
    output EQUAL
    );

	assign BIG_ZERO = (RD1==0)? 0 : ~RD1[31];
	assign EQUAL_ZERO = (RD1==0)? 1 : 0;
	assign LESS_ZERO = RD1[31];
	assign EQUAL = (RD1==RD2) ? 1 : 0;
endmodule
