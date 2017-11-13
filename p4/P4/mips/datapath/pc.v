`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:28:11 11/17/2015 
// Design Name: 
// Module Name:    pc 
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
module pc(
    input [31:2] NPC,
    input Clk,
    input Reset,
    output reg [31:2] PC
    );
	 always @(posedge Clk)
		begin 
			if(Reset)
				PC = 30'h3000;
			else
				PC = NPC;
		end

endmodule
