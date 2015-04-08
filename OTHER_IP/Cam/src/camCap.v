module camCap(
	input pclk,
	input vsync,
	input href,
	input[7:0] d,
	output[16:0] addr,
	output reg[15:0] dout,
	output reg we,
	output wclk
	);

	reg [15:0] d_latch;
	reg [16:0] address;
	reg [16:0] address_next;  
	reg [1:0] wr_hold;    
	reg [1:0] cnt;

	initial d_latch = 16'b0;
	initial address = 19'b0;
	initial address_next = 19'b0;
	initial wr_hold = 2'b0;   
	initial cnt = 2'b0; 

	assign addr = address;
	assign wclk = pclk;

	always@(posedge pclk)begin

		if( vsync ==1) begin

			 address <=17'b0;
			 address_next <= 17'b0;
			 wr_hold <=  2'b0;
			 cnt <=  2'b0;

		end else begin

			if(address<76800)
				address <= address_next;
			else
				address <= 76800;

			we <= wr_hold[1];
			wr_hold <= {wr_hold[0] , (href &&( ! wr_hold[0])) };
			d_latch <= {d_latch[7:0] , d};

			if (wr_hold[1] == 1) begin
				address_next <= address_next+1;
				dout[15:0]  <= d_latch[15:0];
			end

		end;
	end

endmodule