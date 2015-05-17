`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/20 15:10:51
// Design Name: Gary2BinAuto
// Module Name: Gary2BinAuto
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


module Gary2BinAuto(clk, rst_n, org_enable, org_data, ref_enable, ref_data, out_enable, out_data);
	parameter color_width = 8;
	parameter ref_window_size = 5;

	input clk, rst_n;
	input org_enable;
	input[ref_window_size * ref_window_size * color_width - 1 : 0] org_data;
	input ref_enable;
	input[color_width - 1 : 0] ref_data;
	output out_enable;
	output out_data;

	reg[3 : 0] con_out;
	reg reg_out_data;

	always @(posedge clk or negedge rst_n or negedge org_enable) begin
		if(~rst_n || ~org_enable)
			con_out <= 0;
		else if(~ref_enable)
			con_out <= con_out + 1;
		else
			con_out <= con_out;
	end

	always @(*) begin
		case(con_out)
			0 : reg_out_data <= buffer[0].b < ref_data ? 0 : 1;
			1 : reg_out_data <= buffer[1].b < ref_data ? 0 : 1;
			2 : reg_out_data <= buffer[2].b < ref_data ? 0 : 1;
			3 : reg_out_data <= buffer[3].b < ref_data ? 0 : 1;
			4 : reg_out_data <= buffer[4].b < ref_data ? 0 : 1;
			5 : reg_out_data <= buffer[5].b < ref_data ? 0 : 1;
			6 : reg_out_data <= buffer[6].b < ref_data ? 0 : 1;
			7 : reg_out_data <= buffer[7].b < ref_data ? 0 : 1;
			8 : reg_out_data <= buffer[8].b < ref_data ? 0 : 1;
			9 : reg_out_data <= buffer[9].b < ref_data ? 0 : 1;
			10 : reg_out_data <= buffer[10].b < ref_data ? 0 : 1;
			11 : reg_out_data <= buffer[11].b < ref_data ? 0 : 1;
			12 : reg_out_data <= buffer[12].b < ref_data ? 0 : 1;
			13 : reg_out_data <= buffer[13].b < ref_data ? 0 : 1;
			14 : reg_out_data <= buffer[14].b < ref_data ? 0 : 1;
			15 : reg_out_data <= buffer[15].b < ref_data ? 0 : 1;
			default: ;
		endcase
	end

	assign out_enable = ref_enable;
	assign out_data = reg_out_data;

	genvar i, j;
	generate
		for (i = 0; i < 16; i = i + 1) begin : buffer
			reg[color_width - 1 : 0] b;
			if(i == 0) begin 
				always @(posedge clk)
					b <= org_data[((ref_window_size * ref_window_size >> 1) + 1) * color_width - 1 : (ref_window_size * ref_window_size >> 1) * color_width];
			end else begin 
				always @(posedge clk)
					b <= buffer[i - 1].b;
			end		
		end
	endgenerate

endmodule