`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:26:55 11/17/2015 
// Design Name: 
// Module Name:    mips 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mips(
    input clk,
    input rst
    );
	 wire [31:2] PC;
	 wire [31:2] NPC;
	 wire [31:0] instr;
	 wire [1:0] NPCOp;
	 wire Zero;
	 wire [31:0] RData1;	//GPR->RData1
	 wire [31:0] PCLink;
	 wire [4:0] rs;		//from instr
	 wire [4:0] rt;
	 wire [4:0] rd;		
	 wire [4:0] r3;
	 wire RegWrite;		//GPR write enable
	 wire [31:0] WData;	//WData->GPR
	 wire [31:0] RData2;	//GPR->RData2
	 //wire [31:0] A;
	 wire [31:0] B;
	 wire [31:0] C;
	 wire [1:0] ALUOp;
	 wire [15:0] offset;		//ext din,from instr[15:0]
	 wire [1:0] EXTOp;
	 wire [31:0] EXT_out;
	 wire ALUSrc;				//B->AlU source
	 wire [1:0] RegDst;		//RD->GPR source
	 wire [31:0] Data_out;	//DM_out
	 wire [1:0] WDSrc;		//WData->GPR  source
	 wire MemWrite;
	 wire [5:0] Op;
	 wire [5:0] Function;
	 
	 pc pc_ins (NPC,clk,rst,PC);
	 npc npc_ins (PC,instr,NPCOp,Zero,RData1,NPC,PCLink);
	 im_4k im_4k_ins (PC[11:2],instr);
	 assign rs = instr[25:21];
	 assign rt = instr[20:16];
	 assign rd = instr[15:11];
	 gpr gpr_ins (clk,rst,rs,rt,r3,RegWrite,WData,RData1,RData2);
	 alu alu_ins (RData1,B,ALUOp,C,Zero);
	 assign offset = instr[15:0];
	 ext ext_ins (offset,EXTOp,EXT_out);
	 mux_ALUSrc mux_ALUSrc_ins (RData2,EXT_out,ALUSrc,B);
	 mux_Rd mux_Rd_ins (rt,rd,RegDst,r3);
	 mux_WDSrc mux_WDSrc_ins (C,Data_out,PCLink,WDSrc,WData);
	 dm_4k dm_4k_ins (C[11:2],RData2,MemWrite,clk,Data_out);
	 assign Op = instr[31:26];
	 assign Function = instr[5:0];
	 ctrl ctrl_ins (Op,Function,NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc);

endmodule
