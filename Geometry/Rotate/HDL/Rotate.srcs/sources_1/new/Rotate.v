//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Rotate

:Function
Function: Rotating an image by your given angle. 
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
`define im_width_half im_width / 2
`define im_height_half im_height / 2

module Rotate(
	clk,
	rst_n,
	angle,
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
	parameter signed[11 : 0] im_width = 320;
	/*
	::description
	Height of image.
	::range
	1 - 4096
	*/
	parameter signed[11 : 0] im_height = 240;
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
	Angle. 
	::range
	0 - 359 
	*/
	input[8 : 0] angle;
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
	Connect to in_count_u in FrameController. 
	*/
	output[im_width_bits - 1 : 0] frame_out_count_x;
	/*
	::description
	Connect to in_count_v in FrameController. 
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

	wire signed[19 : 0] sina, cosa;
	reg  signed[im_width_bits : 0] count_u, count_v;
	reg in_range_t, in_range_b, in_range_l, in_range_r;
	wire signed [32 : 0] mul_x_p1, mul_x_p2, mul_y_p1, mul_y_p2;
	reg signed [12 : 0] mul_x_a1, mul_x_a2, mul_y_a1, mul_y_a2;
	wire signed [im_width_bits : 0] mul_x_r1, mul_x_r2, mul_y_r1, mul_y_r2;
	reg signed [im_width_bits + 1 : 0] add_x, add_y;
	reg signed[im_width_bits + 1 : 0] reg_frame_out_count_x, reg_frame_out_count_y;
	reg[3 : 0] con_mul_enable;
	reg reg_out_ready;
	reg[data_width - 1 : 0] reg_out_data;

	generate
		if(work_mode == 0) begin
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					count_u <= 0;
				else if(count_u == im_width - 1)
					count_u <= 0;
				else
					count_u <= count_u + 1;
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					count_v <= 0;
				else if(count_u == im_width - 1 && count_v == im_height - 1)
					count_v <= 0;
				else if(count_u == im_width - 1)
					count_v <= count_v + 1;
				else
					count_v <= count_v;
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_mul_enable <= 0;
				else if(con_mul_enable == mul_delay + 6)
					con_mul_enable <= con_mul_enable;
				else
					con_mul_enable <= con_mul_enable + 1;
			end
			assign frame_enable = con_mul_enable == mul_delay + 6 ? 1 : 0;
		end else begin 
			reg in_enable_last;
			always @(posedge clk)
				in_enable_last <= in_enable;
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					count_u <= -1;
				else if(~in_enable_last & in_enable) begin
					if(count_u == im_width - 1)
						count_u <= 0;
					else
						count_u <= count_u + 1;
				end else
					count_u <= count_u;
			end
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					count_v <= 0;
				else if(~in_enable_last & in_enable) begin
					if(count_u == im_width - 1 && count_v == im_height - 1)
						count_v <= 0;
					else if(count_u == im_width - 1)
						count_v <= count_v + 1;
					else
						count_v <= count_v;
				end	else
					count_v <= count_v;
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_mul_enable <= 0;
				else if(con_mul_enable == mul_delay + 7)
					con_mul_enable <= con_mul_enable;
				else
					con_mul_enable <= con_mul_enable + 1;
			end
			assign frame_enable = con_mul_enable == mul_delay + 7 ? 1 : 0;
		end
		/*
		::description
		Getting sine of angle.
		*/
		SinLUT Sin(angle, sina);
		/*
		::description
		Getting cosine of angle.
		*/
		CosLUT Cos(angle, cosa);

		always @(posedge clk) begin
			mul_x_a1 <= count_u - `im_width_half;
			mul_x_a2 <= count_v - `im_height_half;
			mul_y_a1 <= `im_width_half - count_u;
			mul_y_a2 <= count_v - `im_height_half;
		end
		/*
		::description
		Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier13Sx20SRTT MulX1(.CLK(clk), .A(mul_x_a1), .B(cosa), .SCLR(~rst_n), .P(mul_x_p1));
		/*
		::description
		Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier13Sx20SRTT MulX2(.CLK(clk), .A(mul_x_a2), .B(sina), .SCLR(~rst_n), .P(mul_x_p2));
		/*
		::description
		Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier13Sx20SRTT MulY1(.CLK(clk), .A(mul_y_a1), .B(sina), .SCLR(~rst_n), .P(mul_y_p1));
		/*
		::description
		Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier13Sx20SRTT MulY2(.CLK(clk), .A(mul_y_a2), .B(cosa), .SCLR(~rst_n), .P(mul_y_p2));
		/*
		::description
		For rounding signed fixed number.
		*/
		FixedRoundSigned2 #(33, 18, im_width_bits) FRSX1(clk, mul_x_p1, mul_x_r1);
		/*
		::description
		For rounding signed fixed number.
		*/
		FixedRoundSigned2 #(33, 18, im_width_bits) FRSX2(clk, mul_x_p2, mul_x_r2);
		/*
		::description
		For rounding signed fixed number.
		*/
		FixedRoundSigned2 #(33, 18, im_width_bits) FRSY1(clk, mul_y_p1, mul_y_r1);
		/*
		::description
		For rounding signed fixed number.
		*/
		FixedRoundSigned2 #(33, 18, im_width_bits) FRSY2(clk, mul_y_p2, mul_y_r2);

		always @(posedge clk) begin
			add_x <= mul_x_r1 + mul_x_r2;
			add_y <= mul_y_r1 + mul_y_r2;
			reg_frame_out_count_x <= add_x + `im_width_half;
			reg_frame_out_count_y <= add_y + `im_height_half;
		end
		assign frame_out_count_x = reg_frame_out_count_x[im_width_bits - 1 : 0];
		assign frame_out_count_y = reg_frame_out_count_y[im_width_bits - 1 : 0];

		if(work_mode == 0) begin
			genvar i;
			for (i = 0; i < ram_RL - 1; i = i + 1) begin : buffer
				reg tmp_t, tmp_b, tmp_l, tmp_r;
				if(i == 0) begin
					always @(posedge clk) begin
						tmp_t <= reg_frame_out_count_x[im_width_bits + 1] == 0 ? 1 : 0;
						tmp_b <= reg_frame_out_count_x < im_width ? 1 : 0;
						tmp_l <= reg_frame_out_count_y[im_width_bits + 1] == 0 ? 1 : 0;
						tmp_r <= reg_frame_out_count_y < im_height ? 1 : 0;
					end
				end else begin 
					always @(posedge clk) begin
						tmp_t <= buffer[i - 1].tmp_t;
						tmp_b <= buffer[i - 1].tmp_b;
						tmp_l <= buffer[i - 1].tmp_l;
						tmp_r <= buffer[i - 1].tmp_r;
					end
				end
			end
			always @(posedge clk or negedge rst_n or negedge frame_in_ready) begin
				if(~rst_n || ~frame_in_ready) begin
					reg_out_ready <= 0;
					in_range_t <= 0;
					in_range_b <= 0;
					in_range_l <= 0;
					in_range_r <= 0;
					reg_out_data <= 0;
				end else begin
					reg_out_ready <= 1;
					in_range_t <= buffer[ram_RL - 2].tmp_t;
					in_range_b <= buffer[ram_RL - 2].tmp_b;
					in_range_l <= buffer[ram_RL - 2].tmp_l;
					in_range_r <= buffer[ram_RL - 2].tmp_r;
					reg_out_data <= frame_in_data;
				end
			end
		end else begin 
			reg tmp_t, tmp_b, tmp_l, tmp_r;
			always @(posedge clk) begin 
				tmp_t <= reg_frame_out_count_x[im_width_bits + 1] == 0 ? 1 : 0;
				tmp_b <= reg_frame_out_count_x < im_width ? 1 : 0;
				tmp_l <= reg_frame_out_count_y[im_width_bits + 1] == 0 ? 1 : 0;
				tmp_r <= reg_frame_out_count_y < im_height ? 1 : 0;
			end
			always @(posedge clk or negedge rst_n or negedge frame_in_ready) begin
				if(~rst_n || ~frame_in_ready) begin
					reg_out_ready <= 0;
					reg_out_data <= 0;
					in_range_t <= 0;
					in_range_b <= 0;
					in_range_l <= 0;
					in_range_r <= 0;
				end else begin
					reg_out_ready <= 1;
					reg_out_data <= frame_in_data;
					in_range_t <= tmp_t;
					in_range_b <= tmp_b;
					in_range_l <= tmp_l;
					in_range_r <= tmp_r;
				end
			end
		end
		assign out_ready = reg_out_ready;
		assign out_data = out_ready & in_range_t & in_range_b & in_range_l & in_range_r ? reg_out_data : 0;

	endgenerate

endmodule
`undef im_width_half
`undef im_height_half