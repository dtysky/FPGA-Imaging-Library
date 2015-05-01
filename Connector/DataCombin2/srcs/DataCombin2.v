`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: 
// Module Name: DataCombin2
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


module DataCombin2(i0, i1, o);

	parameter data_width = 1;

	input[data_width - 1 : 0] i0, i1;
	output[2 * data_width - 1 : 0] o;

	assign o = {i1, i0};

endmodule