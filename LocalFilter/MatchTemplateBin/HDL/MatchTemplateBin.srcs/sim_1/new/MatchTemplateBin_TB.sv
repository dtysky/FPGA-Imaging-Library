//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
MatchTemplateBin

:Function
Match a binary from template for binary images. 
It will give the first output after 1 cycle while in_enable enable. 

:Module
Test bench

:Version
1.0

:Modified
2015-05-25

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
module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

interface TBInterface (input bit clk, input bit rst_n);
	parameter[3 : 0] window_width = 3;
	bit mode;
	bit[window_width * window_width - 1 : 0] template;
	bit in_enable;
	bit[window_width * window_width - 1 : 0] in_data;
	bit out_ready;
	bit out_data;
endinterface

module MatchTemplateBin_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;
	int window_width;

	bit clk, rst_n;
	TBInterface #(3) BinPipelinex3(clk, rst_n);
	TBInterface #(3) BinReqAckx3(clk, rst_n);
	TBInterface #(5) BinPipelinex5(clk, rst_n);
	TBInterface #(5) BinReqAckx5(clk, rst_n);
	CLOCK CLOCK1 (clk);
	MatchTemplateBin #(0, BinPipelinex3.window_width) 
		MTBBinPipelinex3(BinPipelinex3.clk, BinPipelinex3.rst_n, BinPipelinex3.template, 
			BinPipelinex3.in_enable, BinPipelinex3.in_data, BinPipelinex3.out_ready, BinPipelinex3.out_data);
	MatchTemplateBin #(1, BinReqAckx3.window_width) 
		MTBBinReqAckx3(BinReqAckx3.clk, BinReqAckx3.rst_n, BinReqAckx3.template, 
			BinReqAckx3.in_enable, BinReqAckx3.in_data, BinReqAckx3.out_ready, BinReqAckx3.out_data);
	MatchTemplateBin #(0, BinPipelinex5.window_width) 
		MTBBinPipelinex5(BinPipelinex5.clk, BinPipelinex5.rst_n, BinPipelinex5.template, 
			BinPipelinex5.in_enable, BinPipelinex5.in_data, BinPipelinex5.out_ready, BinPipelinex5.out_data);
	MatchTemplateBin #(1, BinReqAckx5.window_width) 
		MTBBinReqAckx5(BinReqAckx5.clk, BinReqAckx5.rst_n, BinReqAckx5.template, 
			BinReqAckx5.in_enable, BinReqAckx5.in_data, BinReqAckx5.out_ready, BinReqAckx5.out_data);

	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%d", window_width);
		if(window_width == 3) begin
			fst = $fscanf(fi, "%b", BinPipelinex3.template);
			BinReqAckx3.template = BinPipelinex3.template;
		end else begin
			fst = $fscanf(fi, "%b", BinPipelinex5.template);
			BinReqAckx5.template = BinPipelinex5.template;
		end
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		BinPipelinex3.in_enable = 0;
		BinPipelinex5.in_enable = 0;
		BinReqAckx3.in_enable = 0;
		BinReqAckx5.in_enable = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
		repeat(10) @(posedge clk);
	endtask : init_signal

	task work_pipeline();
		@(posedge clk);
		if(window_width == 3) begin
			BinPipelinex3.in_enable = 1;
			fst = $fscanf(fi, "%b", BinPipelinex3.in_data);
		end else if(window_width == 5) begin
			BinPipelinex5.in_enable = 1;
			fst = $fscanf(fi, "%b", BinPipelinex5.in_data);
		end
		if(BinPipelinex3.out_ready | BinPipelinex5.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			if(window_width == 3)
				$fwrite(fo, "%0d\n", BinPipelinex3.out_data);
			else if(window_width == 5)
				$fwrite(fo, "%0d\n", BinPipelinex5.out_data);
		end
	endtask : work_pipeline

	task work_reqack();
		repeat(1) @(posedge clk);
		if(window_width == 3) begin
			BinReqAckx3.in_enable = 1;
			fst = $fscanf(fi, "%b", BinReqAckx3.in_data);
		end else if(window_width == 5) begin
			BinReqAckx5.in_enable = 1;
			fst = $fscanf(fi, "%b", BinReqAckx5.in_data);
		end
		while(~(BinReqAckx3.out_ready | BinReqAckx5.out_ready))
			@(posedge clk);
		if(~now_start)
			$display("%m: at time %0t ps , %s-reqack working start !", $time, ftmp);
		now_start = 1;
		if(window_width == 3)
			$fwrite(fo, "%0d\n", BinReqAckx3.out_data);
		else if(window_width == 5)
			$fwrite(fo, "%0d\n", BinReqAckx5.out_data);
		BinReqAckx3.in_enable = 0;
		BinReqAckx5.in_enable = 0;
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