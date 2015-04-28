// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Tue Apr 28 22:18:57 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Rotate/HDL/Rotate.srcs/sources_1/ip/Multiplier18Sx17S/Multiplier18Sx17S_funcsim.v
// Design      : Multiplier18Sx17S
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier18Sx17S,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier18Sx17S,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=18,C_A_TYPE=0,C_B_WIDTH=17,C_B_TYPE=0,C_OUT_HIGH=34,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier18Sx17S
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [17:0]A;
  input [16:0]B;
  output [34:0]P;

  wire [17:0]A;
  wire [16:0]B;
  wire CLK;
  wire [34:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "0" *) 
   (* C_A_WIDTH = "18" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "17" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "34" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier18Sx17S_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "zynq" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "0" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "18" *) 
(* C_A_TYPE = "0" *) (* C_B_WIDTH = "17" *) (* C_B_TYPE = "0" *) 
(* C_OUT_HIGH = "34" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier18Sx17S_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [16:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [34:0]P;
  output [47:0]PCASC;

  wire [17:0]A;
  wire [16:0]B;
  wire CE;
  wire CLK;
  wire [34:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "0" *) 
   (* C_A_WIDTH = "18" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "17" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "34" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier18Sx17S_mult_gen_v12_0_viv__parameterized0 i_mult
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
js2YxtPPZJp2sj3QMwojvZjasXCovonKxzwbmX5WKRBappkWMuki15kOohTffcf17I0KsStyqYFQ
SoWa+ThWSgmkJCAr067/RCHYTdsgP0Q/GPa8JJXEncttn2qMaD0mVHuVYv4DEKA2vNch4q0+P15N
3+aU0C1LXdlHs/3vhwXKyq/thRUEHgEK34aU1yuZD5ofKQPZPY2V7muP8sjnF91v59z3GTNkuFOk
euHmIXxBcxgn+QMaCIbrVYnp2QOy6j7IfElRN6esI7ftox4C0e09kbWhU3fiDibL5IDbYfAoFOKp
6CU2IwDnu5VvQVgF+FN+YOZDqXOq4rPvtnXEcg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
p40mRxthPtLUgRjIvmT5PzuXAxv8XJMIn7SrOpOkmPbFhIGOQE4GFywAwmAMy9rh7lG5s2/Hek8Q
zmExMQWrSeWhs1YkcjeahaxXkV68scHgOsQQkkTBIDfL9FgwvVochJa5R8jBCggB9rumptU4CfUK
ANWbqJvMgYoTnYRbULyezx9Q5VIghzRLtiC4bKtwD/m39cVphPXFw+hEDmXHzlz8oa7WOjsk2aQE
KIe/xRf2kIXHllAi5R8YB9qDHvKiUJT/VEHq9SJ2FCxmCtqpFToRhyt5y3hxodi1EyeA5wCdjBZD
+aVb8N+vp+eqnpdIaIjan9EtowQB+Jq0qp2wdA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7200)
`pragma protect data_block
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
oAcPKrseb9s6xqvyk7DUKdph
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
