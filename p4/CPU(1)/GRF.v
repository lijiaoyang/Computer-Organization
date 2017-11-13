`timescale 1ns / 1ps
module GRF(clk, reset, RA1, RA2, WE, WA, WD, RD1, RD2);
	input clk, reset;
	input [4:0] RA1, RA2;
	input WE;
	input [4:0] WA;
	input [31:0] WD;
	output [31:0] RD1, RD2;
	
	reg [31:0] _reg[31:0];
	integer index;
	
	initial begin
		for(index = 0; index < 32; index = index + 1)
			_reg[index] <= 32'b0;
	end
	
	assign RD1 = _reg[RA1];
	assign RD2 = _reg[RA2];
	
	always@(posedge clk or posedge reset) begin
		if (reset)
			for(index = 0; index < 32; index = index + 1)
				_reg[index] <= 32'b0;
		else if(WE) begin
			if(WA == 0) _reg[WA] <= 32'b0;
			else begin
				_reg[WA] = WD;
				$display("$%d <= %h", WA, WD);
			end
		end
	end

endmodule
