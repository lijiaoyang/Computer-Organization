`timescale 1ns / 1ps
module GPR(
	 input clk,
	 input reset,
    input [4:0] Rs,
    input [4:0] Rt,
	 input [1:0]RegDst,
	 input [4:0]RegAddr,
    input RegWrite,
    input [31:0] RegData,
	 input [31:0] NPC,
    output [31:0] RData1,
    output [31:0] RData2,
	 output [4:0]s_srlv
    );
	 reg [31:0] _reg[31:0];//定义一个32个32位的寄存器堆
	 integer i;
	 assign s_srlv = _reg[Rs][4:0];
	 assign RData1=_reg[Rs];
	 assign RData2=_reg[Rt];
	 initial begin//初值为0
		for (i=0;i<32;i=i+1)
			_reg[i]<=32'b0;
	 end
	 always @(posedge clk or posedge reset) begin
		if (reset)//重置
			for (i=0;i<32;i=i+1)
				_reg[i] <= 32'b0;
		else if(RegWrite)begin
			if (RegAddr==0)
				_reg[RegAddr] <= 32'b0;
			else if (RegDst!=2'b10)begin
				_reg[RegAddr] <= RegData;
				$display("$%d <= %h", RegAddr, RegData);
			end
			else if (RegDst==2'b10)begin
				_reg[RegAddr] <= NPC;
				$display("$%d <= %h", RegAddr, NPC);
			end
		end
	 end
endmodule
