/*
Image processing project : ContrastTransform.

Function: Change contrast of an image.

Testbench.

Version: 1.0

Modified: 2015-05-05

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

module LM_CT_TRANS_TB();
	//Pipeline's level
	parameter pipe_lev = 3;

	bit[8:0] lm[0:2];
	bit[15:0] ct[0:2];
	bit[7:0] mul_a[0:2];
	bit[15:0] mul_b[0:2];
	bit[23:0] mul_r[0:2];

	bit clk,rst_n;
	bit[23:0] rgb_i,rgb_o;


	integer fi,fo;
	int wfw;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	CLOCK CLOCK1 (clk);
	LM_CT_TRANS LM_CT_TRANS1(lm[0],ct[0],rgb_i[23:16],rgb_o[23:16],mul_a[0],mul_b[0],mul_r[0]);
	LM_CT_TRANS LM_CT_TRANS2(lm[1],ct[1],rgb_i[15:8],rgb_o[15:8],mul_a[1],mul_b[1],mul_r[1]);
	LM_CT_TRANS LM_CT_TRANS3(lm[2],ct[2],rgb_i[7:0],rgb_o[7:0],mul_a[2],mul_b[2],mul_r[2]);
	MULT #(pipe_lev) MULT1(clk,rst_n,mul_a[0],mul_b[0],mul_r[0]);
	MULT #(pipe_lev) MULT2(clk,rst_n,mul_a[1],mul_b[1],mul_r[1]);
	MULT #(pipe_lev) MULT3(clk,rst_n,mul_a[2],mul_b[2],mul_r[2]);


	initial begin
		wfw = 0;
		for (int i = 0; i < 3; i++) begin
			lm[i] = 0'd32;
			//8bits.8bits
			ct[i] = {8'h0,8'h80};
		end
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,".res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			rst_n = 1;
			while (!$feof(fi)) begin 
				@(posedge clk);
				$fscanf(fi,"%b",rgb_i);
				if(wfw == pipe_lev+1) $fwrite(fo,"%d,%d,%d\n",rgb_o[23:16],rgb_o[15:8],rgb_o[7:0]);
				else wfw = wfw + 1;
			end
			rst_n = 0;
			wfw = 0;
			$fclose(fi);
			$fclose(fo);
			@(posedge clk);
		end
		$finish;
	end

endmodule