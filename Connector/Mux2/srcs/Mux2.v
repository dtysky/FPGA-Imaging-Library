`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: 
// Module Name: Mux2
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


module Mux2(sel, i0, i1, o);

	parameter data_width = 8;

	input sel;
	input[data_width - 1 : 0] i0;
	input[data_width - 1 : 0] i1;
	output[data_width - 1 : 0] o;

	assign o = sel == 0 ? i0 : i1;

endmodule