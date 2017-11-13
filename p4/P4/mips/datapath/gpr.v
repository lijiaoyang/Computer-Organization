`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:19 11/17/2015 
// Design Name: 
// Module Name:    gpr 
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
module gpr(
    input Clk,
    input Reset,
    input [4:0] Rs,
    input [4:0] Rt,
    input [4:0] Rd,
    input RegWrite,
    input [31:0] WData,
    output [31:0] RData1,
    output [31:0] RData2
    );
	 integer i;
	 reg [31:0] mema [31:0];
	 always @(posedge Clk)
		 begin
			mema[0] = 32'b0;
			if(Reset)
				begin
					for (i=0;i<32;i=i+1)
						begin
							mema[i] = 32'b0;
						end
				end
			else if(RegWrite)
				if(Rd!=0)
					mema[Rd] = WData;
				$display("$%d <= %h", Rd, WData);

		 end
	 assign RData1 = mema[Rs];
	 assign RData2 = mema[Rt];

endmodule
