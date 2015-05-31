//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Shear

:Function
Shearing an image by your given sh. 
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

module Shear(
	clk,
	rst_n,
	sh_u,
	sh_v,
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
	Sh for horizontal. 
	::range
	Fixed number, 13bits.12bits 
	*/
	input signed[24 : 0] sh_u;
	/*
	::description
	Sh for vertical. 
	::range
	Fixed number, 13bits.12bits 
	*/
	input signed[24 : 0] sh_v;
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

	reg reg_out_ready;
	reg in_range_t, in_range_b, in_range_l, in_range_r;
	wire signed[36 : 0] mul_u_p, mul_v_p;
	wire signed[im_width_bits : 0] mul_u_r, mul_v_r;
	reg signed[im_width_bits + 1 : 0] reg_frame_out_count_x, reg_frame_out_count_y;
	reg[3 : 0] con_mul_enable;
	reg[data_width - 1 : 0] reg_out_data;
	wire[im_width_bits - 1 : 0] count_u, count_v;

	generate
		if(work_mode == 0) begin
			reg [im_width_bits - 1 : 0] reg_count_u, reg_count_v;
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
			assign count_u = reg_count_u;
			assign count_v = reg_count_v;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_mul_enable <= 0;
				else if(con_mul_enable == mul_delay + 4)
					con_mul_enable <= con_mul_enable;
				else
					con_mul_enable <= con_mul_enable + 1;
			end
			assign frame_enable = con_mul_enable == mul_delay + 4 ? 1 : 0;
		end else begin 
			reg signed [im_width_bits : 0] reg_count_u, reg_count_v;
			reg in_enable_last;
			always @(posedge clk)
				in_enable_last <= in_enable;
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					reg_count_u <= -1;
				else if(~in_enable_last & in_enable) begin
					if(reg_count_u == im_width - 1)
						reg_count_u <= 0;
					else
						reg_count_u <= reg_count_u + 1;
				end else
					reg_count_u <= reg_count_u;
			end
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					reg_count_v <= 0;
				else if(~in_enable_last & in_enable) begin
					if(reg_count_u == im_width - 1 && reg_count_v == im_height - 1)
						reg_count_v <= 0;
					else if(reg_count_u == im_width - 1)
						reg_count_v <= reg_count_v + 1;
					else
						reg_count_v <= reg_count_v;
				end	else
					reg_count_v <= reg_count_v;
			end
			assign count_u = reg_count_u[im_width_bits - 1 : 0];
			assign count_v = reg_count_v[im_width_bits - 1 : 0];
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_mul_enable <= 0;
				else if(con_mul_enable == mul_delay + 5)
					con_mul_enable <= con_mul_enable;
				else
					con_mul_enable <= con_mul_enable + 1;
			end
			assign frame_enable = con_mul_enable == mul_delay + 5 ? 1 : 0;
		end
		/*
		::description
		Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier12x25SSHR MulU(.CLK(clk), .A({{12 - im_width_bits{1'b0}}, count_u}), .B(sh_u), .SCLR(~rst_n), .P(mul_u_p));
		/*
		::description
		Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		Multiplier12x25SSHR MulV(.CLK(clk), .A({{12 - im_width_bits{1'b0}}, count_v}), .B(sh_v), .SCLR(~rst_n), .P(mul_v_p));
		wire overflow_u0, overflow_v0;
		/*
		::description
		For rounding signed fixed number.
		*/
		FixedRoundSigned1 #(37, 18, im_width_bits) FRSU(clk, mul_u_p, mul_u_r, overflow_u0);
		/*
		::description
		For rounding signed fixed number.
		*/
		FixedRoundSigned1 #(37, 18, im_width_bits) FRSV(clk, mul_v_p, mul_v_r, overflow_v0);

		if(work_mode == 0) begin
			genvar i;
			for (i = 0; i < mul_delay + 3; i = i + 1) begin : count_buffer
				reg signed [im_width_bits : 0] u, v;
				if(i == 0) begin
					always @(posedge clk) begin
						u <= {1'b0, count_u};
						v <= {1'b0, count_v};
					end
				end else begin
					always @(posedge clk) begin
						u <= count_buffer[i - 1].u;
						v <= count_buffer[i - 1].v;
					end
				end
			end
			reg not_overflow_u, not_overflow_v;
			always @(posedge clk) begin
				reg_frame_out_count_x <= count_buffer[mul_delay + 2].u + mul_v_r;
				reg_frame_out_count_y <= count_buffer[mul_delay + 2].v + mul_u_r;
				not_overflow_u <= ~overflow_u0;
				not_overflow_v <= ~overflow_v0;
			end
			for (i = 0; i < ram_RL - 1; i = i + 1) begin : buffer
				reg tmp_t, tmp_b, tmp_l, tmp_r, overflow_u, overflow_v;
				if(i == 0) begin
					always @(posedge clk) begin
						tmp_t <= reg_frame_out_count_x[im_width_bits + 1] == 0 ? 1 : 0;
						tmp_b <= reg_frame_out_count_x < im_width ? 1 : 0;
						tmp_l <= reg_frame_out_count_y[im_width_bits + 1] == 0 ? 1 : 0;
						tmp_r <= reg_frame_out_count_y < im_height ? 1 : 0;
						overflow_u <= not_overflow_u;
						overflow_v <= not_overflow_v;
					end
				end else begin 
					always @(posedge clk) begin
						tmp_t <= buffer[i - 1].tmp_t;
						tmp_b <= buffer[i - 1].tmp_b;
						tmp_l <= buffer[i - 1].tmp_l;
						tmp_r <= buffer[i - 1].tmp_r;
						overflow_u <= buffer[i - 1].overflow_u;
						overflow_v <= buffer[i - 1].overflow_v;
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
					in_range_b <= buffer[ram_RL - 2].tmp_b & buffer[ram_RL - 2].overflow_v;
					in_range_l <= buffer[ram_RL - 2].tmp_l;
					in_range_r <= buffer[ram_RL - 2].tmp_r & buffer[ram_RL - 2].overflow_u;
					reg_out_data <= frame_in_data;
				end
			end
		end else begin 
			always @(posedge clk) begin
				reg_frame_out_count_x <= $signed({1'b0, count_u}) + mul_v_r;
				reg_frame_out_count_y <= $signed({1'b0, count_v}) + mul_u_r;
			end
			reg tmp_t, tmp_b, tmp_l, tmp_r;
			reg not_overflow_u, not_overflow_v;
			always @(posedge clk) begin 
				tmp_t <= reg_frame_out_count_x[im_width_bits + 1] == 0 ? 1 : 0;
				tmp_b <= reg_frame_out_count_x < im_width ? 1 : 0;
				tmp_l <= reg_frame_out_count_y[im_width_bits + 1] == 0 ? 1 : 0;
				tmp_r <= reg_frame_out_count_y < im_height ? 1 : 0;
				not_overflow_u <= ~overflow_u0;
				not_overflow_v <= ~overflow_v0;
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
					in_range_b <= tmp_b & not_overflow_v;
					in_range_l <= tmp_l;
					in_range_r <= tmp_r & not_overflow_u;
				end
			end
		end
		assign frame_out_count_x = reg_frame_out_count_x[im_width_bits - 1 : 0];
		assign frame_out_count_y = reg_frame_out_count_y[im_width_bits - 1 : 0];
		assign out_ready = reg_out_ready;
		assign out_data = out_ready & in_range_t & in_range_b & in_range_l & in_range_r ? reg_out_data : 0;

	endgenerate

endmodule