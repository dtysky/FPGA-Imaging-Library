`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: 
// Module Name: DataCombin3
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


module DataCombin3(i0, i1, i2, o);

	parameter data_width = 1;

	input[data_width - 1 : 0] i0, i1, i2;
	output[3 * data_width - 1 : 0] o;

	assign o = {i2, i1, i0};

endmodule