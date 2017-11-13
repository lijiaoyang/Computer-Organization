`timescale 1ns / 1ps
module DM(clk, reset, Addr, WE, RE, WD, RD);
	input clk, reset;
	input WE, RE;
	input [31:0] Addr;
	input [31:0] WD;
	output [31:0] RD;
	
	reg [31:0] _dm[1023:0];
	integer index;
	
	assign RD = RE ? _dm[Addr[11:2]] : 32'b0;
	
	initial begin
		for(index = 0; index < 1024; index = index +1)
			_dm[index] = 32'b0;
	end
	
	always @(posedge clk or posedge reset) begin
		if(reset)
			for(index = 0; index < 1024; index = index +1)
				_dm[index] <= 32'b0;
		else if(WE) begin
			_dm[Addr[11:2]] = WD;
			$display("*%h <= %h", Addr, WD);
		end
	end

endmodule
