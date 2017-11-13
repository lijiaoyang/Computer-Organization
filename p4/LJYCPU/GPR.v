`timescale 1ns / 1ps
module GPR(
	 input clk,
	 input reset,
    input [4:0] Rs,
    input [4:0] Rt,
    input [4:0] RegAddr,
    input RegWrite,
    input [31:0] RegData,
	 input [31:0] jalpc,
    output [31:0] RData1,
    output [31:0] RData2
    );
	 reg [31:0] _reg[31:0];
	 integer i;
	 assign RData1=_reg[Rs];
	 assign RData2=_reg[Rt];
	 initial begin
		for (i=0;i<32;i=i+1)
			_reg[i]<=32'b0;
	 end
	 always @(posedge clk or posedge reset) begin
		if (reset)
			for (i=0;i<32;i=i+1)
				_reg[i] <= 32'b0;
		else if(RegWrite)begin
			if (RegAddr==0)
				_reg[RegAddr] <= 32'b0;
			else if (RegAddr!=5'b11111)begin
				_reg[RegAddr] <= RegData;
				$display("$%d <= %h", RegAddr, RegData);
			end
			else if (RegAddr==5'b11111)begin
				_reg[RegAddr] <= jalpc;
				$display("$%d <= %h", RegAddr, jalpc);
			end
		end
	 end
endmodule
