`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/01/31 21:04:14
// Design Name: GRAY2BIN
// Module Name: GRAY2BIN_TB
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

module GRAY2BIN_TB();
	//Pipeline's level
	parameter pipe_lev = 0;

	bit clk;
	bit[7:0] th;
	bit[7:0] gray;
	bit b;

	integer fi,fo;
	int wfw;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	CLOCK CLOCK1 (clk);
	GRAY2BIN GRAY2BIN1(th,gray,b);

	initial begin
		th = 128;
		wfw = 0;
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
			while (!$feof(fi)) begin 
				@(posedge clk);
				$fscanf(fi,"%b",gray);
				if(wfw == pipe_lev+1) $fwrite(fo,"%d\n",b);
				else wfw = wfw + 1;
			end
			wfw = 0;
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule