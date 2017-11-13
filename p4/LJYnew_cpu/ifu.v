`timescale 1ns / 1ps
module ifu(
	input clk,
	input reset,
	input [31:0]offset_ext,
	input [31:0]RData1,
	input [25:0]instr_index,
   input [2:0] NPCOp,
	output [31:0]NPC,
	output [31:0]instr
);
	reg [31:0] PC;
	reg [31:0] im[1023:0];
	assign instr = im[PC[11:2]];
	assign NPC = PC + 4;

	initial 
	begin
		$readmemh("code.txt",im);
		PC = 32'h3000;
	end
	always @(posedge clk or posedge reset)begin
		if (reset)
			PC <= 32'h3000;
			else begin
				case (NPCOp)
				3'b000: PC <= PC + 4;
				3'b001: PC <= PC + 4 + (offset_ext<<2);
				3'b010: PC <={PC[31:28],(instr_index<<2)};
				3'b011: PC <={PC[31:28],(instr_index<<2)};
				3'b100: PC <= RData1;
				endcase
			end
	end
endmodule
