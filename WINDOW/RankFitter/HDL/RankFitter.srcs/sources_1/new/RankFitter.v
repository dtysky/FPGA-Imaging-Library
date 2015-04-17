`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/16 20:54:09
// Design Name: RankFitter
// Module Name: RankFitter
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: The window size must be less than 16 !
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define full_win_size window_size * window_size

module RankFitter(clk, rst_n, rank, in_enable, in_data, out_enable, out_data);

	parameter color_width = 8;
	//Less than 16
	parameter window_size = 3;
	parameter full_win_bits = 4;
	// The highest bit of full_win_size, the lowest bit is "0"
	// 1 : 0;
	// 2 : 1;
	// 3 : 3;
	// 4 : 4;
	// 5 : 4;
	// 6 : 5;
	// 7 : 5;
	// 8 : 6;
	// 9 : 6;
	// 10 : 6;
	// 11 : 6;
	// 12 : 7;
	// 13 : 7;
	// 14 : 8;
	// 15 : 8;
	// 16 : 8;
	parameter sum_counter = 3;

	input clk;
	input rst_n;
	input[full_win_bits - 1 : 0] rank;
	input in_enable;
	input[color_width * window_size * window_size - 1 : 0] in_data;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	
	reg[`full_win_size - 1 : 0] big_flag[0 : `full_win_size - 1];
	reg[`full_win_size - 1 : 0] sorted_list[0 : `full_win_size - 1];
	reg[3 : 0] con_enable;

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable) 
			con_enable <= 0;
		else if(con_enable == sum_counter + 2)
			con_enable <= con_enable;
		else
			con_enable <= con_enable + 1;
	end

	assign out_enable = con_enable == sum_counter + 2 ? 1 : 0;
	assign out_data = sorted_list[rank];

	genvar i, j, k;
	generate
		for (i = 0; i < sum_counter + 1; i = i + 1) begin : buffer
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

		for (i = 0; i < sum_counter; i = i + 1) begin : pip
			for (k = 0; k < `full_win_size; k = k + 1) begin : pixel
				reg[i + 1 : 0] sum[0 : (`full_win_size >> i + 1) - 1];
				for (j = 0; j < `full_win_size >> i + 1; j = j + 1) begin
					if(i == 0) begin

						if(j == 0 && ((`full_win_size >> i) % 2 != 0)) begin
							always @(posedge clk)
								sum[j] <= 
									big_flag[k][`full_win_size - 1] + big_flag[k][2 * j] + big_flag[k][2 * j + 1];
						end else begin
							always @(posedge clk)
								sum[j] <= 
									big_flag[k][2 * j] + big_flag[k][2 * j + 1];
						end

					end else begin 

						if(j == 0 && ((`full_win_size >> i) % 2 != 0)) begin
							always @(posedge clk)
								sum[j] <=
									pip[i - 1].pixel[k].sum[(`full_win_size >> i) - 1] +
									pip[i - 1].pixel[k].sum[2 * j] +
									pip[i - 1].pixel[k].sum[2 * j + 1];
						end else begin
							always @(posedge clk)
								sum[j] <=
									pip[i - 1].pixel[k].sum[2 * j] +
									pip[i - 1].pixel[k].sum[2 * j + 1];
						end
					end
				end
			end
		end

		for (i = 0; i < `full_win_size; i = i + 1) begin
			always @(*)
				sorted_list[pip[sum_counter - 1].pixel[i].sum[0]] = ~rst_n || ~in_enable ? 0 : buffer[sum_counter].b[i];
		end

	endgenerate
endmodule