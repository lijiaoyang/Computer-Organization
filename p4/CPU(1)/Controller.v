`timescale 1ns / 1ps
module Controller(func, OP, Branch, beq, bgez, bgtz, blez, bltz, bne,jump, setLess, sltiu, jr, regDst, regStr, ALUSrc, memRE, memWE, regWE, ALUOp, EXTOp);
	input [5:0]func;
	input [5:0]OP;
	input [4:0]Branch;
	output beq, jump, jr, setLess, sltiu;
	output bgez, bgtz, blez, bltz, bne;
	output ALUSrc;
	output memRE, memWE, regWE;
	output [1:0] ALUOp, EXTOp, regDst, regStr;
	
	wire R_Format, addu, subu, jr;		//R_format
	wire ori, lw, sw, lui, slti, sltiu;	//I_format
	wire beq, bgez, bgtz, blez, bltz, bne, b; //Branch
	wire j, jal;								//J_format
	//check R_format
	assign R_Format = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & ~OP[1] & ~OP[0];
	assign addu = R_Format & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & func[0];
	assign subu = R_Format & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];
	assign jr = R_Format & ~func[5] & ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];
	//check I_format
	assign ori = ~OP[5] & ~OP[4] & OP[3] & OP[2] & ~OP[1] & OP[0];
	assign lw = OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & OP[1] & OP[0];
	assign sw = OP[5] & ~OP[4] & OP[3] & ~OP[2] & OP[1] & OP[0];
	assign lui = ~OP[5] & ~OP[4] & OP[3] & OP[2] & OP[1] & OP[0];
	assign slti = ~OP[5] & ~OP[4] & OP[3] & ~OP[2] & OP[1] & ~OP[0];
	assign sltiu = ~OP[5] & ~OP[4] & OP[3] & ~OP[2] & OP[1] & OP[0];
	//check Branch
	assign b = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & ~OP[1] & OP[0];
	assign beq = ~OP[5] & ~OP[4] & ~OP[3] & OP[2] & ~OP[1] & ~OP[0];
	assign bgez = b & ~Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & Branch[0];
	assign bltz = b & ~Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & ~Branch[0];
	assign bgtz = ~OP[5] & ~OP[4] & ~OP[3] & OP[2] & OP[1] & OP[0];
	assign blez = ~OP[5] & ~OP[4] & ~OP[3] & OP[2] & OP[1] & ~OP[0];
	assign bne = ~OP[5] & ~OP[4] & ~OP[3] & OP[2] & ~OP[1] & OP[0];
	//check J_format
	assign j = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & OP[1] & ~OP[0];
	assign jal = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & OP[1] & OP[0];
	//signal
	assign jump = jal || j;
	assign setLess = slti || sltiu;
	assign ALUSrc = lw || lui || sw || ori || setLess;
	
	assign memRE = lw;
	assign memWE = sw;
	assign regWE = ori || addu || subu || jr || lui || lw || jal || setLess;
	
	assign regStr[0] = lw || setLess;
	assign regStr[1] = jal || setLess;
	assign regDst[0] = addu || subu;
	assign regDst[1] = jal;
	assign EXTOp[0] = lui;
	assign EXTOp[1] = beq || lw || sw || setLess || bgez || bltz || bgtz || blez || bne;
	assign ALUOp[0] = subu;
	assign ALUOp[1] = ori;
endmodule
