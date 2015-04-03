`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/01 13:58:51
// Design Name: Harris
// Module Name: Harris
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


module Harris(diff_th, in_enable, in_data, out_enable, out_data);

	parameter color_width = 8;

	input[color_width - 1 : 0] diff_th;
	input in_enable;
	input[color_width * 9 - 1 : 0] in_data;
	output out_data;
	output out_enable;

	//top:2nd; left:4th; right:6th; bottom:8th; now:5th;
	wire signed [color_width : 0] top = {1'b0, in_data[2 * color_width - 1 : 1 * color_width]};
	wire signed [color_width : 0] left = {1'b0, in_data[4 * color_width - 1 : 3 * color_width]};
	wire signed [color_width : 0] right = {1'b0, in_data[6 * color_width - 1 : 5 * color_width]};
	wire signed [color_width : 0] bottom = {1'b0, in_data[8 * color_width - 1 : 7 * color_width]};
	wire signed [color_width : 0] now = {1'b0, in_data[5 * color_width - 1 : 4 * color_width]};

	wire signed [color_width : 0] diff_top = top - now;
	wire signed [color_width : 0] diff_left = left - now;
	wire signed [color_width : 0] diff_right = right - now;
	wire signed [color_width : 0] diff_bottom = bottom - now;

	wire signed [color_width : 0] diff_th_p = {1'b0, diff_th};
	wire signed [color_width : 0] diff_th_n = 0 - diff_th;

	wire en_top = 1 ? (diff_top >= diff_th_p) || (diff_top <= diff_th_n) : 0;
	wire en_left = 1 ? (diff_left >= diff_th_p) || (diff_left <= diff_th_n) : 0;
	wire en_right = 1 ? (diff_right >= diff_th_p) || (diff_right <= diff_th_n) : 0;
	wire en_bottom = 1 ? (diff_bottom >= diff_th_p) || (diff_bottom <= diff_th_n) : 0;

	assign out_data = (en_top & en_left) | (en_bottom & en_left) | (en_top & en_right) | (en_bottom & en_right);
	assign out_enable = in_enable;

endmodule