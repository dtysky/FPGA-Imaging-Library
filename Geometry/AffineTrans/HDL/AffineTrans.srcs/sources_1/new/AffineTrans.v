/*
Image processing project : AffineTrans.

Function: Affine transformation.

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

/*
u = aux x + auy y + au
v = avx x + avy y + av

x = (auy * av - au * avy + avy * u - auy * v) / (aux * avy - auy * avx)
y = (-aux * av + au * avx - avx * u + aux * v) / (aux * avy - auy * avx)

ax = (auy * av - au * avy) / (aux * avy - auy * avx)
axu = avy / (aux * avy - auy * avx)
axv = -auy / (aux * avy - auy * avx)
ay = (-aux * av + au * avx) / (aux * avy - auy * avx)
ayu = -avx / (aux * avy - auy * avx)
ayv = aux / (aux * avy - auy * avx)

x = axu * u + axv * v + ax
y = ayu * u + ayv * v + ay
*/

module AffineTrans(
	clk,
	rst_n,
	axu,
	axv,
	ax,
	ayu,
	ayv,
	ay,
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
	parameter frame_read_latency = 5;
	
	input clk, rst_n;
	//Complement !
	input [24 : 0] axu, axv, ayu, ayv;
	input [16 : 0] ax, ay;
	input in_enable;
	input frame_in_enable;
	input[color_width - 1 : 0] frame_in_data;
	output frame_out_enable;
	output[im_width_bits - 1 : 0] frame_out_count_x, frame_out_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;

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

	wire signed [41 : 0] mul_x_p1, mul_x_p2, mul_y_p1, mul_y_p2;
	wire signed [25 : 0] mul_x_r1 = mul_x_p1 >>> 16;
	wire signed [25 : 0] mul_x_r2 = mul_x_p2 >>> 16;
	wire signed [25 : 0] mul_y_r1 = mul_y_p1 >>> 16;
	wire signed [25 : 0] mul_y_r2 = mul_y_p2 >>> 16;
	Multiplier25Sx17S MulX1(clk, axu, count_u, mul_x_p1);
	Multiplier25Sx17S MulY1(clk, axv, count_v, mul_x_p2);
	Multiplier25Sx17S MulX2(clk, ayu, count_u, mul_y_p1);
	Multiplier25Sx17S MulY2(clk, ayv, count_v, mul_y_p2);

	wire signed [26 : 0] add_x_r1, add_y_r1;
	AddSub26Sx26S AddX1(mul_x_r1, mul_x_r2, clk, add_x_r1);
	AddSub26Sx26S AddY1(mul_y_r1, mul_y_r2, clk, add_y_r1);

	wire signed [27 : 0] add_x_r2, add_y_r2;
	AddSub27Sx27S AddX2(add_x_r1, {{10{ax[16]}}, ax}, clk, add_x_r2);
	AddSub27Sx27S AddY2(add_y_r1, {{10{ay[16]}}, ay}, clk, add_y_r2);

	assign frame_out_count_x = add_x_r2[im_width_bits - 1 : 0];
	assign frame_out_count_y = add_y_r2[im_width_bits - 1 : 0];

	reg[3 : 0] con_mul_enable;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable)
			con_mul_enable <= 0;
		// 3 + 3 + 3 - 1
		else if(con_mul_enable == 8)
			con_mul_enable <= con_mul_enable;
		else
			con_mul_enable <= con_mul_enable + 1;
	end
	assign frame_out_enable = con_mul_enable == 8 ? 1 : 0;
	assign out_enable = ~rst_n || ~frame_in_enable ? 0 : 1;

	genvar i;
	generate
		for (i = 0; i < frame_read_latency; i = i + 1) begin : out_count_buffer
			reg signed [27 : 0] x, y;
			if(i == 0) begin
				always @(posedge clk) begin
					x <= add_x_r2;
					y <= add_y_r2;
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