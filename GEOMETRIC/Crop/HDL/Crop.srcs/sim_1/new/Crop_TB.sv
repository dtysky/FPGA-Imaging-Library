`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/13 14:26:56
// Design Name: Crop
// Module Name: Crop_TB
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
module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

module Crop_TB();

	parameter color_width = 8;
	parameter im_bits_width = 9;
	parameter im_width = 320;
	parameter im_height = 240;

	bit clk,rst_n;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit out_enable;
	bit[color_width - 1 : 0] out_data;
	bit[im_bits_width - 1 : 0] top, bottom, left, right;
	bit in_range;


	CLOCK CLOCK1(clk);
	Crop #(color_width, im_bits_width, im_width, im_height)
		MF1(clk, rst_n, top, bottom, left, right, in_enable, in_data, out_enable, out_data, in_range);

	integer fi,fo;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	bit now_start = 0;

	initial begin
		top = 40;
		bottom = 200;
		left = 40;
		right = 280;
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		for (int i = 0; i < fsize; i++) begin;
			rst_n = 0;
			in_enable = 0;
			now_start = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,".res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			while (!$feof(fi)) begin 
				@(posedge clk);
				$fscanf(fi,"%b",in_data);
				in_enable = 1;
				if(out_enable) begin
					if(~now_start)
						$display("%m: at time %t ps , start%d !", $time, i);
					now_start = 1;
					$fwrite(fo,"%d\n",out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule