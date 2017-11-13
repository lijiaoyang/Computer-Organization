`timescale 1ns / 1ps
module Decd(OP, Func, SHAMT, ADDU, SUBU, ADD, SUB, AND, OR, XOR, SLL, SRL, ORI, LW, SW, LUI, ADDI, ADDIU, BEQ, BNE, J, JAL, JR, R_Type,I_Type,B_Type,L_Type,S_Type,J_Type);
	// addu, subu, ori, lw, sw, beq, lui, j, jal, jr, nop
	input [5:0] OP, Func;
	input [4:0]SHAMT;
	output ADDU, SUBU, ADD, SUB, AND, OR, XOR, SLL, SRL;
	output ORI, LW, SW, LUI, ADDI, ADDIU;
	output BEQ, BNE;
	output J, JAL, JR;
   output R_Type,I_Type,B_Type,L_Type,S_Type,J_Type;
	
	 assign R_Type=(OP==6'b000000)?1:0;
	 assign I_Type=(LUI || ORI|| ADDI|| ADDIU)?1:0;
	 assign B_Type=(BEQ ||BNE)?1:0;
	 assign L_Type=(LW)?1:0;
	 assign S_Type=(SW)?1:0;
	 assign J_Type=(J || JAL || JR)?1:0;
	
	wire R_Format;
	
	assign R_Format = (OP == 6'b000000);
	
	assign ADD = (R_Format && Func == 6'b100000);
	assign ADDU = (R_Format && Func == 6'b100001);
	assign SUB = (R_Format && Func == 6'b100010);
	assign SUBU = (R_Format && Func == 6'b100011);
	assign AND = (R_Format && Func == 6'b100100);
	assign OR = (R_Format && Func == 6'b100101);
	assign XOR = (R_Format && Func == 6'b100110);
	assign SLL = (R_Format && Func == 6'b000000);
	assign SRL = (R_Format && Func == 6'b000010);
	
	assign ORI = (OP == 6'b001101);
	assign LW = (OP == 6'b100011);
	assign SW = (OP == 6'b101011);
	assign LUI = (OP == 6'b001111);
	assign ADDI = (OP == 6'b001000);
	assign ADDIU = (OP == 6'b001001);
	
	assign BEQ = (OP == 6'b000100);
	assign BNE = (OP == 6'b000101);
	
	assign J = (OP == 6'b000010);
	assign JAL = (OP == 6'b000011);
	assign JR = (R_Format && Func == 6'b001000);
	
endmodule
