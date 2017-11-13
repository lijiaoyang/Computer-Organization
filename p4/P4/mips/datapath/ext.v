`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:18 11/17/2015 
// Design Name: 
// Module Name:    ext 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ext(
    input [15:0] Din,
    input [1:0] EXTOp,
    output reg [31:0] Dout
    );
	 always @(*)
	 begin
		case(EXTOp)
			2'b00: Dout = {16'b0,Din};
			2'b01: Dout = {16*Din[15],Din};
			2'b10: Dout = Din<<16;
			default: Dout = 32'bx;
		endcase
	 end
	 
endmodule
