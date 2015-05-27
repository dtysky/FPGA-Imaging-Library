//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
MeanFilter

:Function
Local filter - Mean filter, it always used for smoothing images. 
It will give the first output after sum_stage + 1 cycles while the input enable. 

:Module
Main module

:Version
1.0

:Modified
2015-05-20

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
`define full_win_width window_width * window_width

module MeanFilter(
	clk, 
	rst_n, 
	in_enable, 
	in_data, 
	out_ready, 
	out_data);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipeline, 1 for Req-ack
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
	/*
	::description
	Stage of sum.
	::range
	Depend on width of window, log2(window_width^2)
	*/
	parameter sum_stage = 3;

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
	input [color_width * window_width * window_width - 1 : 0] in_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[color_width - 1 : 0] out_data;

	reg[color_width - 1 : 0] reg_in_data[0 : `full_win_width - 1];
	reg[color_width - 1 : 0] reg_out_data;
	wire[color_width + `full_win_width - 1 : 0] sum_all;
	reg[3 : 0] con_enable;

	genvar i, j;
	generate

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) 
				con_enable <= 0;
			else if(con_enable == sum_stage + 1)
				con_enable <= con_enable;
			else
				con_enable <= con_enable + 1;
		end
		assign out_ready = con_enable == sum_stage + 1 ? 1 : 0;


		for (i = 0; i < `full_win_width; i = i + 1) begin
			if(work_mode == 0) begin
				always @(*)
					reg_in_data[i] = in_data[(i + 1) * color_width - 1 : i * color_width];
			end else begin
				always @(posedge in_enable)
					reg_in_data[i] = in_data[(i + 1) * color_width - 1 : i * color_width];
			end

		end

		for (i = 0; i < sum_stage; i = i + 1) begin : pipe
			reg[color_width + `full_win_width - 1 : 0] sum[0 : (`full_win_width >> i + 1) - 1];
			for (j = 0; j < `full_win_width >> i + 1; j = j + 1) begin
				if(i == 0) begin

					if(j == 0 && ((`full_win_width >> i) % 2 != 0)) begin
						always @(posedge clk)
							sum[j] <= 
								reg_in_data[`full_win_width - 1] +
								reg_in_data[2 * j] +
								reg_in_data[2 * j + 1];
					end else begin
						always @(posedge clk)
							sum[j] <= 
								reg_in_data[2 * j] +
								reg_in_data[2 * j + 1];
					end

				end else begin 

					if(j == 0 && ((`full_win_width >> i) % 2 != 0)) begin
						always @(posedge clk)
							sum[j] <= pipe[i - 1].sum[(`full_win_width >> i) - 1] + pipe[i - 1].sum[2 * j] + pipe[i - 1].sum[2 * j + 1];
					end else begin
						always @(posedge clk)
							sum[j] <= pipe[i - 1].sum[2 * j] + pipe[i - 1].sum[2 * j + 1];
					end
				end

			end
		end

		assign sum_all = pipe[sum_stage - 1].sum[0];
		case (window_width)
		 	2 : always @(posedge clk) reg_out_data <= sum_all >> 2;
		 	3 : always @(posedge clk) reg_out_data <= (sum_all >> 4) + (sum_all >> 5) + (sum_all >> 6);
		 	4 : always @(posedge clk) reg_out_data <= sum_all >> 4;
		 	5 : always @(posedge clk) reg_out_data <= (sum_all >> 5) + (sum_all >> 7) + (sum_all >> 10);
		 	6 : always @(posedge clk) reg_out_data <= (sum_all >> 6) + (sum_all >> 7) + (sum_all >> 8);
		 	7 : always @(posedge clk) reg_out_data <= (sum_all >> 6) + (sum_all >> 8) + (sum_all >> 10);
		 	8 : always @(posedge clk) reg_out_data <= sum_all >> 6;
		 	9 : always @(posedge clk) reg_out_data <= (sum_all >> 7) + (sum_all >> 8) + (sum_all >> 11);
		 	10 : always @(posedge clk) reg_out_data <= (sum_all >> 7) + (sum_all >> 9) + (sum_all >> 13);
		 	11 : always @(posedge clk) reg_out_data <= (sum_all >> 7) + (sum_all >> 12) + (sum_all >> 13);
		 	12 : always @(posedge clk) reg_out_data <= (sum_all >> 8) + (sum_all >> 9) + (sum_all >> 10);
		 	13 : always @(posedge clk) reg_out_data <= (sum_all >> 8) + (sum_all >> 9) + (sum_all >> 14);
		 	14 : always @(posedge clk) reg_out_data <= (sum_all >> 8) + (sum_all >> 10) + (sum_all >> 12);
		 	15 : always @(posedge clk) reg_out_data <= (sum_all >> 8) + (sum_all >> 11);
		 	default : /* default */;
		endcase

		assign out_data = out_ready ? reg_out_data : 0;

	endgenerate

endmodule
`undef full_win_width