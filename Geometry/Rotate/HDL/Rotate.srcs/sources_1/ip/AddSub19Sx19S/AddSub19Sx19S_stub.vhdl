-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Wed Apr 29 03:10:47 2015
-- Host        : Dtysky running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Rotate/HDL/Rotate.srcs/sources_1/ip/AddSub19Sx19S/AddSub19Sx19S_stub.vhdl
-- Design      : AddSub19Sx19S
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddSub19Sx19S is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 18 downto 0 );
    B : in STD_LOGIC_VECTOR ( 18 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 18 downto 0 )
  );

end AddSub19Sx19S;

architecture stub of AddSub19Sx19S is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[18:0],B[18:0],CLK,S[18:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_addsub_v12_0,Vivado 2014.4";
begin
end;
