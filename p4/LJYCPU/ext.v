`timescale 1ns / 1ps
module ext(
    input [15:0] Din,
    input [1:0] EXTOP,
    output reg [31:0] Dout
    );
	 always @*
	 begin
		case (EXTOP)
		2'b00:Dout = {16'b0,Din};
		2'b01:Dout = {Din,16'b0};
		2'b10:Dout = {16*Din[15],Din};		
		default:Dout = 32'bx;
		endcase
	 end
endmodule
