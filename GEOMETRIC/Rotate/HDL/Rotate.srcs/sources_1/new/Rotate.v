/*
Image processing project : Rotate.

Function: Rotating an image by your given angle.

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

Homepage for this project:
	http://ifl.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe

*/

`timescale 1ns / 1ps

module Rotate(
	clk,
	rst_n,
	scale_x,
	scale_y,
	in_enable,
	frame_in_enable,
	frame_in_data,
	frame_out_enable,
	frame_out_count_x,
	frame_out_count_y,
	out_enable,
	out_data);

	parameter color_width = 8;
	parameter im_width = 320;
	parameter im_height = 240;
	parameter im_width_bits = 9;
	
	input clk, rst_n;
	//16{integer}.16{decimal}
	input[31 : 0] scale_x, scale_y;
	input in_enable;
	input frame_in_enable;
	input frame_in_data;
	input[color_width - 1 : 0] frame_in_data;
	output frame_out_enable;
	output[im_width_bits - 1 : 0] frame_out_count_x, frame_out_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;

	reg[im_width_bits - 1 : 0] reg_count_x, reg_count_y;
	wire[im_width_bits - 1 : 0] count_x = reg_count_x;
	wire[im_width_bits - 1 : 0] count_y = reg_count_y;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_count_x <= 0;
		else if(reg_count_x == im_width - 1)
			reg_count_x <= 0;
		else
			reg_count_x <= reg_count_x + 1;
	end

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_count_y <= 0;
		else if(reg_count_x == im_width - 1 && reg_count_y == im_height - 1)
			reg_count_y <= 0;
		else if(reg_count_x == im_width - 1)
			reg_count_y <= reg_count_y + 1;
		else
			reg_count_y <= reg_count_y;
	end


	wire[47 : 0] mul_x_p, mul_y_p;
	Multiplier16x32 MulX(clk, {{16 - im_width_bits{1'b0}}, count_x}, scale_x, mul_x_p);
	Multiplier16x32 MulY(clk, {{16 - im_width_bits{1'b0}}, count_y}, scale_y, mul_y_p);

	assign frame_out_count_x = mul_x_p[im_width_bits + 16 : 16];
	assign frame_out_count_y = mul_y_p[im_width_bits + 16 : 16];

	reg[2 : 0] con_mul_enable;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			con_mul_enable <= 0;
		else if(con_mul_enable == 4)
			con_mul_enable <= con_mul_enable;
		else
			con_mul_enable <= con_mul_enable + 1;
	end
	assign frame_out_enable = con_mul_enable == 4 ? 1 : 0;

	assign out_enable = ~rst_n || ~frame_in_enable ? 0 : 1;
	assign out_data = 
		mul_x_p[47 : 16] >= im_width || mul_y_p[47 : 16] >= im_height 
		? 0 : frame_in_data;


endmodule