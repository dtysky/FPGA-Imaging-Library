`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/01 22:18:04
// Design Name: MatchTemplateBin
// Module Name: MatchTemplateBin
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MatchTemplateBin(template, in_enable, in_data, out_enable, out_data);

	parameter window_size = 3;

	input[ window_size * window_size - 1 : 0] template;
	input in_enable;
	input[ window_size * window_size - 1 : 0] in_data;
	output out_enable;
	output out_data;

	assign out_enable = in_enable;
	assign out_data = template == in_data ? 1 : 0;
endmodule