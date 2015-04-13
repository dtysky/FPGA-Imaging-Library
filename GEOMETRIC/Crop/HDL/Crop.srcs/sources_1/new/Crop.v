`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/13 14:26:56
// Design Name: Crop
// Module Name: Crop
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


module Crop(clk, rst_n, top, bottom, left, right, in_enable, in_data, out_enable, out_data, in_range);
	parameter color_width = 8;
	parameter im_bits_width = 9;
	parameter im_width = 320;
	parameter im_height = 240;

	input clk;
	input rst_n;
	input[im_bits_width - 1 : 0] top, bottom, left, right;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	output in_range;

	reg[im_bits_width - 1 : 0] now_x, now_y;

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			now_x <= 0;
		else if(now_x == im_width - 1)
			now_x <= 0;
		else
			now_x <= now_x + 1;
	end

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			now_y <= 0;
		else if(now_x == im_width - 1) begin 
			if(now_y == im_height - 1)
				now_y <= 0;
			else
				now_y <= now_y + 1;
		end else
			now_y <= now_y;
	end

	assign in_range = now_x >= left && now_x <= right && now_y >= top && now_y <= bottom ? 1 : 0;
	assign out_data = ~rst_n || ~in_enable || ~in_range ? 0 : in_data;
	assign out_enable = ~rst_n || ~in_enable ? 0 : 1;
	
endmodule