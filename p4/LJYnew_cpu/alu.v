`timescale 1ns / 1ps
module alu(
    input [31:0] ALU_A,
    input [31:0] ALU_B,
    input [2:0] ALUOP,
	 input sltiu,
	 input sltu,
	 input [4:0]s_srlv,
	 input [4:0]s_srl,
    output reg[31:0] ALU_C,
    output ALU_ZERO,L,G,L_E,G_E,NE,
	 output less,
	 output sltless
    );
	 wire [31:0]sub;
	 assign ALU_ZERO = (ALU_A==ALU_B)?1:0;
	 assign sub = ALU_A - ALU_B;
	 assign G = (ALU_A == 0) ? 0 : ~ALU_A[31];//big
	 assign L = (ALU_A == 0) ? 0 : ALU_A[31];//less
	 assign G_E = ~ALU_A[31];//BIG OR EQUAL
	 assign L_E = (ALU_A == 0) ? 1 : ALU_A[31];//less or equal
	 assign NE = (ALU_A != ALU_B)?1:0;//不等于置1
	 assign less = (sltiu || sltu) ?  ALU_A < ALU_B : ALU_A[31]>ALU_B[31] ? 1 : (ALU_A[31]==ALU_B[31]) ? sub[31] : 0 ;
	 assign sltless = sub[31];//小于置1
    always @(*)begin
		case (ALUOP)
		3'b000: ALU_C =ALU_A + ALU_B;
		3'b001: ALU_C =ALU_A - ALU_B;
		3'b010: ALU_C =ALU_A | ALU_B;
		3'b011: ALU_C = 1;
		3'b100: ALU_C =ALU_B >> s_srlv;
		3'b101: ALU_C =ALU_B >> s_srl;
		default:ALU_C = 32'bx;
		endcase
	 end
endmodule
