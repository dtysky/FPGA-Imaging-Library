//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Scale

:Function
Scaling an image by your given scale.  
Give the first output after 1 cycle while the frame input ready.

:Module
Main module

:Version
1.0

:Modified
2015-05-28

Copyright (C) 2015  Tianyu Dai (dtysky) <dtysky@outlook.com>

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
	http://fil.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe

*/
`timescale 1ns / 1ps

module Scale(
	clk,
	rst_n,
	scale_x,
	scale_y,
	in_enable,
	frame_in_ready,
	frame_in_data,
	frame_enable,
	frame_out_count_x,
	frame_out_count_y,
	out_ready,
	out_data);
	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter work_mode = 0;
	/*
	::description
	Data bit width. 
	*/
	parameter data_width = 8;
	/*
	::description
	Width of image.
	::range
	1 - 4096
	*/
	parameter im_width = 320;
	/*
	::description
	Height of image.
	::range
	1 - 4096
	*/
	parameter im_height = 240;
	/*
	::description
	The bits of width of image.
	::range
	Depend on width of image
	*/
	parameter im_width_bits = 9;
	/*
	::description
	Delay for multiplier.
	::range
	Depend on your multilpliers' configurations, 1 - 14
	*/
	parameter mul_delay = 3;
	/*
	::description
	Delay for FrameController.
	::range
	Depend on your FrameController 
	*/
	parameter ram_RL = 7;
	/*
	::description
	Clock.
	*/
	input clk;
	/*
	::description
	Reset, active low.
	*/
	input rst_n;
	/*
	::description
	Scale for horizontal, must be reciprocal of real scale. 
	::range
	Fixed number, 6bits.18bits 
	*/
	input [23 : 0] scale_x;
	/*
	::description
	Scale for vertical, must be reciprocal of real scale.  
	::range
	Fixed number, 4bits.20bits 
	*/
	input [23 : 0] scale_y;
	/*
	::description
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
	*/
	input in_enable;
	/*
	::description
	Connect to out_ready in FrameController. 
	*/
	input frame_in_ready;
	/*
	::description
	Connect to out_data in FrameController. 
	*/
	input[data_width - 1 : 0] frame_in_data;
	/*
	::description
	Connect to in_enable in FrameController. 
	*/
	output frame_enable;
	/*
	::description
	Connect to in_count_x in FrameController. 
	*/
	output[im_width_bits - 1 : 0] frame_out_count_x;
	/*
	::description
	Connect to in_count_y in FrameController. 
	*/
	output[im_width_bits - 1 : 0] frame_out_count_y;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[data_width - 1 : 0] out_data;

	reg reg_out_ready;
	reg in_range_h, in_range_v;
	wire[18 : 0] mul_x_p, mul_y_p;
	wire[17 : 0] mul_x_r, mul_y_r;
	reg[3 : 0] con_mul_enable;
	reg[data_width - 1 : 0] reg_out_data;
	wire[im_width_bits - 1 : 0] count_x, count_y;

	generate
		if(work_mode == 0) begin
			reg [im_width_bits - 1 : 0] reg_count_x, reg_count_y;
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
			assign count_x = reg_count_x;
			assign count_y = reg_count_y;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_mul_enable <= 0;
				else if(con_mul_enable == mul_delay + 1)
					con_mul_enable <= con_mul_enable;
				else
					con_mul_enable <= con_mul_enable + 1;
			end
			assign frame_enable = con_mul_enable == mul_delay + 1 ? 1 : 0;
		end else begin 
			reg signed [im_width_bits : 0] reg_count_x, reg_count_y;
			reg in_enable_last;
			always @(posedge clk)
				in_enable_last <= in_enable;
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					reg_count_x <= -1;
				else if(~in_enable_last & in_enable) begin
					if(reg_count_x == im_width - 1)
						reg_count_x <= 0;
					else
						reg_count_x <= reg_count_x + 1;
				end else
					reg_count_x <= reg_count_x;
			end
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					reg_count_y <= 0;
				else if(~in_enable_last & in_enable) begin
					if(reg_count_x == im_width - 1 && reg_count_y == im_height - 1)
						reg_count_y <= 0;
					else if(reg_count_x == im_width - 1)
						reg_count_y <= reg_count_y + 1;
					else
						reg_count_y <= reg_count_y;
				end	else
					reg_count_y <= reg_count_y;
			end
			assign count_x = reg_count_x[im_width_bits - 1 : 0];
			assign count_y = reg_count_y[im_width_bits - 1 : 0];
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_mul_enable <= 0;
				else if(con_mul_enable == mul_delay + 2)
					con_mul_enable <= con_mul_enable;
				else
					con_mul_enable <= con_mul_enable + 1;
			end
			assign frame_enable = con_mul_enable == mul_delay + 2 ? 1 : 0;
		end
		/*
		::description
		Multiplier for Unsigned 12bits x Unsigned 24bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier12x24SCL MulX(.CLK(clk), .A({{12 - im_width_bits{1'b0}}, count_x[im_width_bits - 1 : 0]}), .B(scale_x), .SCLR(~rst_n), .P(mul_x_p));
		/*
		::description
		Multiplier for Unsigned 12bits x Unsigned 24bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier12x24SCL MulY(.CLK(clk), .A({{12 - im_width_bits{1'b0}}, count_y[im_width_bits - 1 : 0]}), .B(scale_y), .SCLR(~rst_n), .P(mul_y_p));
		/*
		::description
		For rounding fixed number.
		*/
		FixedRoundUnsigned #(19, 1) FRUX(clk, mul_x_p, mul_x_r);
		/*
		::description
		For rounding fixed number.
		*/
		FixedRoundUnsigned #(19, 1) FRUY(clk, mul_y_p, mul_y_r);
		assign frame_out_count_x = mul_x_r[im_width_bits - 1 : 0];
		assign frame_out_count_y = mul_y_r[im_width_bits - 1 : 0];

		if(work_mode == 0) begin
			genvar i;
			for (i = 0; i < ram_RL - 1; i = i + 1) begin : buffer
				reg in_range_h, in_range_v;
				if(i == 0) begin
					always @(posedge clk) begin
						in_range_h <= mul_x_r < im_width ? 1 : 0;
						in_range_v <= mul_y_r < im_height ? 1 : 0;
					end
				end else begin 
					always @(posedge clk) begin
						in_range_h <= buffer[i - 1].in_range_h;
						in_range_v <= buffer[i - 1].in_range_v;
					end
				end
			end
			always @(posedge clk or negedge rst_n or negedge frame_in_ready) begin
				if(~rst_n || ~frame_in_ready) begin
					reg_out_ready <= 0;
					in_range_h <= 0;
					in_range_v <= 0;
					reg_out_data <= 0;
				end else begin
					reg_out_ready <= 1;
					in_range_h <= buffer[ram_RL - 2].in_range_h;
					in_range_v <= buffer[ram_RL - 2].in_range_v;
					reg_out_data <= frame_in_data;
				end
			end
		end else begin 
			reg tmp_h, tmp_v;
			always @(posedge clk or negedge rst_n or negedge frame_in_ready) begin
				if(~rst_n || ~frame_in_ready) begin
					reg_out_ready <= 0;
					reg_out_data <= 0;
					in_range_h <= 0;
					in_range_v <= 0;
				end else begin
					reg_out_ready <= 1;
					reg_out_data <= frame_in_data;
					in_range_h <= tmp_h;
					in_range_v <= tmp_v;
				end
			end
			always @(posedge clk) begin 
				tmp_h <= mul_x_r < im_width ? 1 : 0;
				tmp_v <= mul_y_r < im_height ? 1 : 0;
			end
		end

		assign out_ready = reg_out_ready;
		assign out_data = out_ready & in_range_h & in_range_v ? reg_out_data : 0;

	endgenerate

endmodule