`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: 
// Module Name: Mux4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependenrgb24es: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux4(sel, i0, i1, i2, i3, o);

	parameter data_width = 8;

	input[1 : 0] sel;
	input[data_width - 1 : 0] i0;
	input[data_width - 1 : 0] i1;
	input[data_width - 1 : 0] i2;
	input[data_width - 1 : 0] i3;
	output[data_width - 1 : 0] o;
	
	reg[data_width - 1 : 0] reg_o;

	always @(*) begin
		case (sel)
			0 : reg_o <= i0;
			1 : reg_o <= i1;
			2 : reg_o <= i2;
			3 : reg_o <= i3;
			default : /* default */;
		endcase
	end

	assign o = reg_o;

endmodule