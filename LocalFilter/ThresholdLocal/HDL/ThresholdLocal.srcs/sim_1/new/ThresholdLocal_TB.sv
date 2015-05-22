//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ThresholdLocal

:Function
Local thresholding by Threshold from filters. 
It will give the first output after 1 cycle while the tow input both enable. 
ref_enable must enable after in_enable !

:Module
Test bench

:Version
1.0

:Modified
2015-05-22

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
	parameter[3 : 0] window_width = 1;
	parameter[3: 0] color_width = 8;
	parameter max_delay = 8;
	parameter max_delay_bits = 4;
	bit in_enable;
	bit[color_width * window_width * window_width - 1 : 0] in_data;
	bit ref_enable;
	bit[color_width - 1 : 0] ref_data;
	bit out_ready;
	bit out_data;
endinterface

module ThresholdLocal_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;
	bit[2 : 0] delay;
	bit[7 : 0] buffer[0 : 4];


	bit clk, rst_n;
	TBInterface #(1, 8, 8, 4) GrayPipeline(clk, rst_n);
	TBInterface #(1, 8, 8, 4) GrayReqAck(clk, rst_n);
	CLOCK CLOCK1 (clk);
	ThresholdLocal #(0, GrayPipeline.window_width, GrayPipeline.color_width, GrayPipeline.max_delay, GrayPipeline.max_delay_bits) 
		THLGrayPipeline(GrayPipeline.clk, GrayPipeline.rst_n, GrayPipeline.in_enable, GrayPipeline.in_data, 
			GrayPipeline.ref_enable, GrayPipeline.ref_data, GrayPipeline.out_ready, GrayPipeline.out_data);
	ThresholdLocal #(1, GrayReqAck.window_width, GrayReqAck.color_width, GrayReqAck.max_delay, GrayReqAck.max_delay_bits) 
		THLGrayReqAck(GrayReqAck.clk, GrayReqAck.rst_n, GrayReqAck.in_enable, GrayReqAck.in_data, 
			GrayReqAck.ref_enable, GrayReqAck.ref_data, GrayReqAck.out_ready, GrayReqAck.out_data);

	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		GrayPipeline.in_enable = 0;
		GrayReqAck.in_enable = 0;
		GrayPipeline.ref_enable = 0;
		GrayReqAck.ref_enable = 0;
		delay = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
		repeat(10) @(posedge clk);
	endtask : init_signal

	task work_pipeline();
		@(posedge clk);
		for (int i = 4; i >= 0; i--)
			buffer[i] = buffer[i - 1];
		GrayPipeline.in_enable = 1;
		fst = $fscanf(fi, "%b", GrayPipeline.in_data);
		fst = $fscanf(fi, "%b", buffer[0]);
		if(delay == 4) begin
			GrayPipeline.ref_enable = 1;
			GrayPipeline.ref_data = buffer[4];
		end else
			delay = delay + 1;
		if(GrayPipeline.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			$fwrite(fo, "%0d\n", GrayPipeline.out_data);
		end
	endtask : work_pipeline

	task work_reqack();
		@(posedge clk);
		GrayReqAck.in_enable = 1;
		fst = $fscanf(fi, "%b", GrayReqAck.in_data);
		repeat(4) @(posedge clk);
		fst = $fscanf(fi, "%b", GrayReqAck.ref_data);
		GrayReqAck.ref_enable = 1;
		while(~GrayReqAck.out_ready)
			@(posedge clk);
		if(~now_start)
			$display("%m: at time %0t ps , %s-reqack working start !", $time, ftmp);
		now_start = 1;
		$fwrite(fo, "%0d\n", GrayReqAck.out_data);
		GrayReqAck.in_enable = 0;
		GrayReqAck.ref_enable = 0;
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