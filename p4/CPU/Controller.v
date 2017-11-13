`timescale 1ns / 1ps
module Controller(func, OP, beq, jump, jal, jr, regDst, regStr, ALUSrc, memRE, memWE, regWE, ALUOp, EXTOp);
	input [5:0]func;
	input [5:0]OP;
	output beq, jump, jal, jr;
	output ALUSrc;
	output memRE, memWE, regWE;
	output [1:0] ALUOp, EXTOp, regDst, regStr;
	
	wire R_Format, addu, subu, jr;		//R_format
	wire ori, lw, sw, beq, lui;			//I_format
	wire j, jal;								//J_format
	//check R_format
	assign R_Format = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & ~OP[1] & ~OP[0];
//	assign addu = R_Format & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & func[0];
	assign subu = R_Format & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];
	assign jr = R_Format & ~func[5] & ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];
	//check I_format
	assign ori = ~OP[5] & ~OP[4] & OP[3] & OP[2] & ~OP[1] & OP[0];
	assign lw = OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & OP[1] & OP[0];
	assign sw = OP[5] & ~OP[4] & OP[3] & ~OP[2] & OP[1] & OP[0];
	assign beq = ~OP[5] & ~OP[4] & ~OP[3] & OP[2] & ~OP[1] & ~OP[0];
	assign lui = ~OP[5] & ~OP[4] & OP[3] & OP[2] & OP[1] & OP[0];
	//check J_format
	assign j = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & OP[1] & ~OP[0];
	assign jal = ~OP[5] & ~OP[4] & ~OP[3] & ~OP[2] & OP[1] & OP[0];
	//signal
	assign jump = jal || j;
	assign ALUSrc = lw || lui || sw || ori;
	
	assign memRE = lw;
	assign memWE = sw;
	assign regWE = ori || R_Format || lui || lw || jal;
	
	assign regStr[0] = lw;
	assign regStr[1] = jal;
	assign regDst[0] = R_Format;
	assign regDst[1] = jal;
	assign EXTOp[0] = lui;
	assign EXTOp[1] = beq || lw || sw;
	assign ALUOp[0] = subu;
	assign ALUOp[1] = ori;
endmodule
