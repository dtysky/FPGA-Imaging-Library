-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Tue Apr 28 22:18:57 2015
-- Host        : Dtysky running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Rotate/HDL/Rotate.srcs/sources_1/ip/Multiplier18Sx17S/Multiplier18Sx17S_stub.vhdl
-- Design      : Multiplier18Sx17S
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier18Sx17S is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 17 downto 0 );
    B : in STD_LOGIC_VECTOR ( 16 downto 0 );
    P : out STD_LOGIC_VECTOR ( 34 downto 0 )
  );

end Multiplier18Sx17S;

architecture stub of Multiplier18Sx17S is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[17:0],B[16:0],P[34:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mult_gen_v12_0,Vivado 2014.4";
begin
end;
