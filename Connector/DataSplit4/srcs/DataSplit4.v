`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: 
// Module Name: DataSplit4
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


module DataSplit4(i, o0, o1, o2, o3);

	parameter data_width = 1;

	input[4 * data_width - 1 : 0] i;
	output[data_width - 1 : 0] o0, o1, o2, o3;

	assign o0 = i[1 * data_width - 1 : 0 * data_width];
	assign o1 = i[2 * data_width - 1 : 1 * data_width];
	assign o2 = i[3 * data_width - 1 : 2 * data_width];
	assign o3 = i[4 * data_width - 1 : 3 * data_width];

endmodule