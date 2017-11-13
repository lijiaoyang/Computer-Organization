`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:04 11/17/2015
// Design Name:   npc
// Module Name:   E:/project/P4/mips/datapath/npc_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module npc_tb;

	// Inputs
	reg [31:2] PC;
	reg [25:0] dout;
	reg [1:0] NPCOp;
	reg Zero;

	// Outputs
	wire [31:2] NPC;
	wire [31:2] PCLink;

	// Instantiate the Unit Under Test (UUT)
	npc uut (
		.PC(PC), 
		.dout(dout), 
		.NPCOp(NPCOp), 
		.Zero(Zero), 
		.NPC(NPC), 
		.PCLink(PCLink)
	);

	initial begin
		// Initialize Inputs
		PC = 0;
		dout = 0;
		NPCOp = 0;
		Zero = 0;

		#10 dout = 2;
		#10 NPCOp = 2'b01;
		#10 Zero = 1;
		
		#10 dout = 3;
		#10 dout = 4;
		#10 dout = 16;
		#10 NPCOp = 2'b10;
		
		
		#10 RData1 = 16;
		#10 NPCOp = 2'b11;

	end
      
endmodule

