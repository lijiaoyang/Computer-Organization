`timescale 1ns / 1ps
module PC(
    input clk,
    input reset,
    input PCEnable,
    input [31:0] PCIn,
    output reg[31:0] PCOut
    );
	 
	always @(posedge clk or posedge reset)begin
		if (reset) PCOut <= 32'h00003000;
		else if (PCEnable) PCOut <= PCIn;
	end

endmodule
