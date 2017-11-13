`timescale 1ns / 1ps
module IF_ID(
	input clk,reset,IFID_CLR,IFID_EN,
	input [31:0]Instr_IN,PCPlus4_IN,
	output reg[31:0]Instr_OUT,PCPlus4_OUT
    );
	initial begin//必须初始化为0才能跑
		Instr_OUT <= 32'b0;
		PCPlus4_OUT <= 32'b0;
	end
	
	always @(posedge clk)begin
		if (reset || IFID_CLR)begin//重置或清零
			Instr_OUT <= 32'b0;
			PCPlus4_OUT <= 32'b0;
		end
		else if (IFID_EN)begin//使能端为1
			Instr_OUT <= Instr_IN;
			PCPlus4_OUT <= PCPlus4_IN;
		end
	end

endmodule



module ID_EX(
	input clk,reset,IDEX_CLR,IDEX_EN,
	input [31:0] Instr_IN, PCPlus4_IN, RD1_IN, RD2_IN, EXT_IN,
	output reg [31:0] Instr_OUT, PCPlus4_OUT, RD1_OUT, RD2_OUT, EXT_OUT
);
	always @(posedge clk)begin
		if (reset || IDEX_CLR)begin
			Instr_OUT = 32'b0;
			PCPlus4_OUT = 32'b0;
			RD1_OUT = 32'b0;
			RD2_OUT = 32'b0;
			EXT_OUT = 32'b0;			
		end
		else if (IDEX_EN)begin
			Instr_OUT = Instr_IN;
			PCPlus4_OUT = PCPlus4_IN;
			RD1_OUT = RD1_IN;
			RD2_OUT = RD2_IN;
			EXT_OUT = EXT_IN;			
		end
	end
	
endmodule



module EX_MEM(
	input clk,reset,EXMEM_CLR,
	input [31:0] Instr_IN, PCPlus4_IN, ALUResult_IN, RD2_IN,
	input [4:0] GPR_WA_IN,
	output reg[31:0] Instr_OUT, PCPlus4_OUT, ALUResult_OUT, RD2_OUT,
	output reg[4:0] GPR_WA_OUT
);
	always @(posedge clk)begin
		if (reset || EXMEM_CLR)begin
			Instr_OUT = 32'b0;
			PCPlus4_OUT = 32'b0;
			ALUResult_OUT = 32'b0;
			RD2_OUT = 32'b0;
			GPR_WA_OUT = 5'b0;
		end
		else begin
			Instr_OUT = Instr_IN;
			PCPlus4_OUT = PCPlus4_IN;
			ALUResult_OUT = ALUResult_IN;
			RD2_OUT = RD2_IN;
			GPR_WA_OUT = GPR_WA_IN;
		end
	end
endmodule



module MEM_WB(
	input clk,reset,MEMWB_CLR,
	input [4:0] GPR_WA_IN,
	input [31:0] Instr_IN, PCPlus4_IN, ALUResult_IN, MEM_IN,
	output reg[4:0] GPR_WA_OUT,
	output reg[31:0] Instr_OUT, PCPlus4_OUT, ALUResult_OUT, MEM_OUT
);
	always @(posedge clk)begin
		if (reset || MEMWB_CLR)begin
			Instr_OUT <= 32'b0;
			PCPlus4_OUT <= 32'b0;
			ALUResult_OUT <= 32'b0;
			MEM_OUT <= 32'b0;
			GPR_WA_OUT <= 5'b0;
		end
		else begin
			Instr_OUT <= Instr_IN;
			PCPlus4_OUT <= PCPlus4_IN;
			ALUResult_OUT <= ALUResult_IN;
			MEM_OUT <= MEM_IN;
			GPR_WA_OUT <= GPR_WA_IN;
		end
	end

endmodule
