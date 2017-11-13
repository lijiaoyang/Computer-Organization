`timescale 1ns / 1ps
module EXT(
    input [15:0] IMM,  //Instr_ID[15:0]
    output [31:0] OUT,
    input [1:0] EXTOP
    );
parameter   zero_ext = 2'b00,
				sign_ext = 2'b01,
				lui_ext  = 2'b10;
				
				
assign OUT =   (EXTOP==zero_ext)? {16'b0,IMM}:
					(EXTOP==sign_ext)? {{16{IMM[15]}},IMM}:
					(EXTOP==lui_ext)?	 {IMM,16'b0}:
					//(EXTOP==  )?
					32'bx;
endmodule
