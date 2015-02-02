`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/02/2 02:02:04
// Design Name: LM_CT_TRANS
// Module Name: LM_CT_TRANS
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
module LM_CT_TRANS(
	input[8:0] lm,
	input[15:0] ct,
	input[7:0] ci,
	output[7:0] co,
	output[7:0] mul_a,
	output[15:0] mul_b,
	input[23:0] mul_r
    );

	function[7:0] lm_pro(input signed [8:0] ci, input signed [8:0] lm);
		reg signed [9:0] tmp;
		begin
			tmp = ci + lm;
			case (tmp[9:8])
				//-
				2'b10 : lm_pro = 8'h0;
				2'b11 : lm_pro = 8'h0;
				//+ , over
				2'b01 : lm_pro = 8'hff;
				//normal
				default : lm_pro = tmp[7:0];
			endcase
		end
	endfunction

	assign mul_a = ci;
	assign mul_b = ct;

	wire[7:0] ct_res = mul_r[23:16] ? 8'hff : mul_r[15:8];

	wire signed [8:0] ct_tmp = {1'b0,ct_res};

	assign co = lm_pro(ct_tmp,lm);

endmodule