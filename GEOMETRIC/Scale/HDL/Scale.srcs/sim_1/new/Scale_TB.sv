/*
Image processing project : Scale.

Function: Scaling an image by your given scale.

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

module Scale_TB();

	//For Frame
	parameter im_width_bits = 9;
	parameter im_width = 400;
	parameter im_height = 400;
	parameter addr_width = 18;
	parameter ram_read_latency = 2;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk, rst_n;
	//16{integer}.16{decimal}
	bit[31 : 0] scale_x, yscale;
	bit in_enable;
	bit out_enable;
	bit[color_width - 1 : 0] out_data;

	bit[im_width_bits - 1 : 0] in_count_xW, in_count_yW;
	bit in_enableW;
	bit[color_width - 1 : 0] in_dataW;
	bit out_enableW;
	bit[color_width - 1 : 0] out_dataW;
	bit[addr_width - 1 : 0] ram_addrW;
	bit[im_width_bits - 1 : 0] out_count_xW, out_count_yW;

	bit[im_width_bits - 1 : 0] in_count_xR, in_count_yR;
	bit in_enableR;
	bit[color_width - 1 : 0] in_dataR;
	bit out_enableR;
	bit[color_width - 1 : 0] out_dataR;
	bit[addr_width - 1 : 0] ram_addrR;
	bit[im_width_bits - 1 : 0] out_count_xR, out_count_yR;

	CLOCK CLOCK1(clk);
	Scale #(color_width, im_width, im_height, im_width_bits)
		Scale1(
			clk, rst_n, scale_x, yscale, in_enable,
			out_enableR, out_dataR, in_enableR, in_count_xR, in_count_yR,
			out_enable, out_data); 
	FrameController2 #(0, color_width, im_width, im_height, im_width_bits, addr_width, ram_read_latency)
		FrameWrite (clk, rst_n, in_enableW, in_dataW, in_count_xW, in_count_yW, out_enableW, out_dataW, out_count_xW, out_count_yW, ram_addrW);
	FrameController2 #(1, color_width, im_width, im_height, im_width_bits, addr_width, ram_read_latency)
		FrameRead (clk, rst_n, in_enableR, in_dataR, in_count_xR, in_count_yR, out_enableR, out_dataR, out_count_xR, out_count_yR, ram_addrR);
	//Write clock must be in the middle of data and address !
	BRam BRam1(clk, out_enableW, ram_addrW, out_dataW, clk, ram_addrR, in_dataR);

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
		repeat(1100) @(posedge clk);
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			rst_n = 0;
			now_start = 0;
			in_enable = 0;
			in_enableW = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			@(posedge clk);
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, ".res"}, "w");
			//Keep xsize and ysize
			$fscanf(fi, "%s", imsize);
			$fwrite(fo,"%s\n", imsize);
			$fscanf(fi, "%s", imsize);
			$fwrite(fo, "%s\n", imsize);
			$fscanf(fi, "%b", scale_x);
			$fscanf(fi, "%b", yscale);
			while(!$feof(fi)) begin 
				@(posedge clk);
				in_enableW = 1;
				$fscanf(fi, "%b", in_count_xW);
				$fscanf(fi, "%b", in_count_yW);
				$fscanf(fi, "%b", in_dataW);
				if(out_enableW) begin
					if(~now_start)
						$display("%m: at time %t ps , %s writing bram start !", $time, ftmp);
					now_start = 1;
				end
			end
			in_enableW = 0;
			now_start = 0;
			repeat(10) @(posedge clk);
			for (int j = 0; j < im_height * im_width; j++) begin
				@(posedge clk);
				in_enable = 1;
				if(out_enable) begin
					if(~now_start)
						$display("%m: at time %t ps , %s working start !", $time, ftmp);
					now_start = 1;
					$fwrite(fo, "%0d\n", out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule