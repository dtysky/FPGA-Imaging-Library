`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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


module ColorRgb2Vga(
	input[23:0] rgb24,
	output[15:0] vga
    );

	assign vga[15:11] = rgb24[23:19];
	assign vga[10:5] = rgb24[15:10];
	assign vga[4:0] = rgb24[7:3];

endmodule