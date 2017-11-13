`timescale 1ns / 1ps
module MUX1(in1,in2,in3,less,op,out);
	input [31:0]in1, in2, in3;
	input less;
	input [1:0] op;
	output reg [31:0]out;
	always @* begin
		case(op)
			2'b00: out = in1;
			2'b01: out = in2;
			2'b10: out = in3;
			2'b11: out = {31'b0, less};
			default: out = 32'bx;
		endcase
	end
endmodule

module MUX2(in1,in2,op,out);
	input [4:0]in1, in2;
	input [1:0] op;
	output reg [4:0]out;
	always @* begin
		case(op)
			2'b00: out = in1;
			2'b01: out = in2;
			2'b10: out = 5'b11111;
			default: out = 32'bx;
		endcase
	end
endmodule

module MUX3(in1,in2,op,out);
	input [31:0]in1, in2;
	input op;
	output reg [31:0]out;
	always @* begin
		case(op)
			1'b0: out = in1;
			1'b1: out = in2;
			default: out = 32'bx;
		endcase
	end
endmodule
