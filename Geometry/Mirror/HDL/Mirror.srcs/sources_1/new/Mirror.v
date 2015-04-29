/*
Image processing project : Mirror.

Function: Getting a mirror of your given image.

Main module.

Copyright (C) 2015  Dai Tianyu (dtysky)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Documents for all modules:
	http://ifl.dtysky.moe

All modules for image processing project:
	https://github.com/dtysky/FPGA-Imaging-Library

This mail is for connecting me:
	dtysky@outlook.com

My blog is here:
	http://dtysky.moe

*/

`timescale 1ns / 1ps

module Mirror(
	clk,
	rst_n,
	mode,
	in_enable,
	in_data,
	in_count_x,
	in_count_y,
	out_enable,
	out_data,
	out_count_x,
	out_count_y);

	parameter color_width = 8;
	parameter im_width = 320;
	parameter im_height = 240;
	parameter im_width_bits = 9;
	
	input clk, rst_n;
	//0 for horizontal, 1 for vertical, 2 for all
	input[1 : 0] mode;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	input[im_width_bits - 1 : 0] in_count_x, in_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	output[im_width_bits - 1 : 0] out_count_x, out_count_y;

	reg[im_width_bits - 1 : 0] reg_out_x, reg_out_y;
	reg[color_width - 1 : 0] reg_out_data;
	reg reg_out_enable;
	
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_out_enable <= 0;
		else
			reg_out_enable <= 1;
	end

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_out_data <= 0;
		else
			reg_out_data <= in_data;
	end

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_out_x <= 0;
		else begin
			case (mode)
				1 : reg_out_x <= in_count_x;
				default : reg_out_x <= im_width - in_count_x;
			endcase
		end
	end

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_out_y <= 0;
		else begin 
			case (mode)
				0 : reg_out_y <= in_count_y;
				default : reg_out_y <= im_width - in_count_y;
			endcase
		end
	end

	assign out_enable = reg_out_enable;
	assign out_count_x = reg_out_x;
	assign out_count_y = reg_out_y;
	assign out_data = reg_out_data;

endmodule