`timescale 1ns / 1ps
module mips(
	input clk,
	input reset
   );
	wire [31:0]NPC;//��һ��ָ��ĵ�ַ
	wire [31:0]instr;//ָ��Ļ�����
	wire [2:0]NPCOp;//ָ��ı�ǣ�����ifu�ж�
	wire Zero,L, G, L_E, G_E, NE;//�ж�<,>,=,>=,<=,!=
	wire [31:0]RData1;//gpr �����RD1
	wire [31:0]RData2;//gpr �����RD2
	wire [4:0]rs;//instr[25:21]
	wire [4:0]rt;//instr[20:16]
	wire [4:0]rd;//instr[15:11]
	wire [4:0]RegAddr;//д��gpr
	wire RegWrite;//Ϊ1��ʾд��gpr
	wire [31:0]RegData;//д��gpr������
	wire [31:0]B;//ALU������˿�B
	wire [31:0]C;//ALU������˿�C
	wire [2:0]ALUOp;//ALU���ж����㷽ʽ
	wire [15:0]offset;//instr[15:0]
	wire [1:0]EXTOp;//�ַ���չ���ж�
	wire [31:0]EXT_out;//ext�Ľ��
	wire ALUSrc;//Ϊ1->ALU��B������Ϊextout������ΪRD2
	wire [1:0]RegDst;//�ж�д��gpr�ĵ�����rt����rd
	wire [31:0]Data_out;//DM_out
	wire [1:0]MemtoReg;//C or Data_out
	wire MemWrite;//�Ƿ�д��DM
	wire MemRead;//Data_out�����Ƿ�������
	wire [5:0]op;
	wire [5:0]func;
	wire sltiu,sltu;
	wire less;
	wire [4:0]Branch;
	wire sltless;
	wire [4:0]s_srlv;
	wire [4:0]s_srl;

	assign rs = instr[25:21];
	assign rt = instr[20:16];
	assign rd = instr[15:11];
	assign offset = instr[15:0];
	assign op = instr[31:26];
	assign func = instr [5:0];
	assign Branch = instr[20:16];
	assign s_srl = instr[10:6];
	//ifu
	ifu ifu_b(
		.clk(clk),
		.reset(reset),
		.offset_ext(EXT_out),
		.RData1(RData1),
		.instr_index(instr[25:0]),
		.NPCOp(NPCOp),
		.NPC(NPC),
		.instr(instr)
	);
	//RegDst
	mux_rd mux_rd_b(
		.Rt(rt),
		.Rd(rd),
		.RegDst(RegDst),
		.RegAddr(RegAddr)
	);
	//GPR
	GPR GPR_b(
		.clk(clk),
		.reset(reset),
		.Rs(rs),
		.Rt(rt),
		.RegDst(RegDst),
		.RegAddr(RegAddr),
		.RegWrite(RegWrite),
		.RegData(RegData),
		.NPC(NPC),
		.RData1(RData1),
		.RData2(RData2),
		.s_srlv(s_srlv)
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
		.sltu(sltu),
		.s_srlv(s_srlv),
		.s_srl(s_srl),
		.ALU_C(C),
		.ALU_ZERO(Zero),
		.L(L),
		.G(G),
		.L_E(L_E), 
		.G_E(G_E), 
		.NE(NE),
		.less(less),
		.sltless(sltless)
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
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.clk(clk),
		.reset(reset),
		.dout(Data_out)	
	);
	//MemtoReg
	mux_MemtoReg mux_MemtoReg_b(
		.result(C),
		.ReadData(Data_out),
		.PCLink(NPC),
		.MemtoReg(MemtoReg),
		.less(less),
		.RegData(RegData)	
	);
	//controller
	controller controller_b(
		.op(op),
		.func(func),
		.Branch(Branch),
		.instr(instr),
		.Zero(Zero),
		.G_E(G_E),// >=
		.NE(NE),// !=
		.G(G),// >
		.L_E(L_E),// <=
		.L(L),// <
		.NPCOp(NPCOp),
		.ALUOp(ALUOp),
		.RegWrite(RegWrite),
		.EXTOp(EXTOp),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.RegDst(RegDst),
		.ALUSrc(ALUSrc),
		.MemtoReg(MemtoReg),
		.setLess(setLess),
		.sltu(sltu)
	);
endmodule
