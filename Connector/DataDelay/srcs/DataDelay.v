`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: DataDelay
// Module Name: DataDelay
// Project Name: Image processing project
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


module DataDelay(clk, in_data, out_data);

	parameter data_width = 8;
	parameter delay = 1;

	input clk;
	input[data_width - 1 : 0] in_data;
	output[data_width - 1 : 0] out_data;

	genvar i;
	generate
		for (i = 0; i < delay; i = i + 1) begin : pip
			reg[data_width - 1 : 0] tmp;
			if(i == 0) begin
				always @(posedge clk)
					tmp <= in_data;
			end else begin
				always @(posedge clk)
					tmp <= pip[i - 1].tmp;
			end
		end

		assign out_data = pip[delay - 1].tmp;

	endgenerate
	

endmodule