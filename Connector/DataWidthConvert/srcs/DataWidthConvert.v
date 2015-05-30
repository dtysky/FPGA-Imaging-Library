`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: 
// Module Name: DataWidthConvert
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


module DataWidthConvert(i, o);

	parameter data_width_in = 32;
	parameter data_width_out = 4;	

	input[data_width_in - 1 : 0] i;
	output[data_width_out - 1 : 0] o;

	generate
		if(data_width_in >= data_width_out) begin
			assign o = i[data_width_in - 1 : 0];
		end else begin 
			assign o = {{data_width_out - data_width_in{1'b0}} ,i};
		end
	endgenerate
endmodule