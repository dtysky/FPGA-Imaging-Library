// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Fri May 15 19:49:14 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               B:/Complex_Mind/FPGA-Imaging-Library/Point/Graying/HDL/Graying.srcs/sources_1/ip/MultiplierRedx0d299/MultiplierRedx0d299_funcsim.v
// Design      : MultiplierRedx0d299
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "MultiplierRedx0d299,mult_gen_v12_0,{}" *) 
(* core_generation_info = "MultiplierRedx0d299,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=artix7,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=23,C_B_TYPE=1,C_OUT_HIGH=34,C_OUT_LOW=24,C_MULT_TYPE=2,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=2,C_B_VALUE=10011001000101101000011,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module MultiplierRedx0d299
   (CLK,
    A,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [10:0]P;

  wire [11:0]A;
  wire CLK;
  wire [10:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10011001000101101000011" *) 
   (* C_B_WIDTH = "23" *) 
   (* C_CCM_IMP = "2" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "2" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "34" *) 
   (* C_OUT_LOW = "24" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierRedx0d299_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "23" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "34" *) (* C_OUT_LOW = "24" *) (* C_MULT_TYPE = "2" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "2" *) (* C_B_VALUE = "10011001000101101000011" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module MultiplierRedx0d299_mult_gen_v12_0__parameterized0
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
  input [22:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [10:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [22:0]B;
  wire CE;
  wire CLK;
  wire [10:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10011001000101101000011" *) 
   (* C_B_WIDTH = "23" *) 
   (* C_CCM_IMP = "2" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "2" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "34" *) 
   (* C_OUT_LOW = "24" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierRedx0d299_mult_gen_v12_0_viv__parameterized0 i_mult
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
VjbVxlA20A/TfrAQK/2IG9xHtcf/ehGZhj4nRIOFqvHbReyGBno313WzL3rOMZYm1U6wTEYjyhdZ
yTT8Xv6NdAY8lCUN+iB9jGKhJKpJF6PgC08g6QjzF2WZLvFBcBd1Kt2XcSJiN+UT6/tRp79WQtwm
N0NXDtU+6bA647zJSnJufHOMDR+mxKxzPNdve2WSBJQMbozJVxUcvkf6TBv2S/L1ms5zQ8ofo90w
dmhjTS0QpE3Uzoo10ZwvIkBWoANGnCbtU9+XG5u8hPE5y84sPYinqm//LrCuqyIk0caW5ksoZcaN
La/gASXxpuzv+1ao0Ar6S901oaglX6QudZK6rg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
JrYTTv3x8FBRkQYIhY0xgStssoQoyR04o1kGIsBR67l1QLEstnVQY+RuZj+roVth/zTYjC4G6phM
clpJGYSSXU7BKdZ6EMQALtFTXgpUTE4h4bp95M1/hhhZYotPNDHkXe5EtB9uXAWHrBFGugCT29kw
d+bYu0nAovF/u/pbjZN1Ko3i5F4mq+X3OTrM6SuMmQ8IikCQMKLa2nczczfLBsh9DEth9bRVn+Sz
79HZuP1xBMnNUQFOKH89D8AyMlczgKvEA2d/H7Bff0whUcwLlkAaIfCb9J+FmN+rDjczi9KZ+XDw
Vq4PuYwMbTPM2mDOHo5ioVHxQTjBqXlIXThrjw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9808)
`pragma protect data_block
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
LxUbKw==
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
