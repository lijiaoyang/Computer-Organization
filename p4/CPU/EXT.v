`timescale 1ns / 1ps
module EXT(offImm, EXTOp, extOff);
	input [15:0] offImm;
	input [1:0] EXTOp;
	output reg [31:0] extOff;
	always @* begin
		case (EXTOp)
			2'b00: extOff = {16'b0, offImm};
			2'b01: extOff = {offImm, 16'b0}; 
			2'b10: extOff = {{16{offImm[15]}}, offImm};
			default: extOff = 32'bx;
		endcase
	end	

endmodule
