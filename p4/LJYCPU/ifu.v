`timescale 1ns / 1ps
module ifu(
	input clk,
	input reset,
	input [31:0]offset_ext,
	input [31:0]RData1,
	input [25:0]instr_index,
   input [2:0] NPCOp,
	input Zero,L, G, L_E, G_E, NE,//b
	output [31:0]NPC,
	output [31:0]instr,
	output reg[31:0]jalpc
);
	reg [31:0]PC;
	reg [31:0]im[1023:0];
	assign instr = im[PC[11:2]];
	assign NPC = PC + 4;

	initial 
	begin
		$readmemh("code.txt",im);
		PC<=32'h3000;
	end
	always @(posedge clk or posedge reset)
	begin
		PC <= {PC[31:28],(instr_index<<2)};
		jalpc <= PC + 8;
		if (reset)
			PC <= 32'h3000;
			else begin
				if (NPCOp==1 && Zero==1||NPCOp==1 && L==1||NPCOp==1 && G==1||NPCOp==1 && L_E==1||NPCOp==1 && G_E==1||NPCOp==1 && NE==1)//beq,bgez, bgtz, blez, bltz, bne
						PC <= PC + 4 + (offset_ext<<2);
						else if (NPCOp==2)//j
							PC <= {PC[31:28],(instr_index<<2)};
							else if (NPCOp==3)//jal
								PC <= {PC[31:28],(instr_index<<2)};
								else if (NPCOp==4)//jr
									PC <= RData1;
									else PC <= PC+4;
			end
	end
endmodule
