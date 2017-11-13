`timescale 1ns / 1ps
`define rs 25:21
`define rt 20:16
`define rd 15:11

module SH(
	input BranchD, JRD,REG_WEE,DM_WED,
	input [31:0]InstrD,
	input [4:0]WB_REGE, WB_REGM,
	input [1:0]GPR_WD_MUXE,GPR_WD_MUXM,
	output IFID_EN,
	output IDEX_CLR,
	output PCWriteEnable
);
	wire jrstall,branchstall,lwstall;
	wire letbreak;
	
	assign jrstall = (JRD && REG_WEE &&(InstrD[`rs]!=0 && InstrD[`rs]==WB_REGE) && (GPR_WD_MUXE==2'b00 ||GPR_WD_MUXE==2'b01))
	||(JRD && (GPR_WD_MUXM==2'b01) &&(InstrD[`rs]!=0 && InstrD[`rs]==WB_REGM));
	
	assign lwstall =(GPR_WD_MUXE == 2'b01) && ((WB_REGE == InstrD[`rs] && InstrD[`rs]!=0) || (WB_REGE == InstrD[`rt] && InstrD[`rt]!=0 && !DM_WED));
	
	assign branchstall = (BranchD && (GPR_WD_MUXE==2'b00 ||GPR_WD_MUXE==2'b01) && ((InstrD[`rs]!=0 && InstrD[`rs]==WB_REGE)||(InstrD[`rt]!=0 && InstrD[`rt]==WB_REGE)))||
	(BranchD && GPR_WD_MUXM==2'b01 &&((InstrD[`rs]!=0 && InstrD[`rs]==WB_REGM)||(InstrD[`rt]!=0 && InstrD[`rt]==WB_REGM)));
	
	assign letbreak = jrstall || branchstall || lwstall ;
	assign IFID_EN = !letbreak;
	assign IDEX_CLR = letbreak;
	assign PCWriteEnable = !letbreak;
endmodule

module FH(
	input [31:0]InstrD, InstrE, InstrM,
	input [4:0]WB_REGM, WB_REGE, WB_REGW, 
	input REG_WEE, REG_WEM, REG_WEW, DM_WEM,
	input [1:0] GPR_WD_MUXE, GPR_WD_MUXW,
	output [1:0] MUX_RD1_Comp_Signal, MUX_RD2_Comp_Signal, MUX_ALU_A_Signal, MUX_ALU_B_Signal, MUX_DM_WD_Signal
);
	assign MUX_RD1_Comp_Signal = (InstrD[`rs]!=0 && InstrD[`rs]==WB_REGM && REG_WEM)?2'b01:
										  (InstrD[`rs]!=0 && InstrD[`rs]==WB_REGE && REG_WEE && GPR_WD_MUXE==2'b10)?2'b10:
										  2'b00;//其实就是GPR[rs]的转发，这里删了jr
	assign MUX_RD2_Comp_Signal = (InstrD[`rt]!=0 && InstrD[`rt]==WB_REGM && REG_WEM)?2'b01:
										  (InstrD[`rt]!=0 && InstrD[`rt]==WB_REGE && REG_WEE && GPR_WD_MUXE==2'b10)?2'b10:
										  2'b00;//其实就是GPR[rt]的转发
	assign MUX_ALU_A_Signal = ((InstrE[`rs] != 0) && (InstrE[`rs] == WB_REGM) && REG_WEM)? 2'b10:
									  ((InstrE[`rs] != 0) && (InstrE[`rs] == WB_REGW) && REG_WEW)? 2'b01:
							        2'b00;
	assign MUX_ALU_B_Signal = ((InstrE[`rt] != 0) && (InstrE[`rt] == WB_REGM) && REG_WEM)? 2'b10:
									  ((InstrE[`rt] != 0) && (InstrE[`rt] == WB_REGW) && REG_WEW)? 2'b01:
							        2'b00;
	assign MUX_DM_WD_Signal = ((InstrM[`rt] != 0) && (InstrM[`rt] == WB_REGW) && DM_WEM && (GPR_WD_MUXW == 2'b01));
endmodule

	