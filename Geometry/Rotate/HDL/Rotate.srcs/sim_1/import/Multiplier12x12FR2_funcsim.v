// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Mon May 25 17:58:01 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/Master/Generator/FrameController2/HDL/FrameController2.srcs/sources_1/ip/Multiplier12x12FR2/Multiplier12x12FR2_funcsim.v
// Design      : Multiplier12x12FR2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier12x12FR2,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier12x12FR2,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=12,C_B_TYPE=1,C_OUT_HIGH=23,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier12x12FR2
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  input [11:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [23:0]P;

  wire [11:0]A;
  wire [11:0]B;
  wire CLK;
  wire [23:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "12" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "23" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x12FR2_mult_gen_v12_0__parameterized0 U0
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
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "12" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "23" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier12x12FR2_mult_gen_v12_0__parameterized0
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
  input [11:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [23:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [11:0]B;
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
   (* C_B_WIDTH = "12" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "23" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x12FR2_mult_gen_v12_0_viv__parameterized0 i_mult
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
CvrdHJXWnQfXzzSiWw0jNoEt7+BoZ/LZtdbDFXaSiWMDQ2Vk6puIc6EOqYAUQkDOk2e0tjeVPbuy
vAlTHS8dK4prxxPlDlJ03yIgf3CKU8rhYcpyMVfxGvMTj8gfrAYLyGHp3Q0ogisj4GWljV8Qsb5q
PtKFHp51d1YgIXn0enREDc1y4fV/5qvFy8Ra93LMEYZ+HTx31S/xqyhXu4BJbdKgXfiXNCbR8wvk
l6xmKSWpUHjNUdexHW39ZvxaRGBBvhiYHfA4HCTbTZ2RQuWA++gwpwv2Z8B2POnFLgoB1EEvDcqz
DAazbkQr6F8mRVFAdDPN33HbTi2PEVrcASQmYw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OdvspRxAZYkQaAxKKdA1LsFAsM56hWSeApR5vUpKpxX6pSTf+1FKT4VsjLCFBqzGqve0MQBjmS3V
qyRHXgiuBp9jz5c7CcarmZSThSGxGNBblhKNJeYgXCu0ip6BtkoDBwXW++32tF/sf/FnJ1XuyAA3
5ujc/PB5pP47bKvbuB0uIggsnePT09vMzbbN1V95dCdhkmw94jwErjRMItcN7rqWairIKyCnAAlG
CtlXR2xU48ZL8EVAo4ECF4YJd1tuwvcJ7HU2kwkbJP9cbf3BBRZozLP+bjKKGxn1LmZMPcQVVp64
wuxy68DKLNCFR0gHKmnUESZyscn0Y+ZfyohQEQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7328)
`pragma protect data_block
VkGLvYoQ7nNwZ5ihhIO8WVUnCfeOd+Ac0yOFd71E533xQvvXqi7dcMP2EVC3ypJuXpWEKSHoM0UX
Tei4M1Y8zKyy1CSiRryBE3yxFjdmagYm8ZZa+7LMyxikM2pJL8JJoMtq56SypnPwkaNrzoB3KG1o
sE14PVuHjii1rcbRvaKniZYMljRMLHMloOG7n6S0DAL4HAPlTa12rueMvxc1TKR6tpzykgQcGiS2
yheQzpxsET8Fhv7R7xgHw7luxkDpjcu0gEyJ9FXEXYG9aa9tuyLjlNeralV6fCKeDxDbXjLtvADt
JnFOXi/5fZRYxKDIoIcy52Ln7Z0Le+6tlFUoEFaR52go807Sv0CHgJJSqcFioCWsy9NsUALZBe4U
7tPtaskzganS4DK4AWPFXBFlZELnaZJ/AGDLgEDqIcNxwneJVSNxSvxd3xUTu6f+99jTZCdLle7C
RqJFb2nDWg8QH8nwNLiFNxTshl18am0rqF+pnG+sdHjRxWXyVZ7T13zzmURGNkGZT8hVAZ70qzVR
BxUJVOuhxRqWyCPc//o4+F7bfjae+xKGkfeC5DyywFCJ0QLKVVYyIR0teAfgXCrTRvKPoQUMqEqc
S6YAdkjCYKHkK9aPF2EwCjlHIPrqp9h/QZMwlOJdYx0l0ciqvugTeLCbyTmLZYx+jvhhdWst1Yw6
PEdjlZwtmXyEoZFJJ2h8Uu5dsXNsZ453+ZDSwds8BIyUaeIhN+Rs/YMwn+wX5gQQVSrcSggISmS7
a3jyKAm5OTr0lJgh6YJjf+I7XmomhTqlWH/o8gbUXqUWGBvoTGbU+q4OCRGvB1JZy5P27k8xtUcY
gfDO3+pzOuw9UXbYiBuwTyGc7kwztHsgTktyFwmPlfGl3pRTx7lDaXrJq4CUFKDtbm2jborfgAzL
nhjGuUmGJueEO3zg9dz/hVX242z0Mnm3u54WAd8YuExZu8kROdCPhd/+HBtWnzmzf+bm4o+65y1s
F2jod5Okbez+Ru+Zr+k5BlPpQo4DO0w693S0tBpziY/6vem83azYr50AwlVpV58r9yhEZXD1KMGX
/FzTpEVYn8I1YPAM/3v6LxQzWBbN077rPSEgbhkEFLGzdt3nruyrdQz2RE4txXx5oQse2E0stMf6
sbqJ8MRQJRe5aO/PdJnTWL0jZKMyFy9q59m/c7Kxb6Qpc7Mf6K3WpjksWsg8sKdF1fTby9KHD32y
4i8qLHAxrt0A/OJskGex5mPvt1oEhmNiSVv+RBqwvwSIH0Sn8sbBC2OYV1v1UyapazwqhVCSi9v+
c1EBC1jCfK94TICiI0FIktJT0xSfXxc6jQk2H66i0XlLVBTxGvIDJDdLv/Wq1vrSVVq4E5fWfA0Z
dW6PyRsFo3U1OrcUrxnTLmX5vyvlPegI+dCl5Z8AyOfr1ST/kLA3IHEf3oo4pJ+MRKA4A4KA9BoN
ImaNj53hjctmA5QhNbRy88zSiFRo20PFee7O/Opw/LbNuGktV1XgQK5W0mpvzXpd0kBexj5KkplK
Dk9xmPGAT7SNXdV1wzJltd4+OQq82tUaJGf8/C5hHqVvW82GfmtCVvofIoS3xRYqA8eEfEX2b/yM
qEnDsUalhvJCGw9fx8yLufcYukGYwel0wF/PAlitUJFux867eQfm2PBjqHNYbjiXiZI7Pa2VrBwQ
+Vbjyx769s/71JwNgrH1BHnQ8/oM48QdCNKfd1FsNGG1wgCnNHeCTRd0d387sg8UZxUizKppEvGD
HsBb1Py7eAUoO1Ay3d16ca5SoUCQsmTEp/4M7WxNxL8Mr4mnyCGrqvC/8L170G4ABns++0ZB7NYB
ELhFetYW/RAUOAO1J6JUZutRrzTUL+Bs5ETmX3rVk3rZaXh4oQPWGjvcEdy1TXDBD68wJm7ykh6+
2vsHWQAOl2Azhe8HNkL2Bc+xxebQJSeDRqrvrj0qq8A6/KFzYU7+m75STTc4erKfRr3d40K2mPTW
tV0hY8gUYBQG7AqGZvY26F+OKZww/9B4Zk22H53sl1i+psvfqi5/W30CqGexlDJ0v9+bO8CJ6jSD
EBWhw9frALlxnS/bndveAMQ/6dEWfm3NCEX7d/qzD2wbiU7e01abNvrjihoHUtFO2Uf8UKYtFxci
SjdK/6NfuFe+Lms9cTVShiqkXTkm9GP49GKU7ovPeL0Yr0lNryfseGFMAAENBD6pyGdHW6ousN3b
GWBDNwkrLO4BT84gNlAz/SKiBjflXLJViHiI2yR1vVtN8gMrOKKoC5l50IkhkJh05xKT50p/r3Ym
cd6shR4i1D25UBR1g5BaKe479sFYVGg7UWidIxvyiXCkNq9Y9x15BTPBWmTwaD23HzxGV2iHU5Up
6pPsvpPJuoIil/D5ti0bLqxBdxnfbQtFdwEs70+Y5V1QgYN6rvnmnShjRzepUwv0SYSDnh92qMQs
dYjQuXyu+hmfSax+MChbgHT9Ez4FXbEY8b3ggZuCTIQYx+WN/gpLKEQF7mRZYLsCpHPe+cT8LQ7u
EmAAz+OFWLlCvHKw6M5CfSBO0dGBhXuCbC4GE7xAIVxGLJNXGGIv8iO9D8GIl7r3ol0NP7lXeTJJ
R615gvHcaHmZIBTiv5wjuJ7luZleNKcFmjwIdSZPBxJtcZAJkTcTHGeaSUxi5jP7KeweeA3dcltj
tkup9ZFT4AEEO29T6e23kM2XCYVRMf7i+YccVBEYzVNBS2AqMeZbQXFRXW3h5CdMajfmOwTzXRcJ
OrmgdeuZSQoYA42JwsC9ct5ikF3LcaeV1d5uC8DFul5BWRneJC+5mwVuThdeKCst0n+bJC3pxVXe
UluOjiOSBLeqRQeQgArlF3YdZ8h+EJ3cIRE3O5Yz7jS9MDd3JTC3eruP0va6HxhvAISZuRetCAl4
ZZipzCwRfs1+pCO2q40vh8T/ftEnUAxgEPAAIXHFiYx5rY9AD96OHUo1mquKqHhP9Fo8uv0yoFeh
OhiaGCsqCt/DeNVUcSJlAnMeBca35OjuO0Mqbqd5z+qV9dv4Nfc/0h6CnqgAr2Fh06eYMPPFpxgL
+U7uu0xc5/0RwvBG9WhHNjFJXeXL/16Z2BEQEKOBVRBRuRQXu9YbodKbXrxIaqjBOkyRm3p52K2Y
gvkXZdHfFBUwzvTNEcacBYlN8uKj8EDVzzqn7QTltF1/kBW/OTYiSD0KbjdyhX07YdvouC1gt8qc
TYljvov15nyCeKHhSl6kvAHJNTFe5RuD4KNjRy0yqmawywAWRO5Q2R6WFJOyuJTYCZ9pd4KlEAY1
/x9Tk3QZFmfj7y2RF1iYO9sqZBTsv3qAnxGvLCeKuyQvZPj6u5G6nlAqyMEb9YgCsMLODYkoBXkG
TD/AQ5MLRgeXgI/lRfHYrYlElFaOi7hdW/c+dDD8kXC2M1+jj99fTBvMcASgMt8SRe3UZ2toKyNX
9X28gVEnweDgEzfh4/bWfTmHxrPouDEg8KLR6gBsnm08EJwEyOj6BP2ecL7yWxwsnoQsYK79z01d
sQWGmxVtPAZRF1EfHGF/i9f2eo2a7vKftE6iILVGRYG4lpfcAEXYO0nUD3+j93v3Q6VoIQMLaSfH
kP4LuZwEeuBraI2CQQF0yYgVtAXaQpNeqD2j/Y5B6UofstVXkgFvyQeBPeyeIXJy/LYFJQq/oyM+
327FolvVjvCe3Ijnr2M8HDltUAGvUNse8hf9Jsyj6HKXdJcGdB0Yi3xrp7yJnkdGv9v2YkELJcyR
gz/bq2yK1P/879rLZg+yvx42tw1i2bkBvBB8usHzrvfzJCLNG6V+OR+7q41ViJR4dOD5HoQ6B2Wc
W/1p6yt9dgGmAPNpDcA/TSB6OXmRL37C3KavJkvr72nmSW0BxSHLUdrVIZsyYdLoP1fVWodF48ng
WKOQONsFWSAmnUbncgJouQyZBRnSFs0okZcugmkT5gDjbnw3Sa3WuM94W6325afZu3bheGUMau9Y
Je68wXqdAi8BfmEM3gYzSWXegQTvNUnhkacgFisciz5vMan8556Xhi2xvOioxlB4/vNjhgz2joII
tgc2F6sd/UNQTBbAH4YqruemwRJN/Pi0cmRqEnI8kRem5sUtMZBZNr1Wiy7GVf9grN7n3gQcM73T
xifzSDunV9p6LGy1an0bL2ua641QvUY0bSw3iFCfaFdjFk2nmhKLvL1+fL+EFCcMArTt06ftwKxk
Ms1cM/VR337KkQF+qAm68HeEW16EYfaS/Av21gzQgQjiVKk8wxxrqHYwaSBHzVaTDW4AWH489X2V
Rk709iEOOt/SXkOQmTVRU6L+9ulz4/89SVhfwTJtdZFZKWgm6ykzkUL6msokglB+pbp/3TnDbk12
DWAZgjudcCS0Y9GkLtYcv4scgYEtRUMKbJjeIY6/uGcWlbOMEfvnIYOlQrU7796nWcH12iy1uyVC
EPp0G74KOhH6XWkWWcfIRZEnm5cv8toQjno3IwAtYQ7KLRdXVKQa0JVaztfisq7kl6N3EWxdpSwD
oGvK6YXFoPVx2wlCI1ITNNkG/YddHiUVGxzxMc1RbGtrPM3H/F2rXSnonfP7KNGgY0/a33hA1G9q
O/DeYh47r6/Qm/RbarfPvhtCRraa4gjGx90Lcxp7z3tKi94zqGebc0F0MTJYtyKbpIB5MpW3FREY
EUa6efPtX3L2KeHifvUs7ZbtLCpDZPtYXOcJ2EFWo+ypsKXGRNp66MzF5u6JRPYx9DQGIuIrsBrK
fRPVO7KYRcaGCwiwRsLd4RpTW99ePyqhjNO74eYMQQYC9KoQSulKYa/ktSGnWtiH8mLzlTrG6tR4
us7LFQvKC3nriXSbMRjMWdtD5+jXweaY5/DACuqfqkZbA99UwNGHkoflgTrd8q/COjHv4VRDi9oQ
dXoIfCI6wmSQ5PP5iBcTryI1aYk/2diGFrUilS5UGWIfPVH3CA/zAz4cvNk8ejuA3sWJqQzWswYB
ZkMBiFd5Pst6TqKHQdMWl1l5s8UK1fQ43PHRRIWWutepzCwTtZ9rvArq3PazFpn3D/3ZqLUWJVl3
nksM3Tnvj2ifsWgL/A4eVTWxlRcMNFuIEywVyi5eU6BCpI0gGBx1HytscIekH5ihqmEGDY+hi15h
rR4dbghezwEpN8LQYSCZGFhGBub3ewS06GUOu7Y2/JyntKt+DoOIRsoTtIIs7Xy7sY2rnt8YGd7s
ZEowCNs+ENj72meuQG93MdKlCRHQ3kUSVwOo9EdqABW/2Ky6nfMxGCWpelmKy6o2KHx2Zdq8IwQ3
/4V08+wnoc/YYTPS+Hqlc1uySoeusPUj+0xwiTEdV0uWMVXDsg/SVtaJwcTdOJRPgc9ybZ4rUW0i
wS8Zrd/woP9cTmp7KP+xQQHjSDSbBg5zHbQaz3QXsAxL6fORPVDx1l+fAi6Mdy7GLU8X9QJUDouR
g8Ya0JjXuOR/W60h8yFUqRd6HxWwn6eo/Wqqfqhs7sMpeMHXJLYWwRaHuYhyWLQNYaZnEV595SK3
jEiycHEXmwA54+S4HxH5EYnTTWQ2PY2qQcl+1jKavtuncWIEnxO1Bt05QFVI9RgMVLu9J2ehuWaV
hzOawg3ewxAjBEVzlGDRlEsZvi3aVW1tLrbOxBN8LgW0NPJV7iDw5I7JSDkbjRiVJOIcYevHSeo+
Ru3nSB/0pxwSg1dB7X72W5k2HZtZuGs+B+RA8BBq6mgZmxok3lwY0E2ie1BQokqmV12+sl37IjXh
V1WoukMCCpbne0LYNZfJAZsK5VdccQ1AvzKH619uZUYSU7U877YanmZHVGko0USNpIwgRAj2tfNM
9vBYsqlE+bib4WSsSi711iMXnY8cVxc9DsM01iRYP5CemqJ5SEziDVUuofcKbDwB6vjwwzfM/hW2
K5JebWdElgVlhUI9KjxwM41ALEy1U+nnuo+cbGnGuLFAvMZyIsvMjDsZ4IVzFC6yXCPJ1UXU9+xm
fpYQ/GKhBPqTvoZWoqo1uvYCwYTGbZ1nSKwwPu0O63FRppPq8pEM0RNdCgdNU6cWbgxweEp+eCBa
MshM+vbGbHKdzmkGFcE7kdXz3m3gfTgfsXC4lDXq2Zzg6vVz+50fanID83p3RbpjnxzDACQApyBx
JV5fzcFrXkRTLSkuHtVY8rUGtyikmdwvsZ6JKi4eNTLneqKS0lvd7Y7MrXH4ggtDkTZBE9ZXqa5I
kHxyT4YJFxWEUtsjbqJrlb13P5k2dAEvYvilXSdbbhnCERk9i7kGlJgSTQ51ReJF1LC1cSfd2n8Y
hoBCogXAmxKdVU/5mSqWqM+btajxxpgbS2RYRcn59TBNL0FrcxzM42WDOJVjcqHFx8cj1doC2dnh
moNw5+XX49dhL0m0mFmy1GTNdiPEXNKnyqnNIujfAxsKdPq4wkgXyQuhVylL2w04O52/YNvdyHen
ZIASKnj16RR1GnxnwPuYUpAn7kZb9Acds7rd4kVZ1FEDjRiA8in1QWMHyW+rc8NS61GH3tTgncWP
kTdBJX6zpYYzDSwg0noC2w2yZzmfyZr3U15tQFsbAPhJNQL+fqzSjwYk88ztTrRJq+OEEXVMTsl4
op8E+xALj3TgoW2g2RSg3Loso5bpdNnCER8jdDE9EDqDGEtEVVJCwRb2mNwgWZrN18o8De80Xfk/
XYK6MPVrPwMrkJOlzLFnOeFDWjoWkUG3I8kQYmaP36qA4Uh26iMujPbwD8UtNU7h4EQ9opiDanUP
WIe0i8NBxmea2HXaFPkwqY3lyWlrN16aMLvj5ZtDCLTFIrMUrEe+vO+EHXi7YVKEtQDYRPKFjHBa
16/hZ0MZFaHq21Ad6Pmvuovg4UFw4TncylS3r1L6+CR9AYU5tL+xssc/EJ7gPGB6wx5bkMbJw0dS
UCRIZnH704FBXoXmngL470281VUekAZQKtad31NgUcYOt+xtOkr+MQ2kCkBysE1i3cZ4rouIXXUU
iM9ACHClje5iBQ6WQpYY5brIwy60zOnp/lHLOaf7j7xGhVj/w1lBJiBr9u9EwNIIafduke3a+xZc
Rdftpf1SDVOyoZzKRaqK1jY33pgDRu6+dL19fGEJFhfHC3+63CGHN5Di6pvnRuzLTyQkw/G7YXoH
jJ6JTP87T6Hn1YAUsUlbnELOeTztsgf3qHk++IihF5ooep5t/Sw/Daa///RllcU4ieKEa/q0jdX4
peb5amNs0aC4nXMwGZSEawmVqXmCZL/QivvVfJLhmpA8Fv6lZrIVVnipF4ZmUAdU88rKpBJXrv5e
zJ23uHmsiFLlp8AT1UDPblhtGFGZZA2yT7UdtmGmd6wOII0FOX1JMWaTMTmMyGYspHMbmCcRnYUH
QyBSRbruKnmBlWReWMW2BmOc0GBbtw3SrpRp0CF40mT6xoIjZpp7qxQnFqIsiWHa67B4+KWS9rgA
Upz9PS60MidEtf1TGzh0ToL4B0h+fWB9oigRcHu8HQvqSu0CPxO7XwJHjF0Ebyyps/tqv1uhlbfB
vuLziYZhci3XfLKzzAooJTEdGnpb/HOxCmZQa5j8y8Q8UnKm7xb+5+dKGvu9u1xYJMzRYn85cYD8
i0ap3egPbiqU2Q4YPq6PvHJ6U1ElioKcEzvcSqJSBYen8/curCJ0OK1eepO7v4GEVYFIXZwu1nhR
LYO5iQm5eaIkQZsg2E+UKduRgspfiWVdyl0Amd9+gmSe75Sq6g+OaP/uJZ1ygdqSK1xT/ZzGX1yb
F/cU30QQ55B+U2d+y7VAka6nNM+A7tQf49rq0SOFWgAnKvmSvhV21PvEcw0T0jEZkTFNjQXST+UG
4lcYcNoD2EDqg5vXoPIDL92inhAtWfMQvfUBtt268DoDl043JuR/YQ+luszgi0yGVb3Wb86h9RH+
Nkvf54h1whDJ26Xs+S8Ti3wJ4Cp+q21bkrOgc4Cs+sZfFgDpT4ppmvazQrzqypiYKYIAwHUmqGTz
35j0XMNN5pNaMdMDK7BFO4kR91qwDHgCwiTubFzketFwO+27LTXXtbDKt0T93O24sY6ZVS1RvqHK
w+RoClt15iAMUu/2X01sLHywgc8fQKxLggZoBTFPA55vENrO8/D/NM6s+RWjYW1uDfau84ogrfTY
Ig8E8DMKtUAkgHW/XK3JLfh2xjVkiFD6YQ1yUGeBkgtP/rnzAyatlFMoFWahgjrgRoEPUTsa29s8
vGwdm728CUcpI+8TjHCOdkwwVQpx93i7UJgLcopNHZRZeOBvuxd//wwJ7zA9RB93jEOu9pXPTjRj
6lF2SOKrRNT2EK2AAl11SJI0tJBkXWQ3Gsv0ti/XVptR456fyGOXet3oD/Dfc/Byh1olmzx3TYzc
BvImAkcNLA6FS3bUOFrrckBQj86qJTzIp1y8izVVu+ze2pS+uRLwbWj/5irDvli37dJhLpqoNdya
EKWt4X9c/IWVYYtJ+suV1A/ZGU2S5LlgywctW13qU6/r3XtlEPLgXd/rVapcd3RYkKi/0Ou5fnHV
KczCJC/ZbWwjTiO0EvpvU0NReZeW+fYB/LGovmPmRhipzVUU1l3sXDZJ61lEhFkmrlImKE9Nih67
nYRBbU566Fb9aAXoKc1ZYVK/Cjb2VTRhIYODiI9tDeW0eW4OlHsqNjpGfTdxI7TKBuMirpZQ7N6i
eIz6HUfKw5S4yeuk4oXxOfSBvgl6lmcK/yOb/E0zrwagbsX1xa6sIW3SLZ5N+2ikCzg0c89yjHh1
fp556aJYQYolrpVtXAWNh4SnPspVIYEqGk5oT3sJ3F6Xp7CPL4cx/9/n/a3fsCNu9SI9fWmGl9me
UUQ8uSil+hZ1nEsa4WXLec5076a4dylY72hl1irzjiBlhgfWqz7Vwm1UAY0KhtlLcaCgvvJNXw+W
iRsNQGNObqKdVWcPbCUlZYlL0Z4reo/3Jj8cRacyk/FpwRFSvELagQRQ564pSaPwLh26TrBuDJ+j
SIYeY+X4wUtPHr4iyZqdGSwwJGoXsZAIGHXDNoVwFSQd3FP58N2f4n4q5hJCAhE8sq87DzCIzyPn
ez+cJ8dLM21OylR8jGcS5eC9yZS7+hZdLlTQ8ptlkDYKF8MIWsoCh4MVxgVpNYs7uaP2NlVjzETa
tU+YAD7WmqEtcPyhOOpzuPpu4Y1+JcDfegdOG7cGLhkIaIqEWgGT+45ElaZ3dUodnyXOlDFWvywC
y+cqJl3m9+Nydu8UpJlDHRJzHsvS0vrfXlGQHY/wteZgjH8o41iOPBbWIBPgFHdj55dbAUw/R3dF
Zlm2gidOpX7Vl018lBS1Y6Vxn8GljxauAK7Gf9qprYo9EZS1++gAZ1tO2RYwMP+pzGR/p8ND992+
f5sR7dJfGfzCBam85V+iN9Whk6eU422aHKNNSasI115Ndq/JFPDR0OTupYr4JfEdikZZAGLKFe5o
gKgX5JPRlzXbJW/DDKKO99KLMMeQkgOiaOAPspNKCOOxlgB8+onozQdpMlob6q0bcNM/DsQAlEG2
1ty8X0eMsSkf+Rjra4my3r/eNUongU3qFK0ahk6tmcqz6+yNyiNHf4SfUdBzIkao6p4yG7syZw3+
cbxCfPSuxwx0BvpZkiW9BPbiBfKCb3tRxqbCeWB5ROI8ld+wBaoqdHMShSwfWDLck9EVabFGh25u
SHvxM8cL4pLC1X8bGqxK+a7kX74lGmV7q5/aGcrzHB4e2hqM+uj52m576MbQqUGPGisiE/SO41z2
fyjHZ9Xe28xVtaOYS+qwKrZxsQMIBCfAv1RsTjJk8h5BVd1Gzjp94gm63bm/Bu69fVLOrjpEEXNu
mJGQWGtDNwh7udiFtcXfpAANZVOadg1Z2/oYtZK43PQ=
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
