/*
Image processing project : Pan.

Function: Panning a image from your given offset.

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
https://github.com/dtysky/Image-processing-on-FPGA

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

module Pan_TB();

	//For Pan
	parameter im_width_bits = 9;
	parameter im_width = 512;
	parameter im_height = 512;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk, rst_n;
	bit signed [im_width_bits : 0] offset_x, offset_y;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit[im_width_bits - 1 : 0] in_count_x, in_count_y;
	bit out_enable;
	bit[color_width - 1 : 0] out_data;
	bit[im_width_bits - 1 : 0] out_count_x, out_count_y;

	CLOCK CLOCK1(clk);
	Pan #(color_width, im_width, im_height, im_width_bits)
		Pan1(
			clk, rst_n, offset_x, offset_y,
			in_enable, in_data, in_count_x, in_count_y,
			out_enable, out_data, out_count_x, out_count_y); 

	integer fi,fo;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	bit now_start;

	initial begin
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		@(posedge clk);
		for (int i = 0; i < fsize; i++) begin;

			offset_x = 100;
			offset_y = -100;
			rst_n = 0;
			now_start = 0;
			in_enable = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			@(posedge clk);
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,"+100-100.res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			while(!$feof(fi)) begin 
				@(posedge clk);
				in_enable = 1;
				$fscanf(fi, "%b", in_count_x);
				$fscanf(fi, "%b", in_count_y);
				$fscanf(fi, "%b", in_data);
				now_start = 1;
				if(out_enable) begin
					if(~now_start) begin
						$display("%m: at time %t ps , start%0d-0 !", $time, i);
					$fwrite(fo, "%0d , %0d , %0d\n", out_count_x, out_count_y, out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);

			offset_x = -100;
			offset_y = 100;
			rst_n = 0;
			now_start = 0;
			in_enable = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			@(posedge clk);
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,"-100+100.res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			while(!$feof(fi)) begin 
				@(posedge clk);
				in_enable = 1;
				$fscanf(fi, "%b", in_count_x);
				$fscanf(fi, "%b", in_count_y);
				$fscanf(fi, "%b", in_data);
				if(~now_start) begin
					$display("%m: at time %t ps , start%0d-1 !", $time, i);
				end
				now_start = 1;
				if(out_enable) begin
					$fwrite(fo, "%0d , %0d , %0d\n", out_count_x, out_count_y, out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);

		end
		$finish;
	end

endmodule