`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/03/12 21:53:21
// Design Name: ChessWindowFiter
// Module Name: ChessWindowFiter
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


module ChessWindowFiter();
	
	parameter pic_addr_bit = 13;
	parameter pic_data_bits = 1;
	parameter reco_color = 0;
	parameter pic_wh_bits =12;
	parameter grid_wh_bits = 4;
	parameter grid_dia_bits = pic_wh_bits - grid_wh_bits;

	input inclk,rst_n;
	output[pic_addr_bit - 1 : 0] pic_addr;
	input[pic_data_bits - 1 : 0] pic_data;
	input[pic_wh_bits*2 - 1 : 0] left_top,right_buttom;
	input[pic_wh_bits - 1 : 0] pic_width,pic_height;
	input[grid_dia_bits - 1 : 0] grid_dia;
	input[grid_wh_bits*2 - 1 : 0] reco_th;
	input[grid_wh_bits -1 : 0] grid_width,grid_height,grids_addr;
	input[pic_wh_bits - 1 : 0] con_pic_row,con_pic_col;
	output[data_bits -1 : 0] grids_data;

	wire[4:0] grid_rad = grid_dia >> 2;
	wire in_range_left = (con_pic_col + grid_rad >= left_top[pic_wh_bits*2 - 1 : pic_wh_bits]) ? 1 : 0;
	wire in_range_top = (con_pic_col + grid_rad >= left_top[pic_wh_bits - 1 : 0]) ? 1 : 0;
	wire in_range_right = (con_pic_col - grid_rad >= right_buttom[pic_wh_bits*2 - 1 : pic_wh_bits]) ? 1 : 0;
	wire in_range_bottom = (con_pic_col - grid_rad >= right_buttom[pic_wh_bits - 1 : 0]) ? 1 : 0;
	wire in_range = in_range_left && in_range_top && in_range_right && in_range_bottom;
	wire can_work = rst_n && in_range;

	// mapping
	//grids_list[grid_width(grid_wh_bits)grid_height(grid_wh_bits)]
	reg[0 : grid_dia_bits*2 - 1] grids_list[0 : grid_wh_bits*2 - 1];
	reg[0 : grid_wh_bits - 1] grids_res[0 : grid_wh_bits - 1];
	reg[grid_dia_bits - 1 : 0] con_one_row,con_one_col;
	reg[grid_wh_bits - 1 : 0] con_grid_row,con_grid_col;

	initial begin 
		for (int i = 0; i < grid_wh_bits*2; i = i + 1) begin
			grids_list[i] = 0;
		end
		con_one_row = 0;
		con_one_col = 0;
		con_grid_row = 0;
		con_grid_col = 0;
		con_pic_row = 0;
		con_pic_col = 0;
	end

	assign grids_data = grids_list[grid_addr];

	always @(posedge inclk or negedge can_work) begin : one_grid_col
		if(~can_work || con_one_col == grid_dia - 1)
			con_one_col <= 0;
		else 
			con_one_col <= con_one_col +1;
	end

	always @(posedge inclk or negedge rst_n) begin : now_grid_col
		if(~rst_n) 
			con_grid_col <= 0;
		else if (con_one_col == grid_dia - 1) begin
			if(con_grid_col == grid_width - 1)
				con_grid_col <= 0;
			else
				con_grid_col <= con_grid_col +1;
		end else
			con_grid_col <= con_grid_col;
	end

	always @(posedge inclk or negedge rst_n) begin : one_grid_row
		if(~rst_n) 
			con_one_row <= 0;
		else if (con_grid_col == grid_width - 1) begin
			if(con_one_row == grid_dia - 1)
				con_one_row <= 0;
			else
				con_one_row <= con_one_row +1;
		end else
			con_one_row <= con_one_row;
	end

	always @(posedge inclk or negedge rst_n) begin : now_grid_row
		if(~rst_n) 
			con_grid_row <= 0;
		else if (con_one_row == grid_dia - 1) begin
			if(con_grid_row == grid_height - 1)
				con_grid_row <= 0;
			else
				con_grid_row <= con_grid_row +1;
		end else
			con_grid_row <= con_grid_row;
	end

	always @(posedge inclk or negedge rst_n) begin : add_to_pic
		if(~rst_n)
			pic_addr <= 0;
		else if (con_pic_col == pic_width - 1 && con_pic_row == pic_height - 1)
			pic_addr <= 0;
		else
			pic_addr <= pic_addr + 1;
	end

	always @(posedge inclk) begin : reco_main
		if (pic_data == reco_color)
			grids_list[{now_grid_row,now_grid_col}] <= grids_list[{now_grid_row,now_grid_col}] + 1;
		else
			grids_list[{now_grid_row,now_grid_col}] <= grids_list[{now_grid_row,now_grid_col}];
	
		if (con_one_col == grid_dia - 1 && con_one_row == grid_dia - 1) begin
			if (grids_list[{now_grid_row,now_grid_col}] > reco_th)
				grids_res[{now_grid_row,now_grid_col}] <= 1;
			else
				grids_res[{now_grid_row,now_grid_col}] <= 0;
		end else
			grids_res[{now_grid_row,now_grid_col}] <= grids_res[{now_grid_row,now_grid_col}];
	end


endmodule 