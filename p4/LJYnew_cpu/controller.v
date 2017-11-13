`timescale 1ns / 1ps
module controller(
    input [5:0] op,
    input [5:0] func,
	 input [4:0]Branch,//bgez 
	 input [31:0]instr,
	 input Zero,G_E,NE,G,L_E,L,
    output [2:0] NPCOp,
    output [2:0] ALUOp,
    output RegWrite,
    output [1:0] EXTOp,
    output MemWrite,
	 output MemRead,
	 output [1:0]RegDst,
    output ALUSrc,
	 output [1:0]MemtoReg,
	 output setLess,
	 output sltu
   );
	wire R, addu, subu, jr,srl,srlv;		//R
	wire ori, lw, sw, lui,slti,sltiu,slt;			//I
	wire j, jal;								//J
	wire beq, bgez, bgtz, blez, bltz, bne, b, bgezal,B,bltzal; //Branch
	//R
	assign R=~op[5] && ~op[4] &&~op[3] &&~op[2] &&~op[1] &&~op[0];
	assign addu = R & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & func[0];//100001
	assign subu = R & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];//100011
	assign jr   = R & ~func[5] & ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];//001000
	assign sltu = R & func[5] & ~func[4] & func[3] & ~func[2] & func[1] & func[0];//101011
	assign srl = R & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];//000010
	assign srlv = R & ~func[5] & ~func[4] & ~func[3] & func[2] & func[1] & ~func[0];//000110
	//I
	assign ori = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & op[0];
	assign lw = op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	assign sw = op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
	assign beq = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
	assign lui = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & op[0];
	assign slti = ~op[5] & ~op[4] & op[3] & ~op[2] & op[1] & ~op[0];
	assign sltiu = ~op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
	assign slt = R & func[5] & ~func[4] & func[3] & ~func[2] & func[1] & ~func[0];//101010
	//b
	assign b = ~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0];
	assign beq = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
	assign bgez = b & ~Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & Branch[0];
	assign bltz = b & ~Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & ~Branch[0];
	assign bgtz = ~op[5] & ~op[4] & ~op[3] & op[2] & op[1] & op[0];
	assign blez = ~op[5] & ~op[4] & ~op[3] & op[2] & op[1] & ~op[0];
	assign bne = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & op[0];
	assign bgezal = b & Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & Branch[0];//10001
	assign bltzal = b & Branch[4] & ~Branch[3] & ~Branch[2] & ~Branch[1] & ~Branch[0];//10000
	assign B = 	~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0] & ~instr[25] & ~instr[24] & ~instr[23] & ~instr[22] & ~instr[21] & ~instr[20] & ~instr[19] & ~instr[18] & ~instr[17] & ~instr[16];

	//J
	assign j = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];
	assign jal = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	////////////////////////////////////////////////////////////////////////////////////////////
	assign NPCOp = (beq && Zero|| bgezal && G_E || bltzal && L || bgez && G_E ||bne && NE ||bgtz && G ||blez && L_E||bltz && L||B)?3'b001:
						(j)  ?3'b010:
						(jal)?3'b011:
						(jr) ?3'b100:
						3'b000;
	assign setLess = slti || sltiu;
	assign ALUOp[0] = subu || slt || srl;//slt==011  srl == 101
	assign ALUOp[1] = ori||slt ;
	assign ALUOp[2] = srl||srlv;//srlv==100
	assign RegWrite = ori || addu || subu || lui || lw || jal|| setLess || slt || sltu|| srl|| bgezal|| bltzal|| srlv ; 
	assign EXTOp[0] = lui;
	assign EXTOp[1] = beq || lw || sw ||setLess|| bgez || bltz || bgtz || blez || bne ||bgezal || bltzal;
	assign MemWrite = sw;
	assign MemRead  = lw;
	assign RegDst[0] = addu || subu ||slt ||sltu||srl||srlv;//01 –¥»ÎRd
	assign RegDst[1] = jal|| bgezal|| bltzal;//10 –¥»Î$31
	assign ALUSrc= lw || lui || sw || ori ||setLess;//signext
	assign MemtoReg[0] = lw||setLess||sltu;
	assign MemtoReg[1] = jal||setLess||sltu ||bgezal || bltzal;
endmodule
