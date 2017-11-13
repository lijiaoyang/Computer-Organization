`timescale 1ns / 1ps
module mux_rd(
	input [4:0]R2, 
	input [4:0]RD, 
	input [1:0]RegDst, 
	output reg[4:0]RegAddr
	);
	always @* begin
		case (RegDst)
		2'b00: RegAddr = R2;
		2'b01: RegAddr = RD;
		2'b10: RegAddr = 5'b11111;
		default: RegAddr = 5'bx;
		endcase
	end
endmodule

module mux_ALUSrc(
	input [31:0]RD2,
	input [31:0]EXT,
	input ALUSrc,
	output reg[31:0]ALU_B
	);
	always @* begin
		case (ALUSrc)
		1'b0: ALU_B = RD2;
		1'b1: ALU_B = EXT;
		default: ALU_B = 32'bx;
		endcase
	end	
endmodule

module mux_MemtoReg(
	input [31:0]result,
	input [31:0]ReadData,
	input [31:0]PCLink,
	input [1:0]MemtoReg,
	input less,
	output reg [31:0]RegData
	);
	always @* begin
		case (MemtoReg)
		2'b00:RegData = result;
		2'b01:RegData = ReadData;
		2'b10:RegData = PCLink;
		2'b11: RegData = {31'b0, less};
		default: RegData = 32'bx;
		endcase
	end	
endmodule
