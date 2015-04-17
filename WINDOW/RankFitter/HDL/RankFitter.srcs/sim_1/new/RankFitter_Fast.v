`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/16 20:54:09
// Design Name: RankFitter
// Module Name: RankFitter_Fast
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: The window size must be less than 5 !
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define full_win_size window_size * window_size

module RankFitter_Fast(clk, rst_n, rank, in_enable, in_data, out_enable, out_data);

	parameter color_width = 8;
	//Less than 5
	parameter window_size = 3;
	parameter full_win_bits = 4;

	input clk;
	input rst_n;
	input[full_win_bits - 1 : 0] rank;
	input in_enable;
	input[color_width * window_size * window_size - 1 : 0] in_data;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	
	reg[`full_win_size - 1 : 0] big_flag[0 : `full_win_size - 1];
	reg[`full_win_size - 1 : 0] enable_list;
	reg[3 : 0] con_enable;

	wire[2 ** full_win_bits - 1 : 0] ed_index = {{(2 ** full_win_bits - `full_win_size){1'b0}}, enable_list};
	wire[full_win_bits - 1 : 0] ed_value;
	Encoder #(full_win_bits) Ed1(ed_index, ed_value);

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable) 
			con_enable <= 0;
		else if(con_enable == 3)
			con_enable <= con_enable;
		else
			con_enable <= con_enable + 1;
	end

	assign out_enable = con_enable == 3 ? 1 : 0;
	assign out_data = buffer[1].b[ed_value];

	genvar i, j;
	generate
		for (i = 0; i < 2; i = i + 1) begin : buffer
			reg[color_width - 1 : 0] b[0 : `full_win_size - 1];
			for (j = 0; j < `full_win_size; j = j + 1) begin
				if(i == 0) begin
					always @(posedge clk)
						b[j] <= in_data[(j + 1) * color_width - 1 : j * color_width];
				end else begin
					always @(posedge clk)
						b[j] <= buffer[i - 1].b[j];
				end
			end
		end

		for (i = 0; i < `full_win_size; i = i + 1) begin
			always @(posedge clk)
				big_flag[i][i] <= 0;
		end

		for (i = 0; i < `full_win_size; i = i + 1) begin
			for (j = i + 1; j < `full_win_size; j = j + 1) begin
				always @(posedge clk) begin
					if(in_data[(i + 1) * color_width - 1 : i * color_width] >= in_data[(j + 1) * color_width - 1 : j * color_width]) begin
						big_flag[i][j] <= 1;
						big_flag[j][i] <= 0;
					end else begin 
						big_flag[i][j] <= 0;
						big_flag[j][i] <= 1;
					end
				end
			end
		end

		for (i = 0; i < `full_win_size; i = i + 1) begin : set_list
			wire[full_win_bits - 1 : 0] ce_value;
			CountEncoder #(full_win_bits)
				CE({{(2 ** full_win_bits - `full_win_size){1'b0}}, big_flag[i]}, ce_value);
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable) 
					enable_list[i] <= 0;
				else if(ce_value == rank)
					enable_list[i] <= 1;
				else
					enable_list[i] <= 0;
				end
		end
	endgenerate
endmodule