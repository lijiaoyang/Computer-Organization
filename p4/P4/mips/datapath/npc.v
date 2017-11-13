`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:23 11/17/2015 
// Design Name: 
// Module Name:    npc 
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
module npc(
    input [31:2] PC,
    input [31:0] dout,
    input [1:0] NPCOp,
    input Zero,
	 input [31:0] RData1,
    output [31:2] NPC,
    output [31:0] PCLink
    );
	/*case (NPCOp)
		2'b00: assign NPC = PC + 1;
		2'b01: begin if(Zero==0) assign NPC = PC + dout[15:0];	else: assign NPC = PC + 1;  end//beq
		2'b10: assign NPC = {PC[31:28],dout[25:0]}; //JAL
		2'b11: assign NPC = Rdata1[31:2];
	endcase
	assign PCLink = PC + 1;*/
	
	assign NPC = NPCOp==2? {PC[31:28],dout[25:0]}:			//为什么==加二进制数就不对？？？？
					 NPCOp==3? RData1[31:2]:
					 NPCOp==1? (Zero==1? PC + dout[15:0] + 1:PC + 1):	//为什么少加了1？注意看英文版详细解释!!!!!
					 PC + 1;
	assign PCLink = (PC + 1)<<2;
		

endmodule
