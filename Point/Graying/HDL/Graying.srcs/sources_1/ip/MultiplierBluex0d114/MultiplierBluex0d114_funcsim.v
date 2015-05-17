// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Fri May 15 19:44:15 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               B:/Complex_Mind/FPGA-Imaging-Library/Point/Graying/HDL/Graying.srcs/sources_1/ip/MultiplierBluex0d114/MultiplierBluex0d114_funcsim.v
// Design      : MultiplierBluex0d114
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "MultiplierBluex0d114,mult_gen_v12_0,{}" *) 
(* core_generation_info = "MultiplierBluex0d114,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=artix7,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=21,C_B_TYPE=1,C_OUT_HIGH=32,C_OUT_LOW=24,C_MULT_TYPE=2,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=2,C_B_VALUE=111010010111100011010,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module MultiplierBluex0d114
   (CLK,
    A,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [8:0]P;

  wire [11:0]A;
  wire CLK;
  wire [8:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "111010010111100011010" *) 
   (* C_B_WIDTH = "21" *) 
   (* C_CCM_IMP = "2" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "2" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "32" *) 
   (* C_OUT_LOW = "24" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierBluex0d114_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "artix7" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "12" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "21" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "32" *) (* C_OUT_LOW = "24" *) (* C_MULT_TYPE = "2" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "2" *) (* C_B_VALUE = "111010010111100011010" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module MultiplierBluex0d114_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [11:0]A;
  input [20:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [8:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [20:0]B;
  wire CE;
  wire CLK;
  wire [8:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "111010010111100011010" *) 
   (* C_B_WIDTH = "21" *) 
   (* C_CCM_IMP = "2" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "2" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "32" *) 
   (* C_OUT_LOW = "24" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierBluex0d114_mult_gen_v12_0_viv__parameterized0 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
UyXQwkUObVrGCrQeWBRDzNzHSmxz0+tXmCDiikEzuwG7p+MOvi5now6c6XhFQHhRDLZqrTCJWGVY
uVMi7GoGag==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
i5kFZPoOW4AbrHICVt04gLioHJ/lXQCVR+36ZomPa7Uhk2VGKJwiH+6I59ia5ib443IW5VCbmy/r
gnO5lAmOjOXrf+28RyOfxhyCRgHKh6mRiH0tlgZUxbFCb24jFd8F2ON6eZARrIbx4Vu5v/7L6X5o
oTd41gw6CHpypaHAd88=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
d4UDVzST4F/GIUQK7Q/mgyckJ8hrUJmJYmR7IrVlH2X6hv2uAAk4gpmfB6E2dVAnuOOE4STY1OeO
4QqPqvp/zC7S/aYld/u+eRjgH778AqwHmdMBU3BX1e3j2lWzDCoDQianx13lD0Ihcvv2hpUg3My9
R2dUGaAs/YrnckB0Xsyif1gPs12BFskCvSBa0HZidrW6UXqeUc5Y+Y18oAX2L10OimzYS3Jo+han
FbcTbpApf4PkFyRzckA+yzqct0XOkXLsuWu6dE34gxuaUw9BCMtj5rnbQ0G0Xote0ldMp+AIN/vj
bJafuR2HkqxTvqwCTed3PqEy4xVdmr/ecywIlw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZzJe3CosxBQtdtXIXPjUB1PIjPHRzRe+TcPVuazVXoOV6QQ4DY8D8TRP6/DZEeIUzxe5gMRXz2yf
RclEq20zSfPMaB3h6L9uECxIUPiPZJ03aglicg+QjHFDLo1XgOo1ItxSaGSam80SUko6TFrRjWV7
DlVH8SFB0gTLxJpXLeU=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
k0pB4lrRLLpdtNnVRXv7qxU15dyKF9BuJVYUlIA955FRzEtgaMMCmzDybCNTUJh5QGLsvLYdRVSK
VcBOlgtImwe2FJEsDE/buKE8+W7HPOSiP0Elo4jDRWfwpueOq6VQ4zL5XMAGi+70gMxxGQr7Z5E8
4lvDxjOzkqAIn3EC1esPBOdcmzCt1V55YsxrHdN/eAnUWBvEPaGJfoZKGT4IZ1fx0hJCdrrnel+V
0HuJqYSPOCB8SJpuoB2p3Y1d93yF5xcy8wSWeVWgM3E2z++VHQIjT4DTFlyqNFbe2YxMhMTY8SGk
pV+7oyzvQjUyYpAt0GiJuzwTVRTBCgpo3qFmbw==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
PXKQWuIdRL1eGSV7I/Qp+snxtQuQi4WRb58ThbXR5Ce971lJOrl5Ru6DWGuF+0DV3LY7nL7Rm/kO
hCvKVmXyftNDYJmCGj/I3UIo1gEuLC1lrp8I5B07pmtHLAc4BSLxSdxab74y2FA6p2FD6bP1ylEK
MWyJtpQyCchXGAgsw/Leo8AJKk+7a7rcJwtI/dds24ijzObrA+cMUV8sv8T3gIGu8nhqZhKwjIgn
/rMlGPKqHe1HoVem49jg2SZBxLdVlK/7MQhCEWVxazN3+CEltDQp7PkRJXuLKTocdmZT0eAoC5uh
Hh9TdZB2jjEyEaDz/3m104OJgmHsd/oOFMshxA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
FL8hQzYjSzo/BFJIIZu+YXSxrD1CVZqRGJdzQnkP2H47dGqZHVD4VWsjzN8B87mBXMXO4x6HKvin
BkqpmdzaiZOy6obpRmmUipVtfW/A/qp2znpveLOzDH2clhg4astK7pQLtRAOdF5MRO5EITZzUJJ4
ROnp6MkRGAEtiVmLhbV6JBf+t+rpi157LEdosxTfTlWu+xOF0piAruPcOzkMrQbuSLiZer5WciXJ
WRS8vGX3eyWZHOMwRmci70Hq3CST0yVI61HgUsRqQoMxq/T0qnbqOO3xzdMmpPxEOscJIvb+9OLS
RJxmwFZz0K6jtDoRqKWbrK9Rthbg1ocjbt/rJA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9728)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
