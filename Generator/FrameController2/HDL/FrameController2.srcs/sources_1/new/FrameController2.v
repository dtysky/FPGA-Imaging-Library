//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
FrameController2

:Function
Controlling a frame(block ram etc.), writing or reading with counts.
For controlling a BlockRAM from xilinx.
Give the first output after mul_delay + 2 + ram_read_latency cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-25

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

module FrameController2(
	clk,
	rst_n,
	in_count_x,
	in_count_y,
	in_enable,
	in_data,
	out_ready,
	out_data,
	ram_addr);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter work_mode = 0;
	/*
	::description
	This module's WR mode.
	::range
	0 for Write, 1 for Read
	*/
	parameter wr_mode = 0;
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
	Address bit width of a ram for storing this image.
	::range
	Depend on im_width and im_height.
	*/
	parameter addr_width = 17;
	/*
	::description
	RL of RAM, in xilinx 7-series device, it is 2.
	::range
	0 - 15, Depend on your using ram.
	*/
	parameter ram_read_latency = 2;
	/*
	::description
	Delay for multiplier.
	::range
	Depend on your multilpliers' configurations
	*/
	parameter mul_delay = 3;
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
	Input pixel count for width. 
	*/
	input[im_width_bits - 1 : 0] in_count_x;
	/*
	::description
	Input pixel count for height. 
	*/
	input[im_width_bits - 1 : 0] in_count_y;
	/*
	::description
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [data_width - 1 : 0] in_data;
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
	/*
	::description
	Address for ram.
	*/
	output[addr_width - 1 : 0] ram_addr;

	reg[3 : 0] con_enable;
	reg[im_width_bits - 1 : 0] reg_in_count_x;
	reg[im_width_bits - 1 : 0] reg_in_count_y;
	reg[addr_width - 1 : 0] reg_addr;
	wire[11 : 0] mul_a, mul_b;
	wire[23 : 0] mul_p;
	assign mul_a = {{(12 - im_width_bits){1'b0}}, in_count_y};
	assign mul_b = im_width;

	genvar i;
	generate
		/*
		::description
		Multiplier for Unsigned 12bits x Unsigned 12bits, used for creating address for frame. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		You can not change the ports' configurations!
		*/
		Multiplier12x12FR2 Mul(.CLK(clk), .A(mul_a), .B(mul_b), .SCLR(~rst_n), .P(mul_p));
		for (i = 0; i < mul_delay; i = i + 1) begin : conut_buffer
			reg[im_width_bits - 1 : 0] b;
			if(i == 0) begin
				always @(posedge clk)
					b <= in_count_x;
			end else begin
				always @(posedge clk)
					b <= conut_buffer[i - 1].b;
			end
		end
		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				reg_addr <= 0;
			end else begin
				reg_addr <= mul_p + conut_buffer[mul_delay - 1].b;
			end
		end
		assign ram_addr = reg_addr;

		if(wr_mode == 0) begin

			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_enable <= 0;
				else if(con_enable == mul_delay + 1)
					con_enable <= con_enable;
				else
					con_enable <= con_enable + 1;
			end
			assign out_ready = con_enable == mul_delay + 1 ? 1 : 0;

			if(work_mode == 0) begin
				for (i = 0; i < mul_delay + 1; i = i + 1) begin : buffer
					reg[data_width - 1 : 0] b;
					if(i == 0) begin
						always @(posedge clk)
							b <= in_data;
					end else begin
						always @(posedge clk)
							b <= buffer[i - 1].b;
					end
				end
				assign out_data = out_ready ? buffer[mul_delay].b : 0;
			end else begin 
				reg[data_width - 1 : 0] reg_out_data;
				always @(posedge in_enable)
					reg_out_data = in_data;
				assign out_data = out_ready ? reg_out_data : 0;
			end

		end else begin

			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_enable <= 0;
				else if (con_enable == mul_delay + 1 + ram_read_latency)
					con_enable <= con_enable;
				else
					con_enable <= con_enable + 1;
			end
			assign out_data = out_ready ? in_data : 0;
			assign out_ready = con_enable == mul_delay + 1 + ram_read_latency ? 1 : 0;

		end

	endgenerate

endmodule