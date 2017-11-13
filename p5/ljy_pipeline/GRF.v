`timescale 1ns / 1ps
module GRF(
	input clk,reset,
	input [4:0]RS,RT,WriteAdd,
	input [31:0]WriteData,
	input GPR_WriteEnable,
	output [31:0]RD1,RD2	
    );
	reg [31:0]_reg[31:0];
	
	integer i;
	/////¥¶¿Ìªÿ–¥≥ÂÕª
	assign RD1 = (GPR_WriteEnable && (RS==WriteAdd) && WriteAdd!=0 && RS!=0)? WriteData:(RS==0)?0:_reg[RS];
	assign RD2 = (GPR_WriteEnable && (RT==WriteAdd) && WriteAdd!=0 && RT!=0)? WriteData:(RT==0)?0:_reg[RT];
	
	always @(posedge clk or posedge reset) begin 
		if (reset)begin
			for (i=0;i<32;i=i+1)
				_reg[i] = 32'b0;
		end
		else if (GPR_WriteEnable)begin
			if (WriteAdd==0)
				_reg[WriteAdd] <= 32'b0;
			else begin
				$display("$%d <= %h", WriteAdd, WriteData);
				_reg[WriteAdd]=WriteData;
			end				
		end
	end

endmodule
