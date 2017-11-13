`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:21 11/17/2015 
// Design Name: 
// Module Name:    mux 
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
module mux_Rd(
    input [4:0] RD1,
    input [4:0] RD2,
    input [1:0] RegDst,
    output reg [4:0] RD
    );
	always @(*)
	begin
		case(RegDst)
			2'b00: RD = RD1;			//rt
			2'b01: RD = RD2;			//rd
			2'b10: RD = 31;			//$31
			default: RD = 5'bx;
		endcase
	end

endmodule

module mux_ALUSrc(
    input [31:0] Data1,
    input [31:0] Data2,
    input ALUSrc,
    output reg [31:0] Data
    );
	 always @(*)
	 begin
		case(ALUSrc)
			1'b0: Data = Data1;		//rdata2
			1'b1: Data = Data2;		//ext_out
			default: Data = 31'bx;
		endcase
	 end 

endmodule

module mux_WDSrc(
    input [31:0] Data1,
    input [31:0] Data2,
	 input [31:0] Data3,
    input [1:0] WDSrc,
    output reg [31:0] Data
    );
	 always @(*)
	 begin
		case(WDSrc)
			2'b00: Data = Data1;		//alu_out(C)
			2'b01: Data = Data2;		//dm_out
			2'b10: Data = Data3;		//pclink
			default: Data = 32'bx;
		endcase
	 end

endmodule
