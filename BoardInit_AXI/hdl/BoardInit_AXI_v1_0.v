
`timescale 1 ns / 1 ps

	module BoardInit_AXI_v1_0 #
	(
		// Users to add parameters here
		parameter integer im_bits_width = 9,
		parameter integer color_width = 8,
		parameter integer window_width = 8,
		// User parameters ends
		// Do not modify the parameters beyond this line
		// Width of S_AXI data bus
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here
		input wire rst_n,
		input wire pll_locked,
		output wire rst_all_n,
		output wire th_mode,
		output wire[color_width - 1 : 0] th1,
		output wire[color_width - 1 : 0] th2,
		output wire[23 : 0] ct_scale,
		output wire signed[color_width : 0] lm_gain,
		output wire[3 : 0] rank,
		output wire ed_mode,
		output wire[window_width * window_width - 1 : 0] ed_template,
		output wire[window_width * window_width - 1 : 0] mt_template,
		output wire[im_bits_width - 1 : 0] crop_top,crop_bottom,crop_left,crop_right,
		output wire[1 : 0] mirror_mode,
		output wire signed[im_bits_width : 0] offset_x, offset_y,
		output wire [23 : 0] scale_x, scale_y,
		output wire signed[24 : 0] sh_u, sh_v,
		output wire[8 : 0] angle,
		output wire[31 : 0] sels,
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
		.th_mode(th_mode),
		.th1(th1),
		.th2(th2),
		.lm_gain(lm_gain),
		.ct_scale(ct_scale),
		.rank(rank),
		.ed_mode(ed_mode),
		.ed_template(ed_template),
		.mt_template(mt_template),
		.crop_top(crop_top),
		.crop_bottom(crop_bottom),
		.crop_left(crop_left),
		.crop_right(crop_right),
		.mirror_mode(mirror_mode),
		.offset_x(offset_x),
		.offset_y(offset_y),
		.scale_x(scale_x),
		.scale_y(scale_y),
		.sh_u(sh_u),
		.sh_v(sh_v),
		.angle(angle),
		.sels(sels),
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
