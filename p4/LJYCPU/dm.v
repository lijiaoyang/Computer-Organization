`timescale 1ns / 1ps
module DM(
    input [31:0] addr,
    input [31:0] din,
    input we,
	 input re,
    input clk,
	 input reset,
    output [31:0] dout
    );
	 reg [31:0] DM[1023:0];
	 integer i;

    assign dout =DM[addr[11:2]];
	 initial begin
		for(i = 0; i < 1024; i = i+1)
			DM[i] = 32'b0;
	 end

	 always @(posedge clk or posedge reset)
	 begin
		if(reset)
			for(i = 0; i < 1024; i = i+1)
				DM[i] <= 32'b0;
		else if (we)begin
			DM[addr[11:2]]<=din;
			$display ("*%h <= %h", addr, din);	
			end
	 end
endmodule
