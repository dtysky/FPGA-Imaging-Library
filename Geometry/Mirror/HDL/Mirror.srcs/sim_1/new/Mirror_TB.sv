/*
Image processing project : Mirror.

Function: Getting a mirror of your given image.

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
	http://ifl.dtysky.moe

All modules for image processing project:
	https://github.com/dtysky/FPGA-Imaging-Library

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

module Mirror_TB();

	//For Mirror
	parameter im_width_bits = 9;
	parameter im_width = 512;
	parameter im_height = 512;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk, rst_n;
	bit[1 : 0] mode;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit[im_width_bits - 1 : 0] in_count_x, in_count_y;
	bit out_enable;
	bit[color_width - 1 : 0] out_data;
	bit[im_width_bits - 1 : 0] out_count_x, out_count_y;

	CLOCK CLOCK1(clk);
	Mirror #(color_width, im_width, im_height, im_width_bits)
		Mirror1(
			clk, rst_n, mode,
			in_enable, in_data, in_count_x, in_count_y,
			out_enable, out_data, out_count_x, out_count_y); 

	integer fi,fo;
	string fname[$];
	string ftmp, imsize, act_now;
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
			ftmp = fname.pop_back();
			for (int j = 0; j < 3; j++) begin;

				case (j)
					0 : act_now = "Hori";
					1 : act_now = "Vert";
					2 : act_now = "All";
					default : /* default */;
				endcase

				mode = j;
				rst_n = 0;
				now_start = 0;
				in_enable = 0;
				repeat(10) @(posedge clk);
				rst_n = 1;
				@(posedge clk);
				fi = $fopen({ftmp, ".dat"}, "r");
				fo = $fopen({ftmp, act_now, ".res"}, "w");
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
					if(out_enable) begin
						if(~now_start)
							$display("%m: at time %t ps , %0d %s start !", $time, i, act_now);
						now_start = 1;
						$fwrite(fo, "%0d , %0d , %0d\n", out_count_x, out_count_y, out_data);
					end
				end
				$fclose(fi);
				$fclose(fo);
			end
		end
		$finish;
	end

endmodule