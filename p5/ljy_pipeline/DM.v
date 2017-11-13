`timescale 1ns / 1ps
module DM(
    input [31:0] DataAdd,
    input [31:0] WriteData,
    input clk,
    input reset,
    input WriteEnable,
    input ReadEnable,
    output [31:0] ReadDataOut
    );
	reg [31:0]_DM[1023:0];
	
	integer i;
	assign ReadDataOut = ReadEnable ? _DM[DataAdd[11:2]]:32'b0;
	
	always @(posedge clk or posedge reset)begin
		if (reset)begin
			for (i=0;i<1024;i=i+1)
				_DM[i] = 32'b0;
		end
		else if (WriteEnable) begin
			$display ("*%h <= %h", DataAdd, WriteData);
			_DM[DataAdd[11:2]]= WriteData;
		end
	end
endmodule
