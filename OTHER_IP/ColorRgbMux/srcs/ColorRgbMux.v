`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: dtysky
// 
// Create Date: 2015/02/05 18:01:07
// Design Name: 
// Module Name: ColorRgb2Vga
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependenrgb24es: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ColorRgbMux(sel,rgb_i0,rgb_i1,rgb_i2,rgb_i3,rgb_o);

	parameter rgb_width = 24;

	input[1:0] sel;
	input[rgb_width-1 : 0] rgb_i0;
	input[rgb_width-1 : 0] rgb_i1;
	input[rgb_width-1 : 0] rgb_i2;
	input[rgb_width-1 : 0] rgb_i3;
	output[rgb_width-1 : 0] rgb_o;
	reg[rgb_width-1 : 0] r_rgb_o;

	always @(*) begin
		case (sel)
			2'b00 : r_rgb_o <= rgb_i0;
			2'b01 : r_rgb_o <= rgb_i1;
			2'b10 : r_rgb_o <= rgb_i2;
			2'b11 : r_rgb_o <= rgb_i3;
		endcase
	end

	assign rgb_o = r_rgb_o;

endmodule