`timescale 1ns / 1ps
module controller(
    input [5:0] op,
    input [5:0] func,
	 input [4:0]Branch,//bgez or bltz
    output [2:0] NPCOp,
    output [1:0] ALUOp,
    output RegWrite,
    output [1:0] EXTOp,
    output MemWrite,
	 output [1:0]RegDst,
    output ALUSrc,
	 output [1:0]MemtoReg,
	 output setLess
   );
	wire R, addu, subu, jr;		//R
	wire ori, lw, sw, lui,slti,sltiu;//I
	wire j, jal;								//J
	wire beq, bgez, bgtz, blez, bltz, bne, b; //B
	//R
	assign R=~op[5] && ~op[4] &&~op[3] &&~op[2] &&~op[1] &&~op[1];
	assign addu = R & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & func[0];//100001
	assign subu = R & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];//100011
	assign jr   = R & ~func[5] & ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];//001000
	//I
	assign ori = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & op[0];
	assign lw = op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	assign sw = op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
	assign beq = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
	assign lui = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & op[0];
	assign slti = ~op[5] & ~op[4] & op[3] & ~op[2] & op[1] & ~op[0];
	assign sltiu = ~op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
	//b
	assign b = ~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0];
	assign beq = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
	assign bgez = b & ~Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & Branch[0];
	assign bltz = b & ~Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & ~Branch[0];
	assign bgtz = ~op[5] & ~op[4] & ~op[3] & op[2] & op[1] & op[0];
	assign blez = ~op[5] & ~op[4] & ~op[3] & op[2] & op[1] & ~op[0];
	assign bne = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & op[0];
	//J
	assign j = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];
	assign jal = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	////////////////////////////////////////////////////////////////////////////////////////////
	assign NPCOp = (beq ||  bgez || bgtz || blez ||bltz ||bne)?3'b001:
						(j)  ?3'b010:
						(jal)?3'b011:
						(jr) ?3'b100:
						3'b000;
	assign setLess = slti || sltiu;
	assign ALUOp[0] = subu;
	assign ALUOp[1] = ori;
	assign RegWrite = ori || addu || subu || lui || lw || jal||setLess;
	assign EXTOp[0] = lui;
	assign EXTOp[1] = beq || lw || sw ||setLess|| bgez || bltz || bgtz || blez || bne;
	assign MemWrite = sw;
	assign RegDst[0] = addu || subu;
	assign RegDst[1] = jal;
	assign ALUSrc = lw || lui || sw || ori ||setLess;//signext
	assign MemtoReg[0] = lw||setLess;
	assign MemtoReg[1] = jal||setLess;
endmodule
