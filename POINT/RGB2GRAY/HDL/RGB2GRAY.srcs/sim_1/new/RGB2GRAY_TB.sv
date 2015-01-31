`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/01/30 16:56:39
// Design Name: RGB2GRAY
// Module Name: RGB2GRAY_TB
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

module RGB2GRAY_TB();
	//Pipeline's level
	parameter pipe_lev = 0;

	bit clk;
	bit[23:0] rgb;
	bit[7:0] gray;

	integer fi,fo;
	int wfw;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	CLOCK CLOCK1 (clk);
	RGB2GRAY RGB2GRAY1(clk,rgb,gray);

	initial begin
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
				$fscanf(fi,"%b",rgb);
				if(wfw == pipe_lev+1) $fwrite(fo,"%d\n",gray);
				else wfw = wfw + 1;
			end
			wfw = 0;
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule