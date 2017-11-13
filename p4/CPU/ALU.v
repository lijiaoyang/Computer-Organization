`timescale 1ns / 1ps
module ALU(A, B, ALUOp, zero, result);
	input [31:0] A;
	input [31:0] B;
	input [1:0] ALUOp;
	output zero;
	output reg [31:0] result;
	
	assign zero = (A == B);
	
	always @* begin
		case(ALUOp)
			2'b00: result = A + B;
			2'b01: result = A - B;
			2'b10: result = A | B;
			default: result = 32'bx;
		endcase
	end

endmodule
