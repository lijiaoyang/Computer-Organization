`timescale 1ns / 1ps
module IM(
    input [31:0] Addr,
    output [31:0] Instr
    );
	reg [31:0]_im[1023:0];
	
	initial begin
		$readmemh("code.txt", _im);
	end

	assign Instr = _im[Addr[11:2]];
endmodule
