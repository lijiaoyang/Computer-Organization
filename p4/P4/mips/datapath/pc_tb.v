`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:30:48 11/17/2015
// Design Name:   pc
// Module Name:   E:/project/P4/mips/datapath/pc_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_tb;

	// Inputs
	reg [31:2] NPC;
	reg Clk;
	reg Reset;

	// Outputs
	wire [31:2] PC;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.NPC(NPC), 
		.Clk(Clk), 
		.Reset(Reset), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		NPC = 0;
		Clk = 0;
		Reset = 0;

		#10 Reset=1;
		#10 Reset=0;
		#10 NPC = 30'd10;

	end
   always #5 Clk = ~Clk;
endmodule

