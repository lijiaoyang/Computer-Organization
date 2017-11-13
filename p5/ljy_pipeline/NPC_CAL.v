`timescale 1ns / 1ps
module NPC_CAL(
    input [31:0]Instr,
    input [31:0]PCPlus4,
    input [31:0]JR_READ,//GPR[rs]
	 
    input BIG_ZERO,
    input EQUAL_ZERO,
    input LESS_ZERO,
    input EQUAL,
    output[31:0]NPC
    );
	 wire [5:0]OP = Instr[31:26];
	 wire [5:0]Func = Instr[5:0];
	 wire [4:0]SHAMT = Instr[10:6];
	Decd NPC_CAL(
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

	assign NPC =   ( (BEQ&&EQUAL) || (BNE&& !EQUAL))? PCPlus4+{{14{Instr[15]}},Instr[15:0],2'b0}: 
						(J || JAL)?	  {PCPlus4[31:28], (Instr[25:0] << 2)}:
						(JR)?			  JR_READ:
						PCPlus4+4;


endmodule
