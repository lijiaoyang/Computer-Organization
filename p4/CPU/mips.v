`timescale 1ns / 1ps
module mips(clk, reset);
	input clk;
	input reset;
	//ifu
	wire [31:0]offset;
	wire beq, zero, jump;
	wire [31:0]instr, nPC;
	//grf
	wire regWE;
	wire [4:0]writeReg;
	wire [31:0]RegWD;
	wire [31:0]regRD1, regRD2;
	//alu
	wire [31:0] B;
	wire [1:0] ALUOp;
	wire [31:0] result;
	//ext
	wire [1:0] EXTOp;
	wire [31:0] extOffTar;
	//dm
	wire memWE, memRE;
	wire [31:0] memWD, memRD;
	//Ctrl
	wire jal,jr;
	wire [1:0]regDst, regStr;
	wire ALUSrc;
	IFU ifu(
		.clk(clk), 
		.reset(reset),
		.offset(offset),
		.target(instr[25:0]), 
		.branchE(beq), 
		.zero(zero), 
		.jump(jump), 
		.jr(jr),
		.Addr(regRD1),
		.instr(instr), 
		.nPC(nPC)
		);
		
	MUX2 regdst (
		.in1(instr[20:16]), 
		.in2(instr[15:11]), 
		.op(regDst), 
		.out(writeReg)
		);
	 
	GRF grf(
		.clk(clk), 
		.reset(reset), 
		.RA1(instr[25:21]), 
		.RA2(instr[20:16]), 
		.WE(regWE), 
		.WA(writeReg), 
		.WD(RegWD), 
		.RD1(regRD1), 
		.RD2(regRD2)
		);
	
	MUX3 alusrc (
		.in1(regRD2), 
		.in2(offset), 
		.op(ALUSrc), 
		.out(B)
		);
	 
	ALU alu(
		.A(regRD1), 
		.B(B), 
		.ALUOp(ALUOp), 
		.zero(zero), 
		.result(result)
		);
		
	EXT ext(
		.offImm(instr[15:0]),
		.EXTOp(EXTOp), 
		.extOff(offset)
		);
		
	DM dm(
		.clk(clk), 
		.reset(reset), 
		.Addr(result), 
		.WE(memWE), 
		.RE(memRE), 
		.WD(regRD2), 
		.RD(memRD)
		);
		
	MUX1 regstr (
		.in1(result), 
		.in2(memRD), 
		.in3(nPC),  
		.op(regStr), 
		.out(RegWD)
		);
		
	Controller Ctrl(
		.func(instr[5:0]), 
		.OP(instr[31:26]), 
		.beq(beq), 
		.jump(jump), 
		.jal(jal), 
		.jr(jr), 
		.regDst(regDst), 
		.regStr(regStr), 
		.ALUSrc(ALUSrc), 
		.memRE(memRE), 
		.memWE(memWE), 
		.regWE(regWE), 
		.ALUOp(ALUOp), 
		.EXTOp(EXTOp)
		);
	
endmodule
