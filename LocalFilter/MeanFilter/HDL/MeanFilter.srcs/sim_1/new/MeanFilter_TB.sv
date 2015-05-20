//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
MeanFilter

:Function
Local filter - Mean filter, it always used for smoothing images. 
It will give the first output after sum_stage cycles while the input enable. 

:Module
Test bench

:Version
1.0

:Modified
2015-05-20

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
	parameter[3 : 0] window_width = 3;
	parameter[3: 0] color_width = 8;
	parameter sum_stage = 3;
	bit in_enable;
	bit[color_width * window_width * window_width - 1 : 0] in_data;
	bit out_ready;
	bit[color_width - 1 : 0] out_data;
endinterface

module MeanFilter_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;
	integer window_width;

	bit clk, rst_n;
	TBInterface #(3, 8, 3) GrayPipelinex3(clk, rst_n);
	TBInterface #(5, 8, 4) GrayPipelinex5(clk, rst_n);
	TBInterface #(3, 8, 3) GrayReqAckx3(clk, rst_n);
	TBInterface #(5, 8, 4) GrayReqAckx5(clk, rst_n);
	CLOCK CLOCK1 (clk);
	MeanFilter #(0, GrayPipelinex3.window_width, GrayPipelinex3.color_width, GrayPipelinex3.sum_stage) 
		MFGrayPipelinex3(GrayPipelinex3.clk, GrayPipelinex3.rst_n,  
			GrayPipelinex3.in_enable, GrayPipelinex3.in_data, GrayPipelinex3.out_ready, GrayPipelinex3.out_data);
	MeanFilter #(0, GrayPipelinex5.window_width, GrayPipelinex5.color_width, GrayPipelinex5.sum_stage) 
		MFGrayPipelinex5(GrayPipelinex5.clk, GrayPipelinex5.rst_n,  
			GrayPipelinex5.in_enable, GrayPipelinex5.in_data, GrayPipelinex5.out_ready, GrayPipelinex5.out_data);
	MeanFilter #(1, GrayReqAckx3.window_width, GrayReqAckx3.color_width, GrayReqAckx3.sum_stage) 
		MFGrayReqAckx3(GrayReqAckx3.clk, GrayReqAckx3.rst_n,  
			GrayReqAckx3.in_enable, GrayReqAckx3.in_data, GrayReqAckx3.out_ready, GrayReqAckx3.out_data);
	MeanFilter #(1, GrayReqAckx5.window_width, GrayReqAckx5.color_width, GrayReqAckx5.sum_stage) 
		MFGrayReqAckx5(GrayReqAckx5.clk, GrayReqAckx5.rst_n,  
			GrayReqAckx5.in_enable, GrayReqAckx5.in_data, GrayReqAckx5.out_ready, GrayReqAckx5.out_data);

	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%d", window_width);
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		GrayPipelinex3.in_enable = 0;
		GrayPipelinex5.in_enable = 0;
		GrayReqAckx3.in_enable = 0;
		GrayReqAckx5.in_enable = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
		repeat(10) @(posedge clk);
	endtask : init_signal

	task work_pipeline();
		@(posedge clk);
		if(window_width == 3) begin
			GrayPipelinex3.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipelinex3.in_data);
		end else if(window_width == 5) begin
			GrayPipelinex5.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipelinex5.in_data);
		end
		if(GrayPipelinex3.out_ready | GrayPipelinex5.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			if(window_width == 3)
				$fwrite(fo, "%d\n", GrayPipelinex3.out_data);
			else if(window_width == 5)
				$fwrite(fo, "%d\n", GrayPipelinex5.out_data);
		end
	endtask : work_pipeline

	task work_reqack();
		repeat(1) @(posedge clk);
		if(window_width == 3) begin
			GrayReqAckx3.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayReqAckx3.in_data);
		end else if(window_width == 5) begin
			GrayReqAckx5.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayReqAckx5.in_data);
		end
		while(~(GrayReqAckx3.out_ready | GrayReqAckx5.out_ready))
			@(posedge clk);
		if(~now_start)
			$display("%m: at time %0t ps , %s-reqack working start !", $time, ftmp);
		now_start = 1;
		if(window_width == 3)
			$fwrite(fo, "%d\n", GrayReqAckx3.out_data);
		else if(window_width == 5)
			$fwrite(fo, "%d\n", GrayReqAckx5.out_data);
		GrayReqAckx3.in_enable = 0;
		GrayReqAckx5.in_enable = 0;
	endtask : work_reqack

	initial begin
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			fst = $fscanf(fi, "%s", ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		repeat(2000) @(posedge clk);
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
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, "-reqack.res"}, "w");
			init_file();
			init_signal();
			while (!$feof(fi)) begin 
				work_reqack();
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule