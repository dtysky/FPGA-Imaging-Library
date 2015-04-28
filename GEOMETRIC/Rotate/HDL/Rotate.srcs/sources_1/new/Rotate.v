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
`define im_width_half im_width / 2
`define im_height_half im_height / 2

module Rotate(
	clk,
	rst_n,
	angle,
	in_enable,
	frame_in_enable,
	frame_in_data,
	frame_out_enable,
	frame_out_count_x,
	frame_out_count_y,
	out_enable,
	out_data);

	parameter color_width = 8;
	parameter signed[16 : 0] im_width = 320;
	parameter signed[16 : 0] im_height = 240;
	parameter im_width_bits = 9;
	parameter frame_read_latency = 2;
	
	input clk, rst_n;
	//0 - 359
	input[8 : 0] angle;
	input in_enable;
	input frame_in_enable;
	input frame_in_data;
	input[color_width - 1 : 0] frame_in_data;
	output frame_out_enable;
	output[im_width_bits - 1 : 0] frame_out_count_x, frame_out_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;

	reg signed [im_width_bits : 0] reg_count_u, reg_count_v;
	wire signed [im_width_bits : 0] count_u = reg_count_u;
	wire signed [im_width_bits : 0] count_v = reg_count_v;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_count_u <= 0;
		else if(reg_count_u == im_width - 1)
			reg_count_u <= 0;
		else
			reg_count_u <= reg_count_u + 1;
	end
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			reg_count_v <= 0;
		else if(reg_count_u == im_width - 1 && reg_count_v == im_height - 1)
			reg_count_v <= 0;
		else if(reg_count_u == im_width - 1)
			reg_count_v <= reg_count_v + 1;
		else
			reg_count_v <= reg_count_v;
	end

	wire [17 : 0] sina_o, cosa_o;
	SinLUT Sin1(angle, sina_o);
	CosLUT Cos1(angle, cosa_o);

	// Convert to complementation
	wire signed [17 : 0] sina = sina_o[17] == 0 ? sina_o : {sina_o[17], ~sina_o[16 : 0] + 1};
	wire signed [17 : 0] cosa = cosa_o[17] == 0 ? cosa_o : {cosa_o[17], ~cosa_o[16 : 0] + 1};

	// x = (u -xcenter) * cos(a) + (v - ycenter) * sin(a) + xcenter
	// y = (- u + xcenter)  * sin(a) + (v - ycenter) * cos(a) + ycenter
	wire signed [34 : 0] mul_x_p1, mul_x_p2, mul_y_p1, mul_y_p2;
	wire signed [16 : 0] mul_x_b1 = count_u - `im_width_half;
	wire signed [16 : 0] mul_x_b2 = count_v - `im_height_half;
	wire signed [16 : 0] mul_y_b1 = `im_width_half - count_u;
	wire signed [16 : 0] mul_y_b2 = count_v - `im_height_half;
	wire signed [18 : 0] mul_x_r1 = mul_x_p1 >>> 16;
	wire signed [18 : 0] mul_x_r2 = mul_x_p2 >>> 16;
	wire signed [18 : 0] mul_y_r1 = mul_y_p1 >>> 16;
	wire signed [18 : 0] mul_y_r2 = mul_y_p2 >>> 16;
	Multiplier18Sx17S MulX1(clk, cosa, mul_x_b1, mul_x_p1);
	Multiplier18Sx17S MulX2(clk, sina, mul_x_b2, mul_x_p2);
	Multiplier18Sx17S MulY1(clk, sina, mul_y_b1, mul_y_p1);
	Multiplier18Sx17S MulY2(clk, cosa, mul_y_b2, mul_y_p2);

	wire signed [18 : 0] add_x1, add_y1;
	AddSub19x19 AddX1(mul_x_r1, mul_x_r2, clk, add_x1);
	AddSub19x19 AddY1(mul_y_r1, mul_y_r2, clk, add_y1);

	wire signed [18 : 0] tmp_frame_count_x, tmp_frame_count_y;
	AddSub19x19 AddX2(add_x1, `im_width_half, clk, tmp_frame_count_x);
	AddSub19x19 AddY2(add_y1, `im_height_half, clk, tmp_frame_count_y);

	assign frame_out_count_x = tmp_frame_count_x[im_width_bits - 1 : 0];
	assign frame_out_count_y = tmp_frame_count_y[im_width_bits - 1 : 0];

	reg[3 : 0] con_mul_enable;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			con_mul_enable <= 0;
		// 2 + 3 + 2
		else if(con_mul_enable == 7)
			con_mul_enable <= con_mul_enable;
		else
			con_mul_enable <= con_mul_enable + 1;
	end
	assign frame_out_enable = con_mul_enable == 7 ? 1 : 0;

	assign out_enable = ~rst_n || ~frame_in_enable ? 0 : 1;
	genvar i;
	generate
		for (i = 0; i < frame_read_latency; i = i + 1) begin : count_buffer
			reg signed [18 : 0] x, y;
			if(i == 0) begin
				always @(posedge clk) begin
					x <= tmp_frame_count_x;
					y <= tmp_frame_count_y;
				end
			end else begin
				always @(posedge clk) begin
					x <= count_buffer[i - 1].x;
					y <= count_buffer[i - 1].y;
				end
			end
		end
	endgenerate
	assign out_data = 
		count_buffer[frame_read_latency - 1].x >= im_width || count_buffer[frame_read_latency - 1].y >= im_height || 
		count_buffer[frame_read_latency - 1].x < 0 || count_buffer[frame_read_latency - 1].y < 0
		? 0 : frame_in_data;


endmodule