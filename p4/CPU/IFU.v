`timescale 1ns / 1ps
module IFU(clk, reset, offset, target, branchE, zero, jump, jr, Addr, instr, nPC);
	input clk, reset;
	input [31:0] offset, Addr;
	input [25:0] target;
	input branchE, zero;
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
			if(branchE && zero) PC <= PC + 4 +(offset << 2);
			else if(jump) PC <= {4'b0, (target << 2)};
			else if(jr) PC <= Addr;
			else PC <= PC + 4;
		end
	end
endmodule
