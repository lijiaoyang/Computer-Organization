`timescale 1ns / 1ps
module mips(
	input clk,
	input reset
   );
	wire [31:0]NPC;//下一条指令的地址
	wire [31:0]instr;//指令的机器码
	wire [2:0]NPCOp;//指令的标记，用于ifu判断
	wire Zero,L, G, L_E, G_E, NE;//判断<,>,=,>=,<=,!=
	wire [31:0]RData1;//gpr 的输出RD1
	wire [31:0]RData2;//gpr 的输出RD2
	wire [4:0]rs;//instr[25:21]
	wire [4:0]rt;//instr[20:16]
	wire [4:0]rd;//instr[15:11]
	wire [4:0]RegAddr;//写入gpr
	wire RegWrite;//为1表示写入gpr
	wire [31:0]RegData;//写入gpr的数据
	wire [31:0]B;//ALU的输入端口B
	wire [31:0]C;//ALU的输出端口C
	wire [2:0]ALUOp;//ALU的判断运算方式
	wire [15:0]offset;//instr[15:0]
	wire [1:0]EXTOp;//字符扩展的判断
	wire [31:0]EXT_out;//ext的结果
	wire ALUSrc;//为1->ALU的B端输入为extout，否则为RD2
	wire [1:0]RegDst;//判断写入gpr的到底是rt还是rd
	wire [31:0]Data_out;//DM_out
	wire [1:0]MemtoReg;//C or Data_out
	wire MemWrite;//是否写入DM
	wire MemRead;//Data_out里面是否有数据
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
