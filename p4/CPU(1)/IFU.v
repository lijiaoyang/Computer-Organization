`timescale 1ns / 1ps
module IFU(clk, reset, offset, target, branchE, bgez, bgtz, blez, bltz, bne, zero, L, G, L_E, G_E, NE, jump, jr, Addr, instr, nPC);
	input clk, reset;
	input [31:0] offset, Addr;
	input [25:0] target;
	input branchE, zero,bgez, bgtz, blez, bltz, bne,L, G, L_E, G_E, NE;
	input jump, jr;
	output [31:0] instr, nPC;
	reg [31:0] PC;
	reg [31:0] _im [1023:0];
	initial begin
		$readmemh("code.txt", _im);
		PC = 32'h3000;
	end
	assign instr = _im[PC[11:2]];
	assign nPC = PC + 4;
	always @(posedge clk or posedge reset)begin
		if(reset) PC <= 32'h3000;
		else begin
			if((branchE && zero) || (bgez && G_E) || (bgtz && G) || (blez && L_E) || (bltz && L) || (bne && NE)) PC <= PC + 4 +(offset << 2);
			else if(jump) PC <= {PC[31:28], (target << 2)};
			else if(jr) PC <= Addr;
			else PC <= PC + 4;
		end
	end
endmodule
