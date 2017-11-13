`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:03 11/17/2015 
// Design Name: 
// Module Name:    dm_4k 
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
module dm_4k(
    input [11:2] addr,
    input [31:0] din,
    input we,
    input clk,
    output reg[31:0] dout
    );
	reg [31:0] dm[1023:0];
	always @(clk)
	begin
		if(we)
			dm[addr] = din;
	assign dout = dm[addr];
	end
endmodule
