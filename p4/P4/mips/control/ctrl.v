`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:40 11/17/2015 
// Design Name: 
// Module Name:    ctrl 
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
module ctrl(
    input [5:0] Op,
    input [5:0] Function,
    output reg [1:0] NPCOp,
    output reg [1:0] ALUOp,
    output reg RegWrite,
    output reg [1:0] EXTOp,
    output reg MemWrite,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg [1:0] WDSrc
    );
	 always @(*)
	 begin
		casex({Op,Function})
			12'b000000100001: {NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b00_00_1_xx_0_01_0_00;//00_00_1_00_0_01_0_00;
			12'b000000100011: {NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b00_01_1_xx_0_01_0_00;//00_01_1_00_0_01_0_00;
			12'b001101??????: {NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b0011100000100;
			12'b100011??????:	{NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b00_00_1_01_0_00_1_01;
			12'b101011??????:	{NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b00_00_0_01_1_xx_1_xx;//00_00_0_01_1_00_1_00;
			12'b000100??????:	{NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b01_01_0_xx_0_xx_0_xx;//01_01_0_00_0_00_0_00;
			12'b001111??????:	{NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b00_00_1_10_0_00_1_00;
			12'b000011??????:	{NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b10_xx_1_xx_0_10_x_10;//10_00_1_00_0_10_0_10;
			12'b000000001000:	{NPCOp,ALUOp,RegWrite,EXTOp,MemWrite,RegDst,ALUSrc,WDSrc} = 13'b11_xx_0_xx_0_xx_x_xx;//11_00_0_00_0_00_0_00;
		endcase
	 end

endmodule
