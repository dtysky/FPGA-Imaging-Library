module IICctrl 
(
	input				iCLK,
	input				iRST_N,
	output				I2C_SCLK,	
	inout				I2C_SDAT	
);

parameter	LUT_SIZE	=	170;
reg	[7:0]	LUT_INDEX;
wire [7:0]	I2C_RDATA;
reg			Config_Done;
parameter	CLK_Freq	=	25_000000;	
parameter	I2C_Freq	=	10_000;		
reg	[15:0]	mI2C_CLK_DIV;				
reg			mI2C_CTRL_CLK;				
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
		begin
		mI2C_CLK_DIV	<=	0;
		mI2C_CTRL_CLK	<=	0;
		end
	else
		begin
		 if( mI2C_CLK_DIV	< (CLK_Freq/I2C_Freq)/2)
			 mI2C_CLK_DIV	<=	mI2C_CLK_DIV + 1'd1;
		 else
			 begin
			 mI2C_CLK_DIV	<=	0;
			mI2C_CTRL_CLK	<=	~mI2C_CTRL_CLK;
			end
		end
end

reg	i2c_en_r0, i2c_en_r1;
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
		begin
		i2c_en_r0 <= 0;
		i2c_en_r1 <= 0;
		end
	else
		begin
		i2c_en_r0 <= mI2C_CTRL_CLK;
		i2c_en_r1 <= i2c_en_r0;
		end
end
wire	i2c_negclk = (i2c_en_r1 & ~i2c_en_r0) ? 1'b1 : 1'b0;		



wire		mI2C_END;		
wire		mI2C_ACK;		
reg	[1:0]	mSetup_ST;		
reg			mI2C_GO;		
reg			mI2C_WR;		
always@(posedge iCLK or negedge iRST_N)		
begin
	if(!iRST_N)
		begin
		Config_Done <= 0;
		LUT_INDEX	<=	0;
		mSetup_ST	<=	0;
		mI2C_GO		<=	0;
		mI2C_WR     <=	0;	
		end
	else if(i2c_negclk)
		begin
		if(LUT_INDEX < LUT_SIZE)
			begin
			Config_Done <= 0;
			case(mSetup_ST)
			0:	begin						
				if(~mI2C_END)				
					mSetup_ST	<=	1;		
				else						
					mSetup_ST	<=	0;				
				mI2C_GO		<=	1;		
				if(LUT_INDEX < 8'd2)	
					mI2C_WR <= 0;			
				else
					mI2C_WR <= 1;			
				end
			1:	
				begin					
				if(mI2C_END)
					begin
					mI2C_WR     <=	0;
					mI2C_GO		<=	0;
					if(~mI2C_ACK)			
						mSetup_ST	<=	2;	
					else
						mSetup_ST	<=	0;						
					end
				end
			2:	begin						
				LUT_INDEX	<=	LUT_INDEX + 8'd1;
				mSetup_ST	<=	0;
				mI2C_GO		<=	0;
				mI2C_WR     <=	0;
				end
			endcase
			end
		else
			begin
			Config_Done <= 1'b1;
			LUT_INDEX 	<= LUT_INDEX;
			mSetup_ST	<=	0;
			mI2C_GO		<=	0;
			mI2C_WR     <=	0;
			end
	end
end

wire	[15:0]	LUT_DATA;		
I2C_OV7670_RGB565_Config	u_I2C_OV7725_RGB565_Config
(
	.LUT_INDEX		(LUT_INDEX),
	.LUT_DATA		(LUT_DATA)
);

I2C_Controller 	u_I2C_Controller	
(	
	.iCLK			(iCLK),
	.iRST_N			(iRST_N),
							
	.I2C_CLK		(mI2C_CTRL_CLK),	
	.I2C_EN			(i2c_negclk),		
	.I2C_WDATA		({8'h42, LUT_DATA}),
	.I2C_SCLK		(I2C_SCLK),			
	.I2C_SDAT		(I2C_SDAT),			
	
	.GO				(mI2C_GO),			
	.WR				(mI2C_WR),      	
	.ACK			(mI2C_ACK),			
	.END			(mI2C_END),			
	.I2C_RDATA		(I2C_RDATA)			
);		
endmodule

