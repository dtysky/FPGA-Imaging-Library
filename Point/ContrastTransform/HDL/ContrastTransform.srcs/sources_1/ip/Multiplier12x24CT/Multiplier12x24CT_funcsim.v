// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Sat May 16 15:33:04 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/Point/ContrastTransform/HDL/ContrastTransform.srcs/sources_1/ip/Multiplier12x24CT/Multiplier12x24CT_funcsim.v
// Design      : Multiplier12x24CT
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier12x24CT,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier12x24CT,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=artix7,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=24,C_B_TYPE=1,C_OUT_HIGH=35,C_OUT_LOW=12,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier12x24CT
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  input [23:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [23:0]P;

  wire [11:0]A;
  wire [23:0]B;
  wire CLK;
  wire [23:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "24" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "35" *) 
   (* C_OUT_LOW = "12" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x24CT_mult_gen_v12_0__parameterized0 U0
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
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "artix7" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "12" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "24" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "35" *) (* C_OUT_LOW = "12" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier12x24CT_mult_gen_v12_0__parameterized0
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
  input [23:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [23:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [23:0]B;
  wire CE;
  wire CLK;
  wire [23:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "24" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "35" *) 
   (* C_OUT_LOW = "12" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x24CT_mult_gen_v12_0_viv__parameterized0 i_mult
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
nLGiE+c+R91LxBGealjv5jjZzHiEokf6wEH4MZQaP1xWRArkwnu1iC5khMA2P3RjyAq0KmZvbI/G
rlUDXjTessiOIEasZ1eXxSLoz9LXzXPfshl0iv1jg+OzOr5hBCsYwqCnzSjzyAIK2r6HRYm34lHb
2uecSvca7A7JoCL5tCER9D9R9lEK2V4WBnUckU+QLZrI9nYbVDrxfO4zjNWedrBrQtK43oEU5f6V
D6xvLUl6h4voAQ5jES6nxU7vqPUr/vHbvpc3RfBbaDT3InlzilCEjdzPEkvDyzB/qeflooaNr2wx
ToScvhJvm2qw1UEIx9hPW4/KyFvsikuJdmAMrg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
MuPmhoW9v3XquFiJ5CGwy8g2O3r/qAFpCDouppkp5qa/COCANFUynPhxPnCsUihpdz5/jUm/QtVS
wmq8RRTLCO9NZljh3//YMQPBOE4dCRQ10+VDDClayG6J+kLHPTdAX/C5l37/MwN1APnjYzBgyhGl
mTagCS7KOpPMXUprB55BYtnlW2RGla/tJ2KPwC24FWlpKOvRQin0OJZ7iUr196onvKkf2ZU9dRcO
qU9w0y0WkZKNqarjhxQWjDg6ONyK1GaYBTMHaS991yNBLpUczzkVWADUEhxnve9wZtVZsU7kg6C/
oeA+K3yUXcatgodWlrYW2cXJUFsQn32F76J18Q==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8336)
`pragma protect data_block
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
vc+9LhvUp7z5PsPiBNc=
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
