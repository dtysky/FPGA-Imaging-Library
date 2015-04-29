/*
Image processing project : Crop.

Function: Cropping a image, depending on your top, bottom, left and right coordinate.

Testbench.

Copyright (C) 2015  Dai Tianyu (dtysky)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Documents for all modules:
	http://image-on-fpga.dtysky.moe

All modules for image processing project:
	https://github.com/dtysky/FPGA-Imaging-Libaray

This mail is for connecting me:
	dtysky@outlook.com

My blog is here:
	http://dtysky.moe

*/

`timescale 1ns / 1ps

module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

module Crop_TB();

	parameter color_width = 8;
	parameter im_width_bits = 9;
	parameter im_width = 512;
	parameter im_height = 512;

	bit clk,rst_n;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit[im_width_bits - 1 : 0] in_count_x, in_count_y;
	bit out_enable;
	bit[color_width - 1 : 0] out_data;
	bit[im_width_bits - 1 : 0] out_count_x, out_count_y;
	bit[im_width_bits - 1 : 0] top, bottom, left, right;
	bit in_range;


	CLOCK CLOCK1(clk);
	Crop #(color_width, im_width_bits, im_width, im_height)
		Crop1(
			clk, rst_n, top, bottom, left, right,
			in_enable, in_data, in_count_x, in_count_y,
			out_enable, out_data, out_count_x, out_count_y, in_range);

	integer fi,fo;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	bit now_start = 0;

	initial begin
		top = 50;
		bottom = 462;
		left = 50;
		right = 462;
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
				$fscanf(fi, "%b", in_count_x);
				$fscanf(fi, "%b", in_count_y);
				$fscanf(fi, "%b", in_data);
				in_enable = 1;
				if(out_enable) begin
					if(~now_start)
						$display("%m: at time %t ps , start%d !", $time, i);
					now_start = 1;
					$fwrite(fo, "%0d , %0d , %0d\n", out_count_x, out_count_y, out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule