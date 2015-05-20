//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
WindowGenerator

:Function
Generate window. 
The lowest "color_width" bits of "out_data" is the top left corner pixel of the window! 
In pipeline mode, it will give the first output after window_width / 2 + 1 cycles while the input enable. 
In req-ack mode, before the first window can be output, it will give a input ack for every req, then you can give the next input data. 

:Module
Main module

:Version
1.0

:Modified
2015-05-19

Copyright (C) 2015 Tianyu Dai (dtysky) <dtysky@outlook.com>

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

module WindowGenerator(
	clk,
	rst_n,
	in_enable,
	in_data,
	out_ready,
	out_data,
	input_ack
	);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter[0 : 0] work_mode = 0;
	/*
	::description
	The width(and height) of window.
	::range
	2 - 15
	*/
	parameter[3 : 0] window_width = 3;
	/*
	::description
	Color's bit wide.
	::range
	1 - 12
	*/
	parameter[3: 0] color_width = 8;

	parameter[2 : 0] window_width_half = window_width >> 1;
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
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [color_width * window_width - 1 : 0] in_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[color_width * window_width * window_width - 1 : 0] out_data;
	/*
	::description
	Input ack, only used for req-ack mode, this port will give a ack while the input_data received. 
	*/
	output input_ack;

	reg[color_width * window_width - 1 : 0] reg_out_data[0 : window_width - 1];
	reg[3 : 0] con_init;


	genvar y;
	genvar x;
	generate
		if(work_mode == 0) begin
			assign input_ack = 0;
			reg reg_out_ready;
			assign out_ready = reg_out_ready;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable) begin
					con_init <= 0;
					reg_out_ready <= 0;
				end else if(con_init == window_width_half) begin
					con_init <= con_init;
					reg_out_ready <= 1;
				end else begin
					con_init <= con_init + 1;
					reg_out_ready <= 0;
				end
			end
			for (y = 0; y < window_width; y = y + 1) begin
				for (x = 0; x < window_width; x = x + 1) begin
					if (x == 0) begin 
						always @(posedge clk or negedge rst_n or negedge in_enable) begin
							if(~rst_n || ~in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							else
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= in_data[(y + 1) * color_width - 1 : y * color_width];
						end
					end else begin
						always @(posedge clk or negedge rst_n or negedge in_enable) begin
							if(~rst_n || ~in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							else
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][x * color_width - 1 : (x - 1)* color_width];
						end
					end
				end
				assign out_data[(y + 1) * color_width * window_width - 1 : y * color_width * window_width] = 
					out_ready ? reg_out_data[y] : 0;
			end

		end else begin

			reg in_enable_last;
			always @(posedge clk)
				in_enable_last <= in_enable;
			reg reg_input_ack;
			assign input_ack = reg_input_ack;
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					con_init <= 0;
				else if(con_init == window_width_half + 1)
					con_init <= con_init;
				else if(~in_enable_last & in_enable)
					con_init <= con_init + 1;
				else
					con_init <= con_init;
			end
			assign out_ready = con_init == window_width_half + 1 ? 1 : 0;
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n)
					reg_input_ack <= 0;
				else if(~in_enable_last & in_enable)
					reg_input_ack <= 1;
				else if(in_enable_last & ~in_enable)
					reg_input_ack <= 0;
			end

			for (y = 0; y < window_width; y = y + 1) begin
				for (x = 0; x < window_width; x = x + 1) begin
					if (x == 0) begin 
						always @(posedge clk or negedge rst_n) begin
							if(~rst_n)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							else if(~in_enable_last & in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= in_data[(y + 1) * color_width - 1 : y * color_width];
							else
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][(x + 1) * color_width - 1 : x * color_width];
						end
					end else begin
						always @(posedge clk or negedge rst_n) begin
							if(~rst_n)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
							else if(~in_enable_last & in_enable)
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][x * color_width - 1 : (x - 1)* color_width];
							else 
								reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][(x + 1) * color_width - 1 : x * color_width];
						end
					end
				end
				assign out_data[(y + 1) * color_width * window_width - 1 : y * color_width * window_width] = 
					out_ready ? reg_out_data[y] : 0;
			end

		end
		
	endgenerate

endmodule