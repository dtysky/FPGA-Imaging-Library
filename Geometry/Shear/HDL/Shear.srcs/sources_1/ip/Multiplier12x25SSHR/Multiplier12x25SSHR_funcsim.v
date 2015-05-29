// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Fri May 29 00:09:08 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/Master/Geometry/Shear/HDL/Shear.srcs/sources_1/ip/Multiplier12x25SSHR/Multiplier12x25SSHR_funcsim.v
// Design      : Multiplier12x25SSHR
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier12x25SSHR,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier12x25SSHR,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=25,C_B_TYPE=0,C_OUT_HIGH=36,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier12x25SSHR
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  input [24:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [36:0]P;

  wire [11:0]A;
  wire [24:0]B;
  wire CLK;
  wire [36:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "25" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "36" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x25SSHR_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "zynq" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "12" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "25" *) (* C_B_TYPE = "0" *) 
(* C_OUT_HIGH = "36" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier12x25SSHR_mult_gen_v12_0__parameterized0
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
  input [24:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [36:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [24:0]B;
  wire CE;
  wire CLK;
  wire [36:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "25" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "36" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x25SSHR_mult_gen_v12_0_viv__parameterized0 i_mult
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
SWpU5KPzocstBBHkZWvyU0LzFeCIkG02bjfpFkftsc7g09utEMtE/Q2wiszwqeYpmNLcU10aY1n0
/TlkzIdnr5UoDGyHCbS4UMhQOx/RgjKjqNlEq97plDNkmoIAK3MrLQnM2gUzHrxC4wR286Lss1Ta
yFyZIOu2dEgjqKle/KYOYouaIHei2woHSP7nUcOdBp7DLshE2Ff1j8kfuG6BxsQBSd3l8NgPgBFw
Jj/8TXFzWG2L/RWuXAJakGR2Q9UgSRR7Do4jtmUEaNR5TPvqNEAvDr+jWPmLqbSCWe2xlvqi9/6l
i+FpSyea6xTVlajwB0bBAWuBGlX3Owpqx7LgOQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
VyuSLVp6n4FhPBeDzwhtzU5MST8BN31O5UHRBwCRfqv1GCmGpupOw69TeI8PDSt1Rq3ju5ujpc1Z
nNUVBZA5GgsL5p9/Y8tfsyeU0SoEJe3sSX6p+kOceHXCyu1pCHNhBm5OlOg8xoGwtqRtAqCguYrx
dmggpPuUCY7UF9CSTssJZAO5gnkC3MAGm6I8cIJfq+XYoXudittzCcPfBf2dgrmQt7ePly9gh+7r
Q8LyR7CsYQCbvUkqApAVTFQCxXIntZpLxvMCcKgXQa1/0K19Tg4k5/cU2hXkx7sS1+/GdChlF0dc
GCRHQPjMVKY2LhDHBKaWtARkoZnsgAEBMkwMiA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
CbB8M1iwu0mLsyTAANL0cz1++zgGdKPqWA==
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
