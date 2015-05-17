`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/18 14:41:22
// Design Name: ErosionDilationGray
// Module Name: ErosionDilationGray
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define full_win_size window_size * window_size

module ErosionDilationGray(clk, rst_n, mode, template, in_enable, in_data, out_enable, out_data);
	parameter color_width = 8;
	parameter window_size = 3;
	// The highest bit of full_win_size, the lowest bit is "0"
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
	parameter pip_counter = 3;

	input clk, rst_n;
	//0 for erosion, 1 for dilation
	input mode;
	input[window_size * window_size - 1 : 0] template;
	input in_enable;
	input[color_width * window_size * window_size - 1 : 0] in_data;
	output out_enable;
	output[color_width - 1 : 0] out_data;

	reg[3 : 0] con_enable;
	wire signed [color_width : 0] pre_in_data[0 : `full_win_size - 1];
	reg[color_width - 1 : 0] all_max, all_min;

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable) 
			con_enable <= 0;
		else if(con_enable == pip_counter + 1)
			con_enable <= con_enable;
		else
			con_enable <= con_enable + 1;
	end

	assign out_enable = con_enable == pip_counter + 1 ? 1 : 0;

	function signed [color_width : 0] pre_now_pix(
		input[color_width - 1 : 0] pix,
		input template
		);
		assign pre_now_pix = template == 1 ? {1'b0, pix} : -1;
	endfunction

	genvar i;
	genvar j;
	generate
		for (i = 0; i < `full_win_size; i = i + 1) begin
			assign pre_in_data[i] = pre_now_pix(in_data[(i + 1)* color_width - 1 : i * color_width], template[i]);
		end

		for (i = 0; i < pip_counter; i = i + 1) begin : pip
			reg signed [color_width : 0] max[0 : `full_win_size >> i + 1];
			reg signed [color_width : 0] min[0 : `full_win_size >> i + 1];
			for (j = 0; j <= `full_win_size >> i + 1; j = j + 1) begin
				if(i == 0) begin

					if(j == 0 && (`full_win_size % 2 != 0)) begin
						always @(posedge clk) begin
							max[j] <= pre_in_data[`full_win_size - 1];
							min[j] <= pre_in_data[`full_win_size - 1];
						end
					end else if(j == 0 && (`full_win_size % 2 == 0)) begin
						always @(posedge clk) begin
							max[j] <= -1;
							min[j] <= -1;
						end
					end else begin
						always @(posedge clk) begin
							if(pre_in_data[2 * (j - 1)] == -1)begin 
								max[j] <= pre_in_data[2 * (j - 1) + 1];
								min[j] <= pre_in_data[2 * (j - 1) + 1];
							end else if(pre_in_data[2 * (j - 1) + 1] == -1) begin 
								max[j] <= pre_in_data[2 * (j - 1)];
								min[j] <= pre_in_data[2 * (j - 1)];
							end else if(pre_in_data[2 * (j - 1)] > pre_in_data[2 * (j - 1) + 1]) begin
								max[j] <= pre_in_data[2 * (j - 1)];
								min[j] <= pre_in_data[2 * (j - 1) + 1];
							end else begin 
								max[j] <= pre_in_data[2 * (j - 1) + 1];
								min[j] <= pre_in_data[2 * (j - 1)];
							end
						end
					end

				end else begin 

					if(j == 0 && (((`full_win_size >> i) + 1) % 2 != 0)) begin
						always @(posedge clk) begin
							max[j] <= pip[i - 1].max[`full_win_size >> i];
							min[j] <= pip[i - 1].min[`full_win_size >> i];
						end
					end else if(j == 0 && (((`full_win_size >> i) + 1) % 2 == 0)) begin
						always @(posedge clk) begin
							max[j] <= -1;
							min[j] <= -1;
						end
					end else begin

						always @(posedge clk) begin
							if(pip[i - 1].max[2 * (j - 1)] == -1) 
								max[j] <= pip[i - 1].max[2 * (j - 1) + 1];
							else if(pip[i - 1].max[2 * (j - 1) + 1] == -1) 
								max[j] <= pip[i - 1].max[2 * (j - 1)];
							else if(pip[i - 1].max[2 * (j - 1)] > pip[i - 1].max[2 * (j - 1) + 1])
								max[j] <= pip[i - 1].max[2 * (j - 1)];
							else 
								max[j] <= pip[i - 1].max[2 * (j - 1) + 1];
						end

						always @(posedge clk) begin
							if(pip[i - 1].min[2 * (j - 1)] == -1) 
								min[j] <= pip[i - 1].min[2 * (j - 1) + 1];
							else if(pip[i - 1].min[2 * (j - 1) + 1] == -1)
								min[j] <= pip[i - 1].min[2 * (j - 1)];
							else if(pip[i - 1].min[2 * (j - 1)] < pip[i - 1].min[2 * (j - 1) + 1])
								min[j] <= pip[i - 1].min[2 * (j - 1)];
							else
								min[j] <= pip[i - 1].min[2 * (j - 1) + 1];
						end

					end
				end

			end
		end

		always @(posedge clk or rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				all_max <= 0;
			else
				all_max <= pip[pip_counter - 1].max[0] > pip[pip_counter - 1].max[1] ?
					pip[pip_counter - 1].max[0][color_width - 1 : 0] :
					pip[pip_counter - 1].max[1][color_width - 1 : 0];
		end

		always @(posedge clk or rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				all_min <= 0;
			else
				all_min <= pip[pip_counter - 1].min[0] < pip[pip_counter - 1].min[1] ?
					pip[pip_counter - 1].min[0][color_width - 1 : 0] :
					pip[pip_counter - 1].min[1][color_width - 1 : 0];
		end

		assign out_data = mode ? all_max : all_min;

	endgenerate

endmodule