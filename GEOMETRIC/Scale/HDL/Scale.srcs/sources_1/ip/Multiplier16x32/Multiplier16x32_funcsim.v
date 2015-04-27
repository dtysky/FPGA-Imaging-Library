// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Mon Apr 27 16:48:53 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Scale/HDL/Scale.srcs/sources_1/ip/Multiplier16x32/Multiplier16x32_funcsim.v
// Design      : Multiplier16x32
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier16x32,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier16x32,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=4,C_A_WIDTH=16,C_A_TYPE=1,C_B_WIDTH=32,C_B_TYPE=1,C_OUT_HIGH=47,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier16x32
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [15:0]A;
  input [31:0]B;
  output [47:0]P;

  wire [15:0]A;
  wire [31:0]B;
  wire CLK;
  wire [47:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "32" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "4" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "47" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier16x32_mult_gen_v12_0__parameterized0 U0
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
(* C_HAS_SCLR = "0" *) (* C_LATENCY = "4" *) (* C_A_WIDTH = "16" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "32" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier16x32_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [31:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [47:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [31:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "32" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "4" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "47" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier16x32_mult_gen_v12_0_viv__parameterized0 i_mult
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
eHhX3Oi8Svw8KWlN57/uYre1hY3d+20r+FgH8zzvIQpitZkvO3kXi82/F2K2bOdO/oQwb1vQsCxg
TbrcdAYu8u0d3sLgBFdSgUmWGrOvrLWbx2oNVA5Nv9rJ1DIf5DFy0PxNScFm3GYQd9rdLnEA3+BH
OQrjwl8aT8wvS4KAPVJEcT9AZa/ZF6sJRlQuI4y7ZJ2ybzjXXteoSWuaHBUC188UJssE3pw/Mlcr
P0QMrkYun0bqvwUMvCqehz8oFAmbteZjjGMFlZi0bE+LjBdc536xWpmPCCQGhCG9FEWZQQCUOrGT
T31HHJuW6S0UzMcUpUDfnYpFXp45XH/GeJbi4A==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
Z5RO0pAKRiqcegoWHwsnNDP19rZgLxGPedDJbdoBLI9YRtC7bZuJI9voxDkLta+W0U25GsGWdEAy
U0qqQo//tWM30WSwjocpna0es7Jgp8TM+onn9kasfwP3t8KZEstKkU1AtiOLNwRMGcdxjT6lD+S3
poR40hqucRHTSdN2WMQEdZJGn5VLoygpKvSUdljgvJU3NRaOO0iYUDZJbZ3F8Y5BWjVsCkxclhQ/
t7HH3XH7jzLtpqVXZVt21xTxC9C+asUndunJkXJBAUu3SGuvLlp173WVBnauytXB0rj2UHkL8hlL
c0Zt+B529ooMMg8DxhrHcZr7an8HangbPXUP7A==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19008)
`pragma protect data_block
L2gOuNLpq0BaVdZ4LSsRrdS46Ziqfpptt7Pi2WAzcEebNY3jDA/7nDCf6bCATj+lNpPXASjcYObX
wbjHahobdl+K85a15fsAUpBItwpsjjX2XEeNToohdB/mbncC9nKJkpxhyknYpITWI9dJYVOY2u4z
9qqDn87+OCk9Lj9LpzifF1ERPXIyjo1L/h4Uq3dbTRGIVx6THLTVXLqYpP4xuz0gp5bHGQGg+7/y
W5zYaGn8BGiYkPi/rW9x7H/hE/VsSOOIZsiQDI2Qoi3rt/H2hrVLloPMHUOVxECTIQAP3RRS/4fk
fL9xng/o64DvdvjOnMkK+rcprQnnfLrbw60lvg0SdU/TfagXWh9RwdLvxpmHJxVbFYX5FfpjaeyJ
gN7x/xfXx4YM6/nLTXkeE5r6iN1CzSS2P5npyv8Icz5H/dDYcbOeoBvYl0naBrzh/9QJoei/8LGp
udGCbZGxcA1H/pC0J5q7MN8/Km4FfinjGy3y+oJFaDS44q/ymTA6h+MPtHXEB5EYgJKWyviFRifq
+Qdfhv31CEnInkhXB1lJogjFsi2kmeVY3LCm7+SCXTDtJ51bOm+WUGX5ITk77XZgrMK1dbWfBDN5
w6DGYVjxsIHJj0khg2zK/DKDNadKZ9LGa16nNg5Vl0NUh74scCXfymhsXg8WTsMA7VBwTp8zvxD4
qicyO8uaAXbsM3kmehDAVSRWPOpKoPocWGh5xw9uhEeUkpwjWYEHIMJYc5+4L88r/DbhikEaXTjT
lbFfu33aS06Sy+80w1RAu63qNEk2C4tB6L9OdShPNIG/yPg8739Z5+Wx6n0tCD5SSJo004tqEPvV
0k1w7zfCwMmPFDGyByn2kGG7DGmSmSUnpbjFXGZVXQh193rKl/FnCoFpCde6u3co1/f8Z08Nfock
g5X9l0pO0m6iLHc8uLXuKD50IW9alBb4f2FuxCmoKlaHjrE8vmb7kgNbDClAuUTh/N0ytu0St+EU
bk90fTrDCV6WFGCeoe/+wah8cFUqDKEs4zlGa8AGvI1t8WkNt4yENo0L8NuJLgNjkHq/vfczDcRR
L8GSbZrlAIKH253F8v6cdIv28XHUrYzmRUlBga83DPxate91T0DHfBIUXJmBGJDokcEOYGTm16Zt
ek7tqwcyXc5YldAIE39u8VmlLpsgvgA/scvmwWPOtarnm0rvnMCs5bXfTjXxNBGQzMePYaoZ0H2S
vo7zmxoqJmqmm/usoYYoRiJD52QefQP8LyMEbX5qwGCHYKjnY4f/Fg9ILyjjOaR07iEi6FpGZgiM
7wjvbXDbkfoCUoscvAGBZXLfGMq5Qg0aPo6P+m8zlDHiSwdRMVNZ5xVCl1S8y826uk8r0JS9x+jZ
hEMvW04p01WqRuraG7HKjcT8vsvfubLgcHzkfGDknC6l6q0W8nfXnVlmypYNUYl1L5HnwFrkiLAn
blmtk7HtHv6THd1wu0mrnOLcBCW+Xr7HKBZa6enm5nJ7V7MSKABfslr1BTXoUIU8fSVZE2cxY8KU
muHpuOzRRKUEwj1Cbqkfno8mp85K2BhAB0F8OGCVkL2Ffs6H6sv07wUzjLCPmKcTc6HYhDdO9JDk
zwfItiferX7zHMGzhV8CwbnvBa/zZ5w0cgIhbAjZO1Cgs2K7t3iCcwFih5fRgTuvDNY36rMCKD5R
lB4iRIQRJtwl3A15jwSmBaNK8uXRW9w2W5adnwj3/4CgFJiJ9BA30xKKSOp+AoVSZbPLuOBSSaLu
8/L3TLWJ1XgmLBmoC50lEPEzsA27ewkKec7QgJqHJ12V1LFdkBXKIBMy043ZfcIrARCGazh0a054
MMh7Qew/KNcbJNMmbc8dUvRkV1jwKiezYzR/Bh1/OhBcuwJ6FS9k1mZpLyF+ijwu8oRTomW0HCiK
qf6iOU/6L4dUBBlKiNPWVqjn88GkPMEDmbaZOBj7B9I5mLPRBtpoFsYhRH0DoNuHWvWQGGAWF8NJ
VJ+A6N0e9UCM4zvzSCOgnh/k4tzUwgMSN1yBSo2kffA+8NR1BzkYoYX7+AqqY1pPXU/G3IvUYXVM
OwNfwdHRzR1odKO1iPA97e7vLpVu8p7BGjzQoOJne3Sym0M1ODER9em57VoU5gHkOKnvZELYv6pq
lmDrURc3gX7V2QnXR3Qn32iQVQvUKx+IzPUuND6SrIZjhsZy6NEvLpZ/qFR9QrnD5sdlVVm/6ml3
o1Q6yJbGT2KPazHWksMhIPaK4ER8PvRB0jWTBpRSe5lPNvU40q+505EEdM5AIFuVCSp70iDzqrWc
jSKYyWzsHApxCRwYaOgjX88psdUrs2hIXVeK5VLYyEQAz2OrVgWh6cRSoNusIWz4sG9XOTuPilv8
hEz90RvZWZtFlAu8k7Z/PagG5+iERCygMrUMTuUMEI7UNPEMvSkMa+u+BpE0mo+sP3OUsSMmWzhj
WGOzwT5HlQiWaaBRLakyyJquZ4c0XfTa7Jj+sw1xCnHKEuKHZ44aRV+OyroLP4pqmNVCJ+71ISyJ
T9TeM3ZP5vuaDIQtX15TNsZ2JpjKxxI8l8WYXMhCNz8gOqutVoryjQoSCVixJ5dLJRPrlOfOjrSR
7Harsr14vwm3mZ3Hz5EXWrQSScjvL9sz7JzWRe4pyI0YhNdKpEp39aBXJ/a+hdAmYFeVBl8oyrTW
Hj6Vl+v/bFaDLc27ew1AIxRQASdxkyii5U3kacYk5T4fD/JZclMnoaaftAUJ1YmaTkRV4LUEW9vI
8h/jGh//wEdYTs8PBDnxStYx9nc/h6EVAIhfiN7oJ+rjDEizifRaMh26Gh4I0z0Pfqq5nFYv3js/
bI3dK3AimbIBGSMXHI1eZ2CCb0R1C0Wlwc7f88GCgImd+PMOcv0lp3AFnBh0ckKbvpYbZG+UJT9f
VlHwDg1HVQhsJPTzJLCUM73ACSg3PnM7mlz4BgcUHvpjSVEqy1HYePJVg1SpzMKre+/iiy6wYzRy
IVXdUfbY5/DzK6avi16uVUTeFOXwkBYoqlNhhqswXkSTy3alRGoqpgVVLnw36pqoMo/AXo7IscMK
vMGlDiJEGawElCVcIZpkqPDR/+AFhhd6e71nmE7doNTPdfmeLd8daEgK1B2k149DMMxPDXyCwYbr
f4Y9VK5BuFptIBDuHM60gp34hKYA9rfwDq+ilf1uAWNmiVV9qDVXLsTAn30w4KxORQ75KH/S5Hoq
CGO8LkUuBCtXHShPmi+new7tZUrdj69T7rvADACIl3t5hgkqxKh6V5XNbCntBsnjvRQiih+XYDpH
hdDJZ7j8wM2kbZAeAk4QLPpJORkw2jAx3NHgXSm0IVyY5aUADJZZdO53LlcKtinDpqR+Arftw5FI
b2xeJ2hW6c65G8rNn66cSv98L0jYlZoJ52UipgSSFWlDEMs55SSj1BPGFE1xZMCoAf1dRlCSSSZt
oHwNRzF7dXCgra7hO0MuR1Tmn2Jh6MlfHgXghnUCOU9xfNAZ5yUyevcJLeIZqw3hVvqF1NIRz6j+
G7vzrDRfh3+VpjifsvObcNHqpEN3Mis5nvoUogFrmXUYmckDfnMkkraBs47Wb3fjfuJhxFTlv8TL
o6inDRTF4G2hLkfsYGQTtqYo/WRLqEVaekkUnWVbmpG+F+TDXOwUHHkmnj+ax49NWyqQ2HElNrkj
XlHoB7CW+QG3Xa3r5kREcLyQbJMc6WuxFCfa4sjT8zQ45lMRyjUk8OKEyorI4xrxg+l/t2icx7ZE
OuXGUGsUBUEW71Bj2/AfQMElp54zIjXpPJA5Q428+qi9tXTxQehTkQ7XWN7TzYqa+83erxE8CgXu
KOZb4YScbGSSAsw/nn6EyIZCqGrxzhRB1LSSV8loeHXe6YNQ1zRoiMoTmDzzjGNrHuYbkIY48jD9
Wfbd9O/9X+meU4mRy0r65PU6g7n1ZV0GfJBZse4lS9+R7iMeWgG7E7sd4cm7hzRhFA0/82EdKcxH
S0exrm5t9WqXSxyoiln2Fu3MVGom6OI+ebaxabnhl5GQwOYNO83YZ14wyGGfcvv3d/TIHxgZbJG+
dFWcz/+q6yX8U+tW3T7pqLHLq7+ueuEJ46x606i/9wyz9AAn/0K1LkPbzVsZQ1q2ySqlwoMbakE+
PtSPqyXVHxCvDFvzPukPNTVP3SqOAM0zecHEIRy2UsFqgbSDlUsilgQMnpTaMvjDqEw/oZV9RWlr
lazFS2fhzKRQEXV4sg1D42AoW4ulUaDKd/NfN0OcczUZpL7moqYP16BPqsGic6S4KYFyDl7AO6Mf
d2U85IhDA2KoyTTlQYJvYnK1fYrloGcdYLSRbqUJig0Qo+bfwuSPvKQGUO0gMt1Ien/LgUl9BM5X
EFWD/Oh4SY+G1MZKDCH9mKNkRTbkAOCkqgU41ePPAIjv64sWXXUWUYBZUqyrLlohU04jweGkDU1t
zkG+eiT/ucSxlwSEOAdfB+H4bHxXPr2BfsQDYC+DLZ3TSOf3VWxWq0SJPRDJX/mdjKBWiI0KOSw7
9QgPHqPqkcbaiZJXO7urXbV9nAU73EuZFVCvVQrgu+u0B23FJpRLS/8nLvH5LFbtvXcuy8ylt9sx
LqR3QM+JU8vZqgZDrlTFpfFxA9kZUjxFpKLUhO6sXRIYqdnnAZb7jypPng8mWgTsp+Fs5ezX6aNU
OxtX8FgqIbU1KkgjoJTqCfLNTH4rkdRzcI4OBRzILIwhbWxGp72D2gRcolGiCcDNFH07MV1lYkeO
QRYeKIWJa7CYIjcqmD9L2uVQ6IRQFQeW93DN15EoC2GMQszxaI9nf0Ks8H83eayN3eocmV0kMxOd
zPNhDVi2TwAQ2Pk+INqRLyjtBq5Kp6PPh+L1fV9cPWnVnUp9IgUX9d5Y+hahSV9tUT3546Fgbvwn
ubbve5QYDo4V7MAkmRJYtNc+qORPWhDYDAnZ7OPfx0i6d+DHvQCJVqsbdPn5QkIaljhzsXvshi9y
sMvVrGUoNo5f2ss3TbYdKgqpoh10aSjfw9LJRPsvKpvjjac0aWJTQyeghvbbnKx2BvfCSEGpb6x4
YUiVGOSZ46MMt6fgIobl3uf5T+Fx/FPEDRpxps+TVy2C9Oqf9YBIp01ar6VvfAmLdKuTO8z1PQ30
rSCaZVL3QXUEzXHxXJ9iATvYFSBNSHRlZFn3BLMME7R1AvUFuH1X5NaIOszzeiHxtPFu2d+jKL3b
ekHdeXcMhCce2/l9Xxs7ASrpKHQ0CgEiapGIdqy0h9t47yvqmJCiXjEG2vhkw5FrYFQ3dY9w2a87
ob5JEY4t1mPiHGeG7bdOPEkBAdN/dMuzI7HbqBZnh7J3OOU1cZT+KD+LZieublrN2Y/tMl0xyD04
jLdyLD35wndeFnp7VaGhBX1K4ZpZnqZgHR4Nm+v9s3cnsUHkrqpMbOeNncr11slkqaIwssYijPtj
QGeC+N48xTTmfVSyizEK7F+BG05QMpVXI5D7KmOFXrYcnONh/NcmCAKY0yq9P1IIYfvgp6y949nm
vKe+wfS4yBUsRSpQJMSXw6uZcD4al61Kpd2aswfZuHwXFhMOotEikSCV5rRHpERP2kPIvsQDBGXi
Wa/sxrhub8Pt22Bqfe24X3C63EIitUUTaT/kpHZzj+Nm6XiRbNAzqchWxJDDlnAdVru4eCJrN1Yk
7xdITrJogIYFRO9N0lYSNYIs1ZWfqsO4ao1E6vCGaSt3wgOoy2LKJAr/JVDb1wsxDHYg/C0/aJoQ
99yF6x4pYRp915W84kzYutTm/UUKaBGiHqX8ZSHsl/ieGp/AV1nAgrOLEq/r3NcKlLgkhMDOx0J6
dqAdyH4oJMctTQfaolcoEY41CN92RFFVR47ShTNfor4Po9D/cuWlRNTJrJg0PP+kIXAuXRAqKy6R
RP/O8p6W+93g3whdO5jfr56Lajk3jl7qDNeFtpj62mwEwmR/cKgzzIfKhZl2q5K5+3VeFFCUj00V
Wb58n3UxuZgZI8ZNZiqXVB++UKF3b2nv6MXOq/As9HIxzr/PMnhAzYOWZ3AwbvuovrML7hR33ZZw
FbGYxI4gCMYUqeUbvRhcvximTIpxS7BozSWZVRw9XgnXCBCBsWlC3829hH2cItcjZwI4DCU+3Evm
kT9SzeH7ylCCOCymeetB9CrPc9TUskkseVMZqmsvjp8em4/bPqi3LO0sskwqSJGNKubEa7VT04eK
X8ni/H8c8X6jNBpLA5D+h4qt098+fR8YoIERtkRTKfkUkqkcG+H7Urm4Amg/bVCNukiEKsYOH0JU
G6Ys/gi3lz8j2unJ1iSuDyjda05jLFF9N+dq46IEMmwn53VMbEUkO3sHclGjPBXr19H75jSHQifL
QUVaUuIHghCibV8iickS74XuAXjwCGHFVisx1yzebSV4XPZub0c/aqwJavscpaIFbOX3AezggnZ+
FQFY0F+cSYnQC30HbmAIyJgOrFIjyEdn5v1GJpvd7RyaM6Mym3FkMG6Gjp7r5JKr9fri+GSjo/3Y
UNnBPyj/lPY/liRPWqPlGSxdQTFrPi1ppzQo6ZLmz9dDVK3Y5dVvSMGSMz4JkawYpS7Ooh2Jvi+b
HAV7vnBKPce58ud00p/vwdr9ykctF5Ud4BkRy0reMtz/Mc0lWkd2rv745rg4FBAXTAsTHrzy5M1a
AltpsosyXt60X/v7xSVg4CAyOF/Mw6BpVhYhuBHV9cmuOOSkWPdThSeibT17YXJifkHYFkd26ViE
VVABEBFEb9+CsiGauUDjhMYW+jmJDt6i6Y5llx0Flmn470qHLJx2vQJlAe77U6ZUV3ov2hyeXnDZ
h52SbVqFMM/N544ybAjAnnLRQ4GmfZF1vwpUZ/qqXi9Lp06jsspDBibT0/6N8F0JXLac95mM7X9k
8LM2p/hWx3RkwatWxDK+oCZlv6/kwi6CUHt1LPE9WU3AfV8N7NSd9GyIbCdpoqFpYs9/5TLkKMPN
8Yqs77fvaBpGSrOg1a0L6DKPB4krTtNXa0p0Egljq4F083KUv3NJIpS06snBRPXQ6NFM9mH//Th+
GJ9W4STTcawOwk+J98BUm1C8hZBvBdCBuxklTVq3cQBJAIOoWhjeW3k61ckguOVuGzjA7TEDP+sW
Fjvuyte8XifU9tQ2al4ffna5d0lGjEGLaJ0c+qIAfZWQ256OakkEcVUTJydpW9SBSba+nYuspaGt
qCrBDEgRzFu2WAcCeqLmpFAHmnR0Acu8bwd5xR3Jbo7nPZYhm8vFWXsDT+tW4ZqLBQjj1yu9YI14
kcl6J1sgI44Y2RaARdEwO2KvK/NgIRINCeejE932niBSGQRQ9feEPkms3yCUHzPTTB56c1VEhGbF
XlfbHSmj5JvQK90642KwKWS4DA9x24kqb5Ra+/Pl6X0c136832cJCIB8BjBZHULxBrXRUJ3D5nPr
ticLy4K3jR1HQ3lWSgA3z5+K4613lqWL3LzqWesH59C1v94Lky0jubsqlnU1pM0tQGxrcx2MqOvL
CLov+Am6M1nu51BwwptMS9Sj46JN9pbHbyLCWbbFimCpZ+8KLNDLNfdhufuX/KsbnvHJH2r/uNgd
0EZ4X1aWKWVMSsdYvbqwIatds+9RDSJMCb5809fSCa2bIvMIrKBcN8ZTdpE3pvClBtAryNMGIuQQ
/bK+hUEEh8cPoa3rZ1AfgqIwp0pCBm2OGk0ovLcnBB9tHbrehS0OGivdZzkOQInKwYCDWe+LAf52
OGcwHStTb6fb8AmxxQ8MWZVJKF0K5J1zJ8Ol5eCyVW5bxXpRk6+YAFIA2lxeh3+djO4IB0rRSSLr
Hx/DQYZUJJp59bcxAh9KJEDQTP9yyyfGhKmtDOwpowJk9Cn1HVjfgcwN/wJ6hDkoL0kIaGsWpeJk
V3jQCPnCop+NcI5FELC4aD5idZ6/OQ3rR4dhlWr9oVuTh3Y/b0WjzgEBgnMlPF2TuTEM1i5y16oO
E/X0MH8+CvHBVJCDQ88i2miMwXvKNU66NtlmzuI3EpEiMN4mDOghNlIRWiGUpAN110r5H02H5tlx
fKlnn07t5GxIB/0pGkHcIosA5RTmr09buULHCmAocs5BgHP7p/FhCExOPDLLtCsh89SBd0J1JyoL
IvsInw8XwhW1yZjsKzXJpttXjUDxUMrczmFJIZ5i188HAEaQgDQe5See5vqhgiSb7wErG4e5UZcl
xyqLVpxTQesR4JbX8tP9xmx87vcLqwhln+XfiJ+KGLGePPOKc0s0rUhkZUcXHGds8/KBzr/tTttp
FugkdBcEmcy7s8Cl94OYJDpTfdcywEMeNE/nKRYhnoD1noyh+6DT6nP18QIkcEdclFaxSe4fE9wc
lMNUt0CH6Rps1vFUVOoVwOBFEE0pZx8vw38oxAtxT7GHI5V6ZtY4EdHlpJF4+AQIYQkdDL8MTAW+
lqo/S2Q5KY5mFjIy1FSDt33ZF6g+u3fDu682UaZ4jg/OX99cXAicZfMPTSoo6qyUtj5uRJaK45Sa
p5/UWjn2P0gmmCKJkPUpJwGn05YckHILD6g67V27PCpMhXzWq8xhZ2rlRqkSmjW5b/3bCA3GaoRc
5HU53JZ5H46gBocl6aXixN0iFQtrm2ZGQnNc8BE4Pk8hd5HBhLS4Y/YDG3PIwbH2fXERjpSF+ntH
oHbsiE6E7/RUdKiy0IURNQUJgPFESzk7QBhlpnVA/iLv0Bd1Fn3BAbappC1EM9g/LYPSvTDs4AvN
TJvNq66XgyxhNXfFyPt62z1y68q0WL0qqNEid/7dS/mBXMOJ8dIGYsp7WqZ/VsfDACZ4d6GJT+0Q
yHUCsOSxbD5X4BmLZzORunNVFdd2S9R/61MWcsFkd1J/l573l3beiGCiGXiq1ud4NMjiVw8nt0aA
ocr1dunnqXg5Xpg80zHIQJ3G14BoQWsMHJ3H6F7WBP7gQUI5ToKw9iMWDWR40Ep+KSePeQKqGaO6
McT+6UNX1ycpxO9szBgjLDjwNgRaSvrrNCRYSo0n06NFuWgtxs7A5F2p4Chf1sYKkNd1N2lOX50p
X/o2lCDB9HgCQI0NMjTUI4t27uwDeNYxIbc3DlYg9dzxFMIIx9plqXpj7HN1O0TO6ny2UnA7PC8G
WmqsxOHTbJLBmq0zaG7Tu+79+4hVSBgRkSDlTG4hBekBcL+F5xmWxWsHUGBS4EknFjzniG1MnvSL
utRusCpFrtlwPjabiw+ltbFKeqjp87S1Vx7Nchy0CX+GPrsNGNkjcB4EIw6IA/WMP0MqFEyt2yUY
F+/yTH+2RQ42uym8ifRyRTP+XGImDY04FLxSDaGfJn+yxDB9S/fXg52ddx1Qk/Udmng2I1adN0RY
sk1CKCxSw5ENsaBER5VV2DgzpwfGE74NS75tVtjK4/rTXTze6yI09TB3STUY6tCcZQbjXMo0YjbS
QqVXGPqCdmCjHWbwFw30LOIclOb/z6257eWQRLweFJiF2kRyfgggK+wXc3mTPlVZizLXiEjb2LKX
ozTMujH7WMbIV4unpFM/TwvAXkN5ZUO052wMOcCg6hq8gHmRwu/E5mUclUu2W3bd6NpO3d5NQaOH
vLwLgFzfc2PoDI1MGaaFflSx2KaLkNMMEZY1FG/GcN4fFBlb1tdyKKvCB6nX0yLvyN+iOYnSrw+A
h1qqdfGp0wyRyaLftQHkhcU2ROHr77WYJrtmDpaPNEaRcqw7hsOwdU4JPTG1qkw3uKsRzbkvOACz
Um20xIu0r6VNTZzces3NLPug7A1ju3td+kc2c9RUULWRXU1xM27tYJY+nAl/r9LqRWIRPSlc8kmC
sNxsIUwTOygSRk47/JtVeWW9r/XHxeiktVdN6S6LeTFNzvqelW4Uih1PirsjawSjhomobr3Rgo+v
WT6T1cs/RSnwGKN5fdYGhM1Ivtz2SBZEHwIoIxGAlDgBhKvq+nDJ2lFHYyNCVymFxL+71xrb3tBm
Fi7MuJBXInAWjHa6TqyVKhfetWajNu8HNhF5A03AqSdSM1mf/XGknWEXC2lPfFsfiDaKdLeE9vyX
GvPrMsBjrmHpX5f+3zzqum06P48nSI4fECLAO8CTJnggLq9VeM0p28SLXqkLh93QvW6FCGKVB6tK
tm3nXXu2UJC90Z/jlO3i/tO3GGbflOCBtpHOpCli0J4MGNCMoAmouc/JEa1sdQvdslTps2xH5jd5
xHly9zCCGRD5rizRzEiQP+GrF8JdMIEJoGaHKr2ThpM1g0hokR1QrZ3iKaM1m/RzoK5kVqB80GQ+
7CZKZ3/nvIOu4//Pt7IDbH1gLqOayAbaOCvuZxt7xQVTeFCAIz22hh8h8lltJnU0UKKdqGAQVslV
3i+KMnnPwtXf+ip7P2cWIkl+n+5Qe7wIBXaeoNw6Yfi6C9zbfMQq9hvFKOeAYoKchKdKaVbbFmKd
bB2z7LuAKe/bngqTURb6YdX5Ozeeuc4g7NbjWjdmww7/tLmmrw/ybsKfr80I3EbITf6XbLP4SFOO
2OASjhu2cL1Ge6u5P7PfpiKyjNKa6fDZtoDlMA66FFvVyU+BxUMPUE1Te1T9vblMSYUPpFyWpWEX
iIt9zJHMg+0NKGQyuno5QW9yxIlUGfd5aWw254DWxmQ8JNYI9TxMOXy7r1AxVGrhYczEWZP4UOwt
0LESJ+3KC+uAB60t7wEaRRbnLa1ZgG9SF5LWhoq/eabaVLvz2DLdzL+UsP9gUnOS7pzU2I+EPE5N
vVHjFNioWtB5ORaWcYcDmitGS5Si/S+lWfve8k7358kfN5DU3qd3AY8wXqoCMai0nen7Nkjnj4hb
R179awbo7vToVWRqYs1/rLZlD0wQ5RrH38SvrH5sfMoK2pqAJqbFCGuMygPhHwTXOfXJZCy33C6g
OP6gXbs3cCPtC9hgO8vPP0CXwrLNzHWc44ih1+xqXcRV09fhZmqkpq09OPktpaOqG/vGW1IVz8GW
JT4RPMp1FdPcaa2h93TwMK+qXGxMDeCX+UJBZ23SlFru2X6hgSe8CxVxQYIOx/dtuDcXpUXPDiiB
zUAOkgE1/v9W24vzBod45fzUyAk1kLDSNFi4dPVdIKC3ezBfeNB0xR8xNensHZQxqJpYj1boT52u
U3Tegi4f792SRTOvFG103jF3dYde34rgDcpaX+saMEfxIjxuCVE+i0bRglc2ktjb1/m06jEEATQw
U6q4oJFGwEj1VkixK67uQ+S3nKhMd57LbpWcxiXUOYP7SeZhJBBrGt09bXcRR+gABCeorQOuQBkS
kh3kbsDwaUDAJLk0f4yKyS9bUEtDELJzjarOy46qMKMqr5g+CFXkxghogd2ASP2ecrq9BLveXq0M
0xeOSIJ12qXgf1jlYEAkNxHdEOwCk2uc3wFRumyHTjsKb6VUGRrpch16hVVj42bypN+sxbcqZeiT
yQv9Wyuz1uWfflLpwnFgA/WSvtvci8/1gvZEbojdl6UItqOKHTjdP8GS3noWNEqyOWumAqb1itB7
61mwJWLBAnUIoG5WKAO+9UnYxJs4ycRPcKlfRs8KoVpAMXOHN6LzoGNTCuiQ86J56p2I3EOfYLec
nCEqrtA4p+9OiMXl49gfOpiJvRNVY9t0ju/IVmQItWfEZ6KlsRSsc+WUMd6XdrUzK3lrUygTBgYx
Avj70wSC69hfdvR4O87DIIJPMPNUyiYrFRGRVW3qFelwno9KuvojN5RTcv+KRJ1XQT1o/TO+CY/+
ZGRe3MH/FYSWdPKeOYP5/784cYkIZ919j/ikFMBgWvQ4BJm1hIN1ALSKAc506BAOsb6gKyg9NS9d
enhAfMoMBuQi4PMnkg7N7lofv8EUSZHWeLuhqjrMH8WgI1dC9tXybkw8/cUe8Y11DWQ4ib5oO6MN
gk7SAevCkKvfxafe/Q1sHgZNND1yfyWlxEXItxk8idVd53Dle/yKzTR2YRjm2+9Fa99QMk3VVxuL
PuO03TsGOfZJpdJLKUlevbH8Bp8CtiuCYKa6t+KDAXcu910ZATBMooUkcUeNRdKVNB8z5Cxcudxk
ZmwyLSK+y3TvyNWGEx8PV0PsVginLqcdZHwbxI3wD5CWvVgs5soQrwLBCBAzU38D0vLcaWpmHXLI
QEVLqoBUJUUowM/0F4DJFiMxyt4wZtWbDcIWGgtf81o5v4QPoAbm04bW2KAwJ3ATUriEE6nMd7ub
VlBLFObmDgeoMYD2p1aBcsmGyiB6mjlIrywcCKP0dTmAI2Z7pW2jfFcGo2PXrElqsvWtHcGOMGkN
OYPHD7TEkJdx5TaNPh1a8v4+WaOmthdHo7on5PZ1pQvMbOYImoIUlKOlEi/cq3l5Ek3sOT9oAV6U
5/diBpDtyUKjPJHDBsE4AvGR1VWUe9qdliHUV6IZNAKg51hISVNDqCDagNy1BVd5PwFXZNPKfgyr
a+IG8aIhl9XAp/L5gtaZvqFufkuWVmOg1Mjyw2SF9jaw43kJj4sy10SdHB1SkulrhipT2V0FMjiV
wAWCfR0r6PI6xN+ajJfQbhKot9Ntfz4t6ZEAP/CkCpnrtdlPxdHO5sysh08BewO5+Oc86qqCoDzM
9Hono32zy6pGUgedGQSqaVzrpw0u+UWlyn4PEwlauRsT1smI+4MuMNw3hM8HsWB4C/jzOpyEyHmu
sfGASo/D8MSu+6kXf4dgPRdhCZZUo7XQiylIKIxt8pqEY79nLo2Hxmb9nDKCblYP50Ql+7D4kh2V
/s8P8vwTuravDvDYvs7YUJBZKgflBv+e2y82LknhuCJ4VJ7T3OkYftjefjmw/R57q25fp2wIfdF5
5BT5bz0CrfFhrasgC2vfgF3m9d1lJTOrcEVzhmOmpVray5sdopHNtr4o2pLWjQHV3Mr/WB/l3lk1
hl1elEDqhKv5e/pdeP4RFZK6jvfxs8W25H6fUO4/TrLBXpXpxDpSF0l/9b2HKDkEFNL2Cqwm6qRF
8bOURgZkodCZrKGnIr5uLK0dl/nK/9GAOQyZ8zmLTl1dO62eyFiTwSP3LkH4A9iudL1y5c857JJj
vDQJuA1UtsHgAQX/r9mbXEx6i0DJhSmEyWjUCjNlWLzz1lpntc9zs8FHpTnOgceyJ4t5faA8cWwn
ZgVpyXR9UW21+rrtRiekrTzwJgSabygbRtptL/wfZbPxO3xF18C2HLERprq9iFxb787GU7RIfWSj
EVLsDnDiutqjSW/BChxiNnN7RFHxhdSj7PS6Fng5VoySW2oxVuA2ZpDayTBXdxfxJTLQu51X57RP
LtLGJapVjHzT5SBh8NZUToD9a4OstBLJ6njbvWCiaN+LJeZP9GH8P86JkQfV8wD7ytW4jDzNWGzC
gt3vJM6SlaNen9CWRFpngkfm63ZD2C3pbA7WHbu+ZO5e+aDtX75KxiXYxv3euqi9zyCjyYZJ+Z8u
dyCpln7IcLFRLu5zgu0y6aA+rPofwg9xZScfRr3ka3CwUm5GkFf0HehVcK4pfHrUcEVEg9ZHy8/I
CPYem4sPGeXndupgRguLpYe3UshHoItAr80q4nrreSwW6TMj+x75I7zv7e65XgE+39ovH3JBAX6k
aOJ/SIJCEuBA2a5ngXDcE1Rbz5h0sqo1y3b3p8uzhkNOuvOiLxvhdV16W/K6JO5KDGlKxYdG0aJ2
A3z1eTbmTC39pfhUWj18pJU8B9Lcgwko0asFdGmuWLMd/oIX8GP04CiVEOuRTdI7ITZlAZuRFGjL
5Ef09f/3s0Z9M1fas62xRzMJRbs0F6xEcg0oUMgrHF8dYqqK3ME4+a0chBiViY4WLmT5+BWyxDWK
IoVmPDs2loJkZxNDvPyTGOO+e4jMe2c2kAJbVw7EosHW80UpVJEWoWvHXt9VPKcFx4C8znFufU3v
cuuAkLvANX6gZ0YKRyNM8I3YS3dhCkvWQi4WbnBBX0sedqVeT8JkXK8+2Oj5sKErHYSfCDT7uzwu
2Q4SG8L+hbZT/5HmIg5hVYY+0jDE8Ch98JmxGZRLcK7UrKhGPv/zyk1sZu8S8kqeawIGVSobli/4
1l4BvmTLDVmnbwwBXE6y8XxKLSJx1aMapoD8nQtc6yd/QpWNxGr2TQ7fPd/exG/NW7h2hujbUTWS
LSRxiB7EBhCr1vQUn4YlqSr1kLkfbp2EDgan/5bHRadRRhsU06Sa+VCk11JHLdLiyIQQuk1wfR6R
xa1smDuVm8c5DJzUpQ0twWZX6G3tyV8Ruf5/LJOelN77l00b5uDl71rgFRct+JKDRKaGZkRAOjuA
JWFBf/QubZbaWLn3ZCWSe3RmNRnw0VRuvTsCj3rJj/nBVmQ3iGlMGutw6KRzf54sRW/5drHhNFZj
xPrlhYync757L9iLjCNjLNvk8Q7MuXNg41jNO9YG0ZhZ4tFPtTzbg2Fqcm5dIuqGe4lsER43m37n
w5oUeCJtOZZLSqbAofhtOcPO7BgRmLPsoDcIJ+VCRfmugT3GTdOH6qyEpoBSAdd3fNXiLHfXeutg
LpoXGd7zO4WgB0pLHmbm8dLI2uIWcSxEFcxQWfc8aoHIVTYnvPTgKJlTvSvG0VqHBWQwCHqVpl4M
GzoWS5RvxzBGbH+UzHaUGrlGFLbA08/aXrOCieCJdpyU2lVIcamWL1K5kUOT32+DDP7PhGxoMaJ6
uZZmk/W+C0AudH7xl3cupjLMUpSm23rGSJZT/gNau/hXXbQ3Bpo9x6lzVw5o9gGV+KcV0lBS1FFd
qrAa8UH1CmenKQDA5/6TicTzDsUYFVk23FZnns0sPKT8UvB+iKULTl5tVzFAIyatpEhcAUCwR1J5
lBiKp3D2npXfjVsZ4IcHgf2+Kp6K1WixqXKpM7+kLhBpdI+MMoUahsgDoMCFQEIwwzZfbqWoIi5e
k9iOjX3eTqrkP3jDGXLGSwVqHAYAEBOMW6V03dXOk6JBBnmDgNp2VnnCaYLqaQdaV8tuahjc/h2Q
HeILAc/zh3SlA/gh3ZURMVndrwUyCzSa03eZV5eoy6FsCo3QAwcqNwVjVIsod7Y7KUa+VSOpqCoN
PlUDRX0guVZibF5T5fP7wRr6XVTOKtYYuxfZjvAcYvjKvfClH1nFifBqkqE0EzlTgcZbCd7xfl6N
q3u/ML9XI0fnLIh46DF2CTb1cCFjmlYGYInZJisZjhwqdpqhNRQ0yBpRpSGFza503WLExFiOKXMo
J131jPIpil08tkV3nBFGyxkLCA8o87KtDXqRjLihIjD8jSp04r1+jvAHEUazyFDPRn47u5q7/KL6
cxF8fmik8C0D+69i2z7srQW0VEIY4cm2/++v4TVid5oURsscBSC/dkloZ85LKyKvUH3jEMUCo+nQ
+y5UYhaPc2rSAtpBWPABoU4hCZmwqbpcRqMEt9Y0CFt/hdIG3EfTXYJyta2nXd2plMvLvVOLm0Yn
kzf35+yMYo4jbQ0Tnf/cdqbuxoVJgXa7J+vmSFsN1g/7zGI2qKiG5aNh+Gd9Mu4Xps8GuWS2kxVp
IrSB8+kwMaukljrqgBRNZwitBlghE/8+C1Q/WevgWPNa/2FPw/vPyGFdKo1dw4ANNsIK7st28Cy6
p1IG8sjv83rZgNme/nrO1KgL67jRJsOJ+KQ9VuD8stomcQgwGOZyU3fR/z9I6sz82oNOrGHSBUpO
Ltixlu18VtUPzHTcL4OhAVn5S3C5AyEOpkOHs79sAUwnzkLXhvIMheviIjOQpM/NPUIX56GOl4OH
YXDXojYlQjpI+j7e73IWLnAAvvFXk70xu6rGfzxvMET3tmxRat44kAU5FxA7hu1sEkPAsqEnRM3Y
FdQ4aX1Ed+IIBEpOK6oHmzPOFTBNXZu3Dycg5sQzdTVleaPUb02wZ5BXGeCHiXZzHv9jXJ8NKRnH
dSaevJiaAk9nM3oNWBBg7DEqDDvCIau5JlRIyRMdd5ofsNfYJBhXsmkBBbZDRRa10I6MfO76Cas+
wSSsam1vp8rIUedd+F+NJ2JGGTikdrEmyhQ5Ara34qSww/frvQZMSaiaatbPNCbb56DPPTquq1xO
1IXXLfo3NWXWUXBobhKcJLMwkoDtYzS2ON9HKIsfrhXMfB17EmzRz0bT/Ye/DbEQMKI8TrEVH7QE
+kfTA08pnxxnh6AqjO3CenuP2bYAfsOvuK/DXATQASXShFnC6JM1jz8aJ95NUCltO931w0mfL3WJ
PgYSbuABjWYQCkQoCu+GbW+Mmvd6LwpEjIF+0ue6lJixBfDGZ7gqsgkQTqSxnDK523Nblol3BnQy
MV15lQMAJIDybRFXDNIKW3Qr9FT+5fdLE59lk8iNcXxK9nHSkNmBDkhOw/Vjy+WnOhmGy/CopA0e
hCPnVvrY4eY9bLJwiFuA0ydhV3iRTZ9IasSWwKV0SCjZWhQrZPnC6g4qYQB78QyGkRdECOBIZG5Y
RYIFdZNWm6ktRmjTrhHF3rBij8oCCL3h1trELTgDex5TPpFICPiyiolVplmydIFoBWYeZxDOzq1J
DTiqHhpQhiGmbhHT+8uft1OBx4L6Q/OM/rqjRN01PwL0i+IVtac8Kr2s55jbKgBIGFQwNcgA8/Is
bFirgu9ML8quG6L7YAnNIj6e20XCT7eyP8sjdEgMXcg4e7M5Kokzq7+VpGf37fXsSCWHUFdyC7Kc
e9cpXmZR9BtYOrgdIwAoBQkM5rZLR1raLZP/7coKyAQ5FrZT/u5bjsJdK6gtmfJqJVo5SqbMfruz
Ncqq3ORDUI9HAW1xewrThlPpyNDgsIiFWWEvie8ziM+6yXNc7ab9bJnGVM3oHpji3lfMk7Z0+hoU
MpHYOkuUEiOCHLDA1DVPEYLEeSF/22wG1jrue47GTl+ICThghmHrqfE9lczzyb4Ah8/txOE2gdEC
XKCe7rGDNm6OAnRZ4+Q9l8tiM1Gf1Gh7YkFaGn3H8kFwUM2Qm7aRqRbo2XzWbdOAwkRPYdRiLRul
X4FE3PwXpCbp0AUikdtrH0stvt7ogsXYnzuDKyCgIKZwIcEOhFvkSVF2i2xtmTCI/Se7X7oZJGtq
lmfvyKWbKGJU6tdfRkjhgYCQkiR4g7pHUM9mGPphX7SNAQe3YbgN4oDeQEVreEiRNTIAbyU6qK9l
w5LJNm4WfDaolb9NlglFUguc566v0oM95NhXI4odk8N21FYmXE+Mi4Kl+kOyyfHUWaJI8v7R+TkJ
8HN69FIXTk80KsbR63SVWj1NWJjXFaJxCloUF5lOnGbyF//ViuHp1sEhVq9ZteNu+qAJszoUowas
e9kwn0ZvJBd1YwWC7HcAGJC0UoxBldgodZeWLxjZHzZvZJDRhv0zM6/nlunb/KvbS19BxBg0P7Ej
Dh/7Ucw3OpNex6G9Pp4jlhtUS0yo4cxX74VAKqKkBQXCw32i6RbHxSOOCwXBaqDXq26x549WgktU
vK6+FzM7SLKAyeSP6/aULP+/+E17xndL95kfZ1XVCZkNvnPSZ5Dyf9r9nIa4V16vkSL0y2CgpCz8
zeCHjmPoehmmoOo0OjJxx9iKQWpEQUOsoKALD38bq4t3DBO9RIwfauddrBWPg3kbJkmU/vd8h8gW
iPjBW1qmCycVhGUTTFHBEUeIl9yniIg2UxXXh5ZUFcLdkG8sct4Xd1i+ImOQrw33yEMaFcxNSTn1
RdrL/DWratjWaeTdLl3QX+pXlPtiOsj0PjOyUDbXAsRuJ7Z/0bhrRODie3XAzodb0LLfTCw+wV97
QXJ04zEKzCxoT1P44Dt6rxfa8ogG69HTzBf83xiibtDLfWOelCBeKF2h7BFRnkoyhyeycAnvlb15
FaVQpEbS8wY+hTvc4I1OjEEFaq87Zqry3Z0qz1woHIg7DG9CwxzfOmAXVQNySpjlM6O12lOIWgHs
qQ7I8GtPYv6zO9YUUvhm/2N57JY6TkTHHMKdCjhkfJqAmZdWxymXThRoH1pq1+x85JncZ6v76HQE
6Pg5coMPKxj9Y5YA0prJuVM0wWSeYDmKpiZuqxN7HclKwf66SBKQ8bwYo9XnIrTkh/097TW7jydY
aaLNj97/UsBEwNF5oXIkF+K+/06+ng07CU1vPBxziVScfM8myIpo1pZQka9qrE4RNXg4hNDTuoyA
RyvoZvyShEHQ0CLNy66JWL/fr1i/2LDhZgAjnGUO7KV+HkYiX3uzf0lLkqMARNzr+b29Rhj0fLFV
wXGuqvzTnIRLgIvGovM8AuecveLAVkBQZUncDhLgDQMHueg+zTLuAnHWhsoZ5UlmKrfB1bypVHve
PxxeYGPGLxFfpp6cV/1AeM3p0Sh2E9693dJQAtn1O2WSoW92oBq/Q4vh4B0xNCIjW2cDDhfItXdg
uIz0UWSqeJONQK4B81FHji8he1Eh494IJe9IE0ZtZRevxjZndQfhM2AmWljq2l3ROr72IFrCVjnC
nyOxH0G7Fvqi1Tg9aHEcMj10G9t8EAxJjcKb4Lsa+U6VwoM8W7awdTn18bJCg1/GgLPFlH15PYCa
ypzuQpeJkht5yn3TbIRlRbiyPdMwZkAPcHzceE0FAjEjDaXjQB4DUZb/RzWPxMvcD/6UFuh+vp7F
mJve2vXbLBo+XTwmAqTpvaXiEc/Z8UzLt4b7AAobNZJR1GTOlh10DJmfk1lSM9Ls5DFyIxobVekr
QSIc837d28rcAYvgf7e5tHcAVJY15HZYNJQuELnYEI5amwTM/8AKRAxzzy05i/UJuddlCmdv/BQQ
98bMVO0+7rYbbRxIpkC3pUBIdgG3I5tSpA4GTdGcRZ7Bpq+LurCFk8koFyy92vYV7ysoBuTkyQC0
8A4z5/svSWhMXbX5afZ7QLCKuzrrbCgisCrT72SBUoURGi9lhpVVOUALCoOlXFo3dMW/LNBSpKJQ
gd6CSTMCpNYA6x0qtQJVgkkr51B18SsPdAzxaZxIfJwjTx2dSUdo6iysSy9ErYBaVsN15xFjwNK8
Ov96a1/JXaEGmjBO7dscheVhx+BUzZXpUmekop/Ig34Xdepg3Bym0r0RyLH3Fiwp8pm4V2Ga2BiP
M2ygMOrW20pybAQdphkLsWU0NeKUOgvKlXGwPSQVUBYm2Bc4CB3dqTSHqHWtpf/nnX+6h//TjJD4
GF0xvjBKbCDXP2yBCDuC+CZqV6ocIfHkUJvzIDmkz60ZWlWlzhewI0Cr0WdFiJy5F4wSjH0hgVag
jKgBw/fD2Pmip9YG8HmigRC9X1TJuDGAhhvQugXVOT8NOgrar4AVxz4fDXeZ1s2W2tQiIyYazbaa
rQf2xKFdjHmVIbefBKiJ6pVac4yxkbxAc2t/dZX2eIUppbfUTXdDUpHvpsa8krNKmnHcaIjjf0Q3
COuOVhQFRSPjRyV8O2DMm8KqAxJ3uQqNFe1l33zvxqxrNtHzC7uJtc+XgUyR9ag23QBLeebppwDA
S0OgR+y+1bEplQlmo5uX4y86iY3A4ptgBjdiV3L6hTDGiPLFdepP0RB+gH0HKzNh1+w/gdEEP0bz
GEEwmUn4oa4FwhhbJnH7BvevmNkHLd/mzhKLaPtJo2GSrpheu7TfyvjnVVrvUgrEyZlNY4UZ5S1t
TNi41JJQOkBtXlbS3MqT8J/UJTObIQX5QI0zA9GVGwTLf/sshWS4M+LjnmarQOgdg/IXFzPX2uXF
KsnMeCMSZDaZX8KtfKqg3Tzlu6LGrML8dO3jLP5S3ni26/dtxwPpxt4CjNWmCEviXSY3kQk3Zirk
177YnAoCxEEQnHp7nX9/4WSXQqdbzDXEofiqozJOTtKGtL4UdfE7gMTtULPo7O4rWDTjOqo+Yhdu
kSnJza5SJUDrQ0AExweQIO4qREl9O6ogAqaVUJSAburp1oSzshO+hRhJmbxrVUO4et2fYYDSd4RV
MaP1jhEl2R5Ba6I5Z22mBYaTkYTyEIkRlQ9V4U1kYxQRuE4f7PVjIwcf0Gh+Tg/HpRJNsSD+ozSh
hBdMjm/4R9QpI38t//X0VNXlDHLxFhlynDZQ0ldezZ1ghpRhJUjr4gRJ5cIxDFd0sHBTlagQ+sDv
PoNtN/H9kArRHHenBCAIUzpS9992Ax+0Lho4YT5ZPWajccNSFQrxwDOQGHnSxptSELsan/gXmftb
Oh+2jzHYG07Q+VnFf3gLApg/J8MYd+ebtbLbfX2wvhrYejzEh3DsZeKzaq4rjBiSwL8bhBHXDxzW
N2csQ26+m92nAYXIWI5/2dbIcEKVrdFb6/iXHU9hAxnTbXNhlTekTlyVhqq3y28IshLGDZ5fZgO0
zGqON0la0Kcc6gfJrp4ZHpo7/Cijg58BuL0RNa36dOyWQINqMEINRoflFT/yfRik8wbLMSVHeOIZ
amDADu3nHxCtxxvCW+UZxZtEHppvCxZ0dA+4AgtsWuDowtTlLm2HimwFu/naoXwMWAOR45PAqSZx
HiIpwgc5AF1g/sWY8Dr14lHr5Ri1MZq3o/JhJYGJy/CjICBLKmzJsJOwEUAFQoulh04rad7s0btt
B48BOPPJtbcCQlMwitV8cCajh98ilvrkRaJiNVJ/AK/tcp9SBQg6EQ1eAwUUDJXsGQum/iQWuutu
zMaeVXsFsePKHAlO4zpBjveEMTjhd0TtRvP7BJe8cuh8DvZHnIZj794LyhTT/L9P8GSRDaUt8fFd
EyAOBHlqiJ3yioXeglqsl5w8mc5dXFs0gP5wac0FhsZOsSWjRdTVPi4ioWFVhblIndbf0OTvESl7
D3baIP+A2ra4f9FQJ2uHa+dhNRm+kXMCwcWNyhO/UgYarQcjk6YQ16qI6RBrESExTOyMLqQxFRcs
ILVPkNAilYRdXE5xds3N6SnJc8ASt/8TdCdaYSjR9RjHj41RBL06Lc+h3W7zWu3HWjS6IOdae9HZ
52CKsw2fZH/IMI91k+NVUKPgiRqDp5mctylEUtem0ktXemv12dnrOSfBgC+gWeTNfdY2SAAjAfMX
m/PvhvgCqhEDo81/ToYBh4TM/Z0VFsooQTKTEzL2qWzjBf0ZL9cTINBgCMvM4RyxQ7KKktTvt3i1
HqaC8+1de4/ZZX3CDnC+rwJiyyimojRuj512zUKlXOF2CgOp+h8Zi/Vxl85Ta6GVyGH+bOWkWUts
URmpSHW2KeZf3UfEjwuyVSRBd8YFZZ83SXx4oI4ahQo77zZeyFkqDDwonGwJN7hMioVTGjX1TlGX
OSsTK4mDgIvmQOQrsn0rVaYhl84R6dr6K8qzkREDjqZdKLDOaneIEkzMaUPDeuQN3IjlrwPofVTA
Q2QO2cbRfFWOjBDEnsDhfaKln3hHzv12gE4Q5YQqb9gCA4dKU5lITjY6NRdXISg0bmzZR0SUxEbJ
bx3XyPxsvZ56qq1xkCwPGz0X4a5rEmyJUYwQdKKbKqXwHeTl6PKbeK74yydSUmgBJGLgrQlMwWXS
10pxZpyEGjVjkAT5vbjRXVnYcPo8ud+8BeSxZiUhC5WfXLyURNv+547QOwZ+hVgc/67JvQKlonn0
t3RW4+4Ah6Qji40IGP2cBgU4NaEkTxH0i3ZNSXV+FwgsyZ2j56zwT7BaBii7tKZ8nBOYHO8GMfd6
etXEOHYCIA9m50J5xdcdO3AgZfRhSc1t/pKHK2QI5YOi5Lxo//9UhBN4A15V7ee/J9HAepXMaDrH
rnum2u8b7p9Pl9WuW8PreOCoT/NUQjSRVsrmzU++iZW40eNxmjkdtBd+aRYZfya65QVp7d/Oo9xU
0UJb3fPOb/0hyACQzrMNB+Sga/WTeqqz/Db5OQswrO5LG1t5r0NefXMDwUXJNNO7T3wUMW45Fw1J
DDVK3YVbn5VXToDnaZyQLSCVgSn9CIkJsZul90o2IdjANUpYNxrFUDwPA5LL8TdtYjYw3/UDZG9c
qn565vO7gu/ONnQBNAOZ0DkEmdBaRHLNWQpc8GVcf52GbeqV7Y1OJ5Z3vSWObtq22I1QJ8niXLTz
swz7UYo0MrucYNURX3Gkye9Uf1WZfsDYQ/Whgg/6dcxh97T9rsDlD5fVBWQ1hB0332RGYGfxSgQ3
BuoYkeJGs836Z+1uCUEdJsSlh2mG3j8fPYQpVmf6KlhhYU0w+HEDby/6xhuZ1tgCGVzn7imBM7Cf
sDXqkJ7KoDyAISf5DGZ2g3elNXXYtsnWg2y4mUKg9xlOoehOIq+/hHvo50aTzGwuAnu5oMAjAU+t
5mQ/kUrZxEb4v6UKI83IM+hQiCuShSqxJgMvmwNBMQdLpbIyMQFwL8Sy2sJY/uYZ6neDUxOEqWUB
g6bYBua75rbiyWM/ijNKC+wgF0QBrGG35BDnG7d1qCVdpOd4TdOl9tKcE0qDiEQNjwIteN38UXS1
r+kylWx0tvlYajDF5Cp9EsrszwWdLMVRV0ogWHVyD9CWvjDrvoWBeSJj6ULdDzq1DnN77VSa1T7S
rJSUU7C9wyRVATTcVsTWcAHHWlZcej0ufrdo0333bW8CLtCS5da3x43T5ALOS2DWOf6MV5JN6q3W
dMJ5DN3Cb7njaVBxdcP2AoXxBEPJGZIWEg5bSw+kkMtyDqie7ULQuwXIYkmnyRxQ9JDSV89owXU+
SsfCq8aBulHjhqdtTdGIPKs/9AKaPUi7NfbO2AiP6p25AtPxf3VaN2VT4Xw3zJ+KMGLSSRlSqBnl
ATJstzlLBbiZQT7Zzm9OFEJNxEByJgYzv3TX4n6hH4IUdO6vVOo8By5g9QaElQYfod/bxH4SwU+l
vcmEHIWh5bMv2+dZUlW3zknAZPQ3i2L04iiGsn+846Yk5cZ6yhshSlzdWxHkpJ9fn06Yeb0IjoUw
eM2gjayZe/SJb8xaSO9rRKo7yKP7mtNuJeGaFLg2XjR7MwfobU61kDl0XFa3wGqUyQetagufKQhp
rVzReWczGCG7mZtPO+dc6aIXj4MmnoyisXg5oTyo6g5uq0lV8BYasnyWGBESxsSlFCXo8+r70cbX
VjTVmpHZl4Wlzrsv5YLhz6nJn0ubifu+XmWEH3h/Dhbp/I4GQPNBByQTEFxAztwGLs0YkLcKDh5M
Z5R+UZ7CAgBlWSTzrlBhHM86pDxuAesxDWTTyatpdbd3VBvzTQOhtlrkq0yvm7wihm2phCatUt1Z
iPm0WlyMbcDLlNHAoda5JTsQ88tHIFHuLBWnCBoH0bWInAXfZD9Q8+xl0zEplR4/hvXOb2P8FMcK
Rx9NyO5ufE5eetTsFWEbofinJCObHU0iTqVwELiVdVWZEjlQ/UViJ3NhqzGyW2DEUYaHOI0N2iKq
HJD+B/1tToDsHE3A7Y40MTCBf+yhVMmnPDZSq2VF1dURidFl7+yfyv0Lxo+j0L0LSY2a03245k27
xKW5mdlX2/D2kBQ8N0QN8Ygpo9PFF7DLmz63qSk9A5nq3BNQBIX8znL1o0ceoDaoYhQSNDoLCtU7
FqbriHIZvLPpHr1H8hYjIOjjfpkFq9EQ76nbrzYzIRTi9HdI6/Y4nFuAKlW5ApyV/8OuSiat/Rk9
Ipe0wD7aZ0TpLm3dsnEzVa4vCDM9Q68zDMhy+PgJ3EFM5s9tXRbmRVW3cGgxz/30eYm1wZBIgxcx
EBKMDnFgpyZyaNNH3GyEnb1ooXJZkUkkFJHCeDGigzOjcDUaf8f5nVncvWBxOZzq3wlN/4tOOXDE
A61K+cnT3QP6UEX/YDJx2QPaizgbejUeWCO0/9RpROkDbcMbyB2iZABWmjh6zAzmMPrH4dcdzneH
KD1SDNBFvoCPRRPr1hgyVFNweufBRijYsE9dOHqjXeKXhkxXqDnoFJp1+evn1ixWp8TlJZrpJV8G
FqhWJ5koLuLVLo4BZ0dLWp2JeFTKctJleDjjYRO6WQe6KQm5MxQrH98z/QOdd37C5qFYxM/W792h
b4XJ28jnuxe3lTCg1lEz8TXsqRdPPVd9xrzZhw6TCXCzJD1OEddFiNAEXjyGkq+MP4jayQiRof5h
eKa46Fy3HfQ0w3CWMySw6hrV2Ja9JLi6YhIKqW9pFx1g3mESHv+ULeTel9wZ9c4tWR6fvkwR9dV6
t8Ok1AfseaZ3Kp5ngwddRQnLhbsuT4OakvTIoktlu9INKChztKuOy5ZfyGLsyrOrSuqN+hqCv/jy
649dZHqSSwIwXglou3rDlpYJVji0ifdJOs/AgcRUD9WTSVhj4EIgbJEwmwfbz6a3Cp1tg3cIL/7+
FDXbtz6HNZlOZpSL1Dc+Sa+3jsqxPIdND2g3Qf82+5HtoYQrif+UUQr24LHdDJ09o5Z6MRLfdJKL
gnt9H3x7kKIMI2x5w0SWRanDAG5+4KbgC8XUTGPwTlkTauV4toI0YM0xEeMvNO2YdDgNcAPmBYcU
l6wM+215Q4VEyWea2fzAIg7pM+E0pmtjJTScHJhHzgkbXJi0YeJOkRPUSEC/KyYwD6fEj/mnZSSO
FBhn59r+g47ONhK7FeZy7cV16pGf1E8Pst+mpI2WYW+2XA/DptC9mYmjPMVi+mdZI3Zd8VFe8+C4
ElFlS3oabiDzZ0MSBgEVNJdrsNfsD0UOsfAuPmc72sDrE8T9M6l2FGZz3JE0YuRjQbLU6dWKHo9Y
rtQSm2zZeyx6u5+XeT/PnIRly/+NTsYpkfB6NYWrVEE3Eew5ro31E2IuE5JXf9ImIzoowzyzLEEQ
25sts5o6UqLsJxyCpI43JB15HxLBFPbMNxkcLMwOSCKAmQEAvXzpeCPjboXXJvkZ9iaBHB2Ykxmm
zq2i62G56DLtawFA5WrOuxPRzlGUD+uVY0DGrI7SzjXBulg7uZsBcFBxI7OU1/JQjRkCIC4kk08l
wertUMipB425LpyJ8czbNu+rKl9ppu+4U5y1wbb3ZqdpSxn1vNQr0nxr4BxtNa9I9nxQkXvkGsuq
S86ZoVIC9uWDimfiZ69uTocCcmUC1eSfODkcsJTB58iXsZRiQcBeW9xyho0aLZ/HdY/hK8TjTADb
eDxGJaLaCXB4q8EULczbpCYzr9ap6K8AnDCG9nM6aCClV1oiMR2/4kCwwXj3BLasRm2ClvlUBU73
9+Ii1GSmNfaM/26CQxhQ7mwyXn53rEqyg03+eYixajg4FseFqjIsRW1xprWn4vLvcM5DtIJPg/Pt
CptGukXu0HL4DmzohxW8weEL8d+DsRvY/nKX/+jxUWIKdczNj83m0UsP23urMWJOmLX/PeKO82a9
xNC0Zk7j+eP2Y4h4Xi4wQkmsSsieMtYI86uiXzWr8YrSPUt5aRN7zPc/ta2iQF9WjbCIjWNhIbdA
1zGuIzu3XXEsVbbZjNCoRymM2RB0zc8gSnur1JwzSr8YsltWcqGq1gaQcy3J+ChTGhboVgSFBQ1K
w0jNiz/+iWsHA2tOW6s6J6CJVkdAgViufuLDdYoC0pgdvC3zWABZlP1i9JfKRV4lS8DEl2diJt0v
FnoR2k8F7Iz9e8wXKhtWN+ByqczGRZChbtj1xs1CWZJ7Z6J9HBuIkuDh8bfT3/ECIg0ft1ITxsmo
kGp1UWT4Kc9TwLohVTQAY66ugfnW4C6fqKVWPD5NQqDLi42Rl2vc5f+cuYuMD2dLVCKBH+T0EOpc
JWA9WBTlazWBQa0gVM7OAexUus3OvhRbdlky
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
