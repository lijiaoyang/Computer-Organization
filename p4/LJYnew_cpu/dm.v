`timescale 1ns / 1ps
module DM(
    input [31:0] addr,
    input [31:0] din,
    input MemWrite,
	 input MemRead,
    input clk,
	 input reset,
    output [31:0] dout
    );
	 reg [31:0] DM[1023:0];
	 integer i;
	 
    assign dout = MemRead ? DM[addr[11:2]] : 32'b0;

	 initial begin//初始化
		for(i = 0; i < 1024; i = i+1)
			DM[i] = 32'b0;
	 end

	 always @(posedge clk or posedge reset)
	 begin
		if(reset)//重置
			for(i = 0; i < 1024; i = i+1)
				DM[i] <= 32'b0;
		else if (MemWrite)begin//写入
			DM[addr[11:2]] = din;
			$display ("*%h <= %h", addr, din);	
			end
	 end
	 
endmodule
