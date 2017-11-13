`timescale 1ns / 1ps
module mips(
	input clk,
	input reset
   );
	wire [31:0]NPC;
	wire [31:0]instr;
	wire [2:0]NPCOp;
	wire Zero,L, G, L_E, G_E, NE;
	wire [31:0]RData1;
	wire [4:0]rs;
	wire [4:0]rt;
	wire [4:0]rd;
	wire [4:0]RegAddr;
	wire RegWrite;
	wire [31:0]RegData;
	wire [31:0]RData2;
	wire [31:0]B;
	wire [31:0]C;
	wire [1:0]ALUOp;
	wire [15:0]offset;
	wire [1:0]EXTOp;
	wire [31:0]EXT_out;
	wire ALUSrc;
	wire [1:0]RegDst;
	wire [31:0]Data_out;//DM_out
	wire [1:0]MemtoReg;//RegData->GPR source
	wire MemWrite;
	wire MemRead;
	wire [5:0]op;
	wire [5:0]func;
	wire[31:0]jalpc;
	//alu
	wire sltiu;
	wire less;
	wire [4:0]Branch;

	assign rs = instr[25:21];
	assign rt = instr[20:16];
	assign rd = instr[15:11];
	assign offset = instr[15:0];
	assign op = instr[31:26];
	assign func = instr [5:0];
	assign Branch= instr[20:16];
	//ifu
	ifu ifu_b(
		.clk(clk),
		.reset(reset),
		.offset_ext(EXT_out),
		.RData1(RData1),
		.instr_index(instr[25:0]),
		.NPCOp(NPCOp),
		.Zero(Zero),
		.L(L),
		.G(G),
		.L_E(L_E), 
		.G_E(G_E), 
		.NE(NE),
		.NPC(NPC),
		.instr(instr),
		.jalpc(jalpc)
	);
	//RegDst
	mux_rd mux_rd_b(
		.R2(rt),
		.RD(rd),
		.RegDst(RegDst),
		.RegAddr(RegAddr)
	);
	//GPR
	GPR GPR_b(
		.clk(clk),
		.reset(reset),
		.Rs(rs),
		.Rt(rt),
		.RegAddr(RegAddr),
		.RegWrite(RegWrite),
		.RegData(RegData),
		.jalpc(jalpc),
		.RData1(RData1),
		.RData2(RData2)	
	);
	//ALUSrc
	mux_ALUSrc mux_ALUSrc_b(
		.RD2(RData2),
		.EXT(EXT_out),
		.ALUSrc(ALUSrc),
		.ALU_B(B)
	);
	//alu
	alu alu_b(
		.ALU_A(RData1),
		.ALU_B(B),
		.ALUOP(ALUOp),
		.sltiu(sltiu),
		.ALU_C(C),
		.ALU_ZERO(Zero),
		.L(L),
		.G(G),
		.L_E(L_E), 
		.G_E(G_E), 
		.NE(NE),
		.less(less)
	);
	//ext
	ext ext_b(
		.Din(offset),
		.EXTOP(EXTOp),
		.Dout(EXT_out)	
	);
	//DM
	DM DM_b(
		.addr(C),
		.din(RData2),
		.we(MemWrite),
		.re(MemRead),
		.clk(clk),
		.reset(reset),
		.dout(Data_out)	
	);
	//MemtoReg
	mux_MemtoReg mux_MemtoReg_b(
		.result(C),
		.ReadData(Data_out),
		.PCLink(jalpc),
		.MemtoReg(MemtoReg),
		.less(less),
		.RegData(RegData)	
	);
	//controller
	controller controller_b(
		.op(op),
		.func(func),
		.Branch(Branch),
		.NPCOp(NPCOp),
		.ALUOp(ALUOp),
		.RegWrite(RegWrite),
		.EXTOp(EXTOp),
		.MemWrite(MemWrite),
		.RegDst(RegDst),
		.ALUSrc(ALUSrc),
		.MemtoReg(MemtoReg),
		.setLess(setLess)		
	);
endmodule
