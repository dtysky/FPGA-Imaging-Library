`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/02/05 18:01:07
// Design Name: 
// Module Name: Color16to24
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependenrgb16es: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Color16to24(
	input[15 : 0] rgb16,
	output[23 : 0] rgb24
    );

	assign rgb24[23 : 16] = {rgb16[15 : 11], rgb16[15 : 13]};
	assign rgb24[15:8] = {rgb16[10 : 5], rgb16[10 : 9]};
	assign rgb24[7:0] = {rgb16[4 : 0], rgb16[4 : 2]};

endmodule