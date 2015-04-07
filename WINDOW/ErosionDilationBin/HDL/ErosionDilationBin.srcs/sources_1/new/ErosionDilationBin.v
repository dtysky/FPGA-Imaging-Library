`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 12:53:07
// Design Name: ErosionDilationBin
// Module Name: ErosionDilationBin
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


module ErosionDilationBin(clk, rst_n, mode, template, in_enable, in_data, out_enable, out_data);
	parameter window_size = 5;
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
	parameter pip_counter = 4;
	parameter full_win_size = window_size * window_size;

	input clk, rst_n;
	//0 for erosion, 1 for dilation
	input mode;
	input[full_win_size - 1 : 0] template;
	input in_enable;
	input[full_win_size - 1 : 0] in_data;
	output out_enable;
	output out_data;

	reg[3 : 0] con_enable;

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable) 
			con_enable <= 0;
		else if(con_enable == pip_counter)
			con_enable <= con_enable;
		else
			con_enable <= con_enable + 1;
	end

	assign out_enable = con_enable == pip_counter ? 1 : 0;

	function pre_now_pix(input pix, mode, template);
		pre_now_pix = pix ^ mode | ~template;
	endfunction

	genvar i;
	genvar j;
	generate

		for (i = 0; i < pip_counter; i = i + 1) begin : pip
			reg res[0 : (full_win_size >> i + 1) - 1];
			for (j = 0; j < full_win_size >> i + 1; j = j + 1) begin
				if(i == 0) begin

					if(j == 0 && ((full_win_size >> i) % 2 != 0)) begin
						always @(posedge clk)
							res[j] <= 
								pre_now_pix(in_data[full_win_size - 1], mode, template[full_win_size - 1]) &
								pre_now_pix(in_data[2 * j], mode, template[2 * j]) &
								pre_now_pix(in_data[2 * j + 1], mode, template[2 * j + 1]);
					end else begin
						always @(posedge clk)
							res[j] <= 
								pre_now_pix(in_data[2 * j], mode, template[2 * j]) &
								pre_now_pix(in_data[2 * j + 1], mode, template[2 * j + 1]);
					end


				end else begin 

					if(j == 0 && ((full_win_size >> i) % 2 != 0)) begin
						always @(posedge clk)
							res[j] <= pip[i - 1].res[(full_win_size >> i) - 1] & pip[i - 1].res[2 * j] & pip[i - 1].res[2 * j + 1];
					end else begin
						always @(posedge clk)
							res[j] <= pip[i - 1].res[2 * j] & pip[i - 1].res[2 * j + 1];
					end
				end

			end
		end

		assign out_data = ~rst_n || ~in_enable ? 0 : pip[pip_counter - 1].res[0] ^ mode;

	endgenerate

endmodule