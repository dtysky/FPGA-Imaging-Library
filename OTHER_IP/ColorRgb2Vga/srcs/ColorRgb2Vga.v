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
	output[11:0] vga
    );

	assign vga[11:8] = rgb24[23:20];
	assign vga[7:4] = rgb24[15:12];
	assign vga[3:0] = rgb24[7:4];

endmodule