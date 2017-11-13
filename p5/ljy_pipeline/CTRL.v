`timescale 1ns / 1ps
module CTRL_ID(
	input [31:0]Instr,
	output [1:0]EXTOP,PCMUX,
	output DM_WED,//DM_WriteEn
	output BranchD,JRD
    );
	 
	wire [5:0]OP = Instr[31:26];
	wire [5:0]Func = Instr[5:0];
	wire [4:0]SHAMT = Instr[10:6];
	Decd CTRL_ID (
    .OP(OP), 
    .Func(Func), 
	 .SHAMT(SHAMT),
	 
    .ADDU(ADDU), 
    .SUBU(SUBU), 
    .ADD(ADD), 
    .SUB(SUB), 
    .AND(AND), 
    .OR(OR), 
    .XOR(XOR), 
    .SLL(SLL), 
    .SRL(SRL), 
    .ORI(ORI), 
    .LW(LW), 
    .SW(SW), 
    .LUI(LUI), 
    .ADDI(ADDI), 
    .ADDIU(ADDIU), 
    .BEQ(BEQ), 
    .BNE(BNE), 
    .J(J), 
    .JAL(JAL), 
    .JR(JR),
    .R_Type(R_Type), 
    .I_Type(I_Type), 
    .B_Type(B_Type), 
    .L_Type(L_Type), 
    .S_Type(S_Type), 
    .J_Type(J_Type) 
    );
	assign BranchD = B_Type; //涉及转发暂停才用
	assign JRD = JR;
	assign EXTOP = (ORI)?2'b00: //无符号扩展
						(LW || SW || BEQ || BNE || ADDI || ADDIU)?2'b01: //有符号扩展
						(LUI)?2'b10: //lui扩展
						2'bx;
	assign PCMUX = (J_Type||B_Type)?2'b01: //需要PC的计算，不是简单 【+4】
						2'b00;
	assign DM_WED = (S_Type) ? 1 :0; //SW 
endmodule



module CRTL_EX(
	input [31:0]Instr,
	output [3:0]ALUOP,
	output [1:0]ALU_B_MUX,
	output [1:0]GPR_WA_MUX,
	output REG_WEE,
	output [1:0]GPR_WD_MUXE
);
	wire [5:0]OP = Instr[31:26];
	wire [5:0]Func = Instr[5:0];
	wire [4:0]SHAMT = Instr[10:6];
	Decd CTRL_EX (
    .OP(OP), 
    .Func(Func), 
	 .SHAMT(SHAMT),
	 
    .ADDU(ADDU), 
    .SUBU(SUBU), 
    .ADD(ADD), 
    .SUB(SUB), 
    .AND(AND), 
    .OR(OR), 
    .XOR(XOR), 
    .SLL(SLL), 
    .SRL(SRL), 
    .ORI(ORI), 
    .LW(LW), 
    .SW(SW), 
    .LUI(LUI), 
    .ADDI(ADDI), 
    .ADDIU(ADDIU), 
    .BEQ(BEQ), 
    .BNE(BNE), 
    .J(J), 
    .JAL(JAL), 
    .JR(JR),
    .R_Type(R_Type), 
    .I_Type(I_Type), 
    .B_Type(B_Type), 
    .L_Type(L_Type), 
    .S_Type(S_Type), 
    .J_Type(J_Type) 
    );
	assign ALUOP = (ADD||ADDI||LW||SW) ? 4'b0000:
						(ADDU||ADDIU)? 		 4'b0001:
						(SUB)?					 4'b0010:
						(SUBU)?               4'b0011:
						(SLL)?                4'b0100:
						(SRL)?					 4'b0101:
						(AND)?					 4'b0110:
						(OR||ORI)?				 4'b0111:
						(XOR)?                4'b1000:
						(LUI)?					 4'b1001:
						
						4'bx;

	assign ALU_B_MUX = (R_Type)?2'b00: 
							(I_Type||L_Type||S_Type)? 2'b01: //B端口选EXTOUT 
							 2'bx;
	 assign GPR_WA_MUX = (I_Type || L_Type) ? 2'b00 : //写回rt
								(R_Type) ? 2'b01 : //写回rd
								(JAL) ? 2'b10 : //写回$31
								2'bxx;		
	assign REG_WEE = ADDU || SUBU || ORI || LW || LUI || JAL || ADD || SUB || XOR || SLL || SRL || AND || ADDI || ADDIU || OR;

	assign GPR_WD_MUXE =  (L_Type)?2'b01: //写回从DM读出的数据
								(JAL)?2'b10: //写回pc+8
								2'b00;
endmodule


module CRTL_MEM(
	input [31:0]Instr,
	output DM_WEM,
	output DM_REM,
	output REG_WEM,
	output [1:0]GPR_WD_MUXM
);
	wire [5:0]OP = Instr[31:26];
	wire [5:0]Func = Instr[5:0];
	wire [4:0]SHAMT = Instr[10:6];
	Decd CTRL_MEM (
    .OP(OP), 
    .Func(Func), 
	 .SHAMT(SHAMT),
	 
    .ADDU(ADDU), 
    .SUBU(SUBU), 
    .ADD(ADD), 
    .SUB(SUB), 
    .AND(AND), 
    .OR(OR), 
    .XOR(XOR), 
    .SLL(SLL), 
    .SRL(SRL), 
    .ORI(ORI), 
    .LW(LW), 
    .SW(SW), 
    .LUI(LUI), 
    .ADDI(ADDI), 
    .ADDIU(ADDIU), 
    .BEQ(BEQ), 
    .BNE(BNE), 
    .J(J), 
    .JAL(JAL), 
    .JR(JR),
    .R_Type(R_Type), 
    .I_Type(I_Type), 
    .B_Type(B_Type), 
    .L_Type(L_Type), 
    .S_Type(S_Type), 
    .J_Type(J_Type) 
    );
	assign DM_REM = L_Type;
	assign DM_WEM = S_Type;
	assign REG_WEM = ADDU || SUBU || ORI || LW || LUI || JAL || ADD || SUB || XOR || SLL || SRL || AND || ADDI || ADDIU || OR;
	assign GPR_WD_MUXM =  (L_Type)?2'b01:
								(JAL)?2'b10:
								2'b00;
endmodule


module CTRL_WB(
	input [31:0]Instr,
	output REG_WEW,
	output [1:0]GPR_WD_MUXW
);
	wire [5:0]OP = Instr[31:26];
	wire [5:0]Func = Instr[5:0];
	wire [4:0]SHAMT = Instr[10:6];
	Decd CTRL_WB (
    .OP(OP), 
    .Func(Func), 
	 .SHAMT(SHAMT),
	 
    .ADDU(ADDU), 
    .SUBU(SUBU), 
    .ADD(ADD), 
    .SUB(SUB), 
    .AND(AND), 
    .OR(OR), 
    .XOR(XOR), 
    .SLL(SLL), 
    .SRL(SRL), 
    .ORI(ORI), 
    .LW(LW), 
    .SW(SW), 
    .LUI(LUI), 
    .ADDI(ADDI), 
    .ADDIU(ADDIU), 
    .BEQ(BEQ), 
    .BNE(BNE), 
    .J(J), 
    .JAL(JAL), 
    .JR(JR),
    .R_Type(R_Type), 
    .I_Type(I_Type), 
    .B_Type(B_Type), 
    .L_Type(L_Type), 
    .S_Type(S_Type), 
    .J_Type(J_Type) 
    );
	assign REG_WEW = ADDU || SUBU || ORI || LW || LUI || JAL || ADD || SUB || XOR || SLL || SRL || AND || ADDI || ADDIU || OR;
	assign GPR_WD_MUXW =  (L_Type)?2'b01:
								 (JAL)?2'b10:
								 2'b00;
endmodule
