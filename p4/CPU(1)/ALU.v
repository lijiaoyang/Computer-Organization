
`timescale 1ns / 1ps
module ALU(A, B, ALUOp, sltiu, less, zero, G, L, G_E, L_E, NE, result);
	input [31:0] A;
	input [31:0] B;
	input [1:0] ALUOp;
	input sltiu;
	output zero, G, L, G_E, L_E, NE;
	output less;
	output reg [31:0] result;
	
	wire [31:0]C;
	
	assign zero = (A == B);
	assign G = (A == 0) ? 0 : ~A[31];
	assign L = (A == 0) ? 0 : A[31];
	assign G_E = ~A[31];
	assign L_E = (A == 0) ? 1 : A[31];
	assign NE = (A != B);
	assign C = A - B;
	assign less = sltiu ? A < B : A[31] > B[31] ? 1 : (A[31] == B[31]) ? C[31] : 0;
	
	always @* begin
		case(ALUOp)
			2'b00: result = A + B;
			2'b01: result = A - B;
			2'b10: result = A | B;
			default: result = 32'bx;
		endcase
	end

endmodule
