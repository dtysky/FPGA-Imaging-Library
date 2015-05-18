//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
RowsGenerator

:Function
Generate rows cache, **this module just support Pipeline mode !!!** 
The lowest color_width-bits of out_data are the first row! 
You can configure all fifos by yourself, but fifos in one project whcih have same name must have same configurations. 
And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 ! 
Give the first output after rows_width * (rows_depth + 1) cycles while the input enable.

:Module
Test bench

:Version
1.0

:Modified
2015-05-18

Copyright (C) 2015 Tianyu Dai (dtysky) <dtysky@outlook.com>

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

Homepage for this project:
	http://fil.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
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

interface TBInterface (input bit clk, input bit rst_n);
	parameter[4 : 0] rows_width = 3;
	parameter[3: 0] color_width = 8;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit out_ready;
	bit[rows_width * color_width - 1 : 0] out_data;
endinterface

module RowsGenerator_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;
	integer rows_width;

	bit clk, rst_n;
	TBInterface #(3, 1) BinPipelinex3(clk, rst_n);
	TBInterface #(3, 8) GrayPipelinex3(clk, rst_n);
	TBInterface #(5, 1) BinPipelinex5(clk, rst_n);
	TBInterface #(5, 8) GrayPipelinex5(clk, rst_n);
	CLOCK CLOCK1 (clk);
	RowsGenerator #(BinPipelinex3.rows_width, 500, 1, 3, 9) 
		RGBinPipelinex3(BinPipelinex3.clk, BinPipelinex3.rst_n,  
			BinPipelinex3.in_enable, BinPipelinex3.in_data, BinPipelinex3.out_ready, BinPipelinex3.out_data);
	RowsGenerator #(GrayPipelinex3.rows_width, 500, 8, 3, 9) 
		RGGrayPipelinex3(GrayPipelinex3.clk, GrayPipelinex3.rst_n,  
			GrayPipelinex3.in_enable, GrayPipelinex3.in_data, GrayPipelinex3.out_ready, GrayPipelinex3.out_data);
	RowsGenerator #(BinPipelinex5.rows_width, 500, 1, 3, 9) 
		RGBinPipelinex5(BinPipelinex5.clk, BinPipelinex5.rst_n,  
			BinPipelinex5.in_enable, BinPipelinex5.in_data, BinPipelinex5.out_ready, BinPipelinex5.out_data);
	RowsGenerator #(GrayPipelinex5.rows_width, 500, 8, 3, 9) 
		RGGrayPipelinex5(GrayPipelinex5.clk, GrayPipelinex5.rst_n,  
			GrayPipelinex5.in_enable, GrayPipelinex5.in_data, GrayPipelinex5.out_ready, GrayPipelinex5.out_data);

	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%d", rows_width);
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		BinPipelinex3.in_enable = 0;
		GrayPipelinex3.in_enable = 0;
		BinPipelinex5.in_enable = 0;
		GrayPipelinex5.in_enable = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
	endtask : init_signal

	task work_pipeline();
		@(posedge clk);
		if(imconf == "1" && rows_width == 3) begin
			BinPipelinex3.in_enable = 1;
			fst = $fscanf(fi, "%b", BinPipelinex3.in_data);
		end else if(imconf == "1" && rows_width == 5) begin
			BinPipelinex5.in_enable = 1;
			fst = $fscanf(fi, "%b", BinPipelinex5.in_data);
		end else if(imconf == "L" && rows_width == 3) begin
			GrayPipelinex3.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipelinex3.in_data);
		end else if(imconf == "L" && rows_width == 5) begin
			GrayPipelinex5.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipelinex5.in_data);
		end
		if(BinPipelinex3.out_ready | BinPipelinex5.out_ready | GrayPipelinex3.out_ready | GrayPipelinex5.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			if(imconf == "1" && rows_width == 3)
				$fwrite(fo, "%b\n", BinPipelinex3.out_data);
			else if(imconf == "1" && rows_width == 5)
				$fwrite(fo, "%b\n", BinPipelinex5.out_data);
			else if(imconf == "L" && rows_width == 3)
				$fwrite(fo, "%b\n", GrayPipelinex3.out_data);
			else if(imconf == "L" && rows_width == 5)
				$fwrite(fo, "%b\n", GrayPipelinex5.out_data);
		end
	endtask : work_pipeline

	initial begin
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			fst = $fscanf(fi, "%s", ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		repeat(5000) @(posedge clk);
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, "-pipeline.res"}, "w");
			init_file();
			init_signal();
			while (!$feof(fi)) begin 
				work_pipeline();
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule