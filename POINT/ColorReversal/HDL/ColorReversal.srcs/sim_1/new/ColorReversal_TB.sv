/*
Image processing project : ColorReversal.

Function: Get a reversal all ponit's color.

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
	http://fil.dtysky.moe

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

interface TBInterface (input bit clk);
	parameter channels = 3;
	parameter color_width = 8;
	bit in_enable;
	bit[channels * color_width - 1 : 0] in_data;
	bit out_ready;
	bit[channels * color_width - 1 : 0] out_data;
endinterface

module ColorReversal_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;

	bit clk, rst_n;
	TBInterface #(3, 8) RGB(clk);
	TBInterface #(1, 8) Gray(clk);
	TBInterface #(1, 1) Bin(clk);
	CLOCK CLOCK1(clk);
	ColorReversal #(3, 8)
		CRRGB(clk, rst_n, RGB.in_enable, RGB.in_data, RGB.out_ready, RGB.out_data);
	ColorReversal #(1, 8)
		CRGray(clk, rst_n, Gray.in_enable, Gray.in_data, Gray.out_ready, Gray.out_data);
	ColorReversal #(1, 1)
		CRBin(clk, rst_n, Bin.in_enable, Bin.in_data, Bin.out_ready, Bin.out_data);

	initial begin

		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			@(posedge clk);
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, ".res"}, "w");
			//Keep xsize and ysize
			$fscanf(fi, "%s", imconf);
			$fwrite(fo, "%s\n", imconf);
			$fscanf(fi, "%s", imconf);
			$fwrite(fo, "%s\n", imconf);
			$fscanf(fi, "%s", imconf);
			$fwrite(fo, "%s\n", imconf);
			rst_n = 0;
			now_start = 0;
			RGB.in_enable = 0;
			Gray.in_enable = 0;
			Bin.in_enable = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			while(!$feof(fi)) begin 
				@(posedge clk);
				if(imconf == "RGB") begin
					RGB.in_enable = 1;
					$fscanf(fi, "%b", RGB.in_data);
				end else if(imconf == "L") begin
					Gray.in_enable = 1;
					$fscanf(fi, "%b", Gray.in_data);
				end else if(imconf == "1") begin
					Bin.in_enable = 1;
					$fscanf(fi, "%b", Bin.in_data);
				end
				if(RGB.out_ready | Gray.out_ready | Bin.out_ready) begin
					if(~now_start)
						$display("%m: at time %0t ps , %s working start !", $time, ftmp);
					now_start = 1;
					if(imconf == "RGB")
						$fwrite(fo, "%0d %0d %0d\n", 
							RGB.out_data[23 : 16], RGB.out_data[15 : 8], RGB.out_data[7 : 0]);
					else if(imconf == "L")
						$fwrite(fo, "%0d\n", Gray.out_data);
					else if(imconf == "1")
						$fwrite(fo, "%0d\n", Bin.out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule