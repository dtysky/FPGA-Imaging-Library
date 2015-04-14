
`timescale 1 ns / 1 ps

	module BoardInit_AXI_v1_0 #
	(
		// Users to add parameters here
		parameter integer im_bits_width = 9,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here
		input wire rst_n,
		input wire pll_locked,
		output wire rst_all_n,
		output wire mode_erosion,
		output wire mode_dilation,
		output wire[8 : 0] dilation0,
		output wire[24 : 0] erosion0,
		output wire[24 : 0] erosion1,
		output wire[8 : 0] erosion2,
		output wire[8 : 0] erosion3,
		output wire[8 : 0] erosion4,
		output wire[8 : 0] erosion5,
		output wire[8 : 0] match0,
		output wire[7 : 0] harris_th,
		output wire[im_bits_width - 1 : 0] top, bottom, left, right,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	BoardInit_AXI_v1_0_S00_AXI # ( 
		.im_bits_width(im_bits_width),
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) BoardInit_AXI_v1_0_S00_AXI_inst (
		.rst_n(rst_n),
		.pll_locked(pll_locked),
		.rst_all_n(rst_all_n),
		.mode_erosion(mode_erosion),
		.mode_dilation(mode_dilation),
		.dilation0(dilation0),
		.erosion0(erosion0),
		.erosion1(erosion1),
		.erosion2(erosion2),
		.erosion3(erosion3),
		.erosion4(erosion4),
		.erosion5(erosion5),
		.match0(match0),
		.harris_th(harris_th),
		.top(top),
		.bottom(bottom),
		.left(left),
		.right(right),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
