/*
Image processing project : Shear.

Function: Shearing an image by your given sh.

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

module Shear(
	clk,
	rst_n,
	sh_u,
	sh_v,
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
	input [17 : 0] sh_u, sh_v;
	input in_enable;
	input frame_in_enable;
	input[color_width - 1 : 0] frame_in_data;
	output frame_out_enable;
	output[im_width_bits - 1 : 0] frame_out_count_x, frame_out_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;

	genvar i;

	reg [im_width_bits - 1 : 0] reg_count_u, reg_count_v;
	wire signed [16 : 0] count_u = {{(17 - im_width_bits){1'b0}}, reg_count_u};
	wire signed [16 : 0] count_v = {{(17 - im_width_bits){1'b0}}, reg_count_v};
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

	// Convert to complementation
	wire signed [17 : 0] sh_uc = sh_u[17] == 0 ? sh_u : {sh_u[17], ~sh_u[16 : 0] + 1};
	wire signed [17 : 0] sh_vc = sh_v[17] == 0 ? sh_v : {sh_v[17], ~sh_v[16 : 0] + 1};

	// x = u + sh_v * v
	// y = v + sh_u * u 
	wire signed [34 : 0] mul_x_p, mul_y_p;
	wire signed [18 : 0] mul_x_r = mul_x_p >>> 16;
	wire signed [18 : 0] mul_y_r = mul_y_p >>> 16;
	generate
		for (i = 0; i < 3; i = i + 1) begin : count_buffer
			reg signed [18 : 0] x, y;
			if(i == 0) begin
				always @(posedge clk) begin
					x <= {2'b0, count_u};
					y <= {2'b0, count_v};
				end
			end else begin
				always @(posedge clk) begin
					x <= count_buffer[i - 1].x;
					y <= count_buffer[i - 1].y;
				end
			end
		end
	endgenerate
	Multiplier18Sx17S MulX(clk, sh_vc, count_v, mul_x_p);
	Multiplier18Sx17S MulY(clk, sh_uc, count_u, mul_y_p);

	wire signed [18 : 0] add_x_a = count_buffer[2].x;
	wire signed [18 : 0] add_y_a = count_buffer[2].y;
	wire signed [18 : 0] add_x_r, add_y_r;
	AddSub19Sx19S AddX(add_x_a, mul_x_r, clk, add_x_r);
	AddSub19Sx19S AddY(add_y_a, mul_y_r, clk, add_y_r);

	assign frame_out_count_x = add_x_r[im_width_bits - 1 : 0];
	assign frame_out_count_y = add_y_r[im_width_bits - 1 : 0];

	reg[2 : 0] con_mul_enable;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			con_mul_enable <= 0;
		// 3 + 1 + 2 - 1
		else if(con_mul_enable == 5)
			con_mul_enable <= con_mul_enable;
		else
			con_mul_enable <= con_mul_enable + 1;
	end
	assign frame_out_enable = con_mul_enable == 5 ? 1 : 0;

	assign out_enable = ~rst_n || ~frame_in_enable ? 0 : 1;
	generate
		for (i = 0; i < frame_read_latency; i = i + 1) begin : out_count_buffer
			reg signed [18 : 0] x, y;
			if(i == 0) begin
				always @(posedge clk) begin
					x <= add_x_r;
					y <= add_y_r;
				end
			end else begin
				always @(posedge clk) begin
					x <= out_count_buffer[i - 1].x;
					y <= out_count_buffer[i - 1].y;
				end
			end
		end
	endgenerate
	assign out_data = 
		out_count_buffer[frame_read_latency - 1].x >= im_width || out_count_buffer[frame_read_latency - 1].y >= im_height || 
		out_count_buffer[frame_read_latency - 1].x < 0 || out_count_buffer[frame_read_latency - 1].y < 0
		? 0 : frame_in_data;


endmodule