/*
Image processing project : FrameController2.

Function: Controlling a frame(block ram etc.), writing or reading with counts.

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

This module is a part of image processing project, you can get all of them here:
	https://github.com/dtysky/Image-processing-on-FPGA

This mail is for connecting me:
	dtysky@outlook.com

My blog is here:
	http://dtysky.moe/
*/

`timescale 1ns / 1ps

module FrameController2(
	clk,
	rst_n,
	in_enable,
	in_data,
	in_count_x,
	in_count_y,
	out_enable,
	out_data,
	ram_addr);

	//0 for write, 1 for read
	parameter mode = 0;
	parameter color_width = 8;
	parameter im_width = 320;
	parameter im_height = 240;
	parameter im_width_bits = 9;
	parameter addr_width = 17;
	parameter ram_read_latency = 2;

	input clk, rst_n;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	input[im_width_bits - 1 : 0] in_count_x, in_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	output[addr_width - 1 : 0] ram_addr;

	reg[15 : 0] reg_mul_c;
	always @(posedge clk)
		reg_mul_c <= {{(16 - im_width_bits){1'b0}}, in_count_x};
	wire[15 : 0] mul_a, mul_b, mul_c;
	assign mul_a = {{(16 - im_width_bits){1'b0}}, in_count_y};
	assign mul_b = im_width;
	assign mul_c = reg_mul_c;
	MultiplierAdd16x16x16 MulAdd1(clk, 1, 0, mul_a, mul_b, mul_c, 0, ram_addr);

	genvar i;
	generate

		if(mode == 0) begin

			reg[1 : 0] con_enable;

			assign out_enable = con_enable == 3 ? 1 : 0;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_enable <= 0;
				else if(con_enable == 3)
					con_enable <= con_enable;
				else
					con_enable <= con_enable + 1;
			end

			assign out_data = ~rst_n || ~in_enable ? 0 : buffer[2].b;
			for (i = 0; i < 3; i = i + 1) begin : buffer
				reg[color_width - 1 : 0] b;
				if(i == 0)
					always @(posedge clk)
						b <= in_data;
				else
					always @(posedge clk)
						b <= buffer[i - 1].b;
			end

		end else begin

			reg[3 : 0] con_enable;

			assign out_data = ~rst_n || ~in_enable ? 0 : in_data;
			assign out_enable = con_enable == ram_read_latency + 2 ? 1 : 0;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_enable <= 0;
				else if (con_enable == ram_read_latency + 2)
					con_enable <= con_enable;
				else
					con_enable <= con_enable + 1;
			end

		end

	endgenerate

endmodule