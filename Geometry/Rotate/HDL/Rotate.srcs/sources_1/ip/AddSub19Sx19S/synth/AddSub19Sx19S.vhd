-- (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:c_addsub:12.0
-- IP Revision: 5

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY c_addsub_v12_0;
USE c_addsub_v12_0.c_addsub_v12_0;

ENTITY AddSub19Sx19S IS
  PORT (
    A : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
    CLK : IN STD_LOGIC;
    S : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
  );
END AddSub19Sx19S;

ARCHITECTURE AddSub19Sx19S_arch OF AddSub19Sx19S IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF AddSub19Sx19S_arch: ARCHITECTURE IS "yes";

  COMPONENT c_addsub_v12_0 IS
    GENERIC (
      C_VERBOSITY : INTEGER;
      C_XDEVICEFAMILY : STRING;
      C_IMPLEMENTATION : INTEGER;
      C_A_WIDTH : INTEGER;
      C_B_WIDTH : INTEGER;
      C_OUT_WIDTH : INTEGER;
      C_CE_OVERRIDES_SCLR : INTEGER;
      C_A_TYPE : INTEGER;
      C_B_TYPE : INTEGER;
      C_LATENCY : INTEGER;
      C_ADD_MODE : INTEGER;
      C_B_CONSTANT : INTEGER;
      C_B_VALUE : STRING;
      C_AINIT_VAL : STRING;
      C_SINIT_VAL : STRING;
      C_CE_OVERRIDES_BYPASS : INTEGER;
      C_BYPASS_LOW : INTEGER;
      C_SCLR_OVERRIDES_SSET : INTEGER;
      C_HAS_C_IN : INTEGER;
      C_HAS_C_OUT : INTEGER;
      C_BORROW_LOW : INTEGER;
      C_HAS_CE : INTEGER;
      C_HAS_BYPASS : INTEGER;
      C_HAS_SCLR : INTEGER;
      C_HAS_SSET : INTEGER;
      C_HAS_SINIT : INTEGER
    );
    PORT (
      A : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
      B : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
      CLK : IN STD_LOGIC;
      ADD : IN STD_LOGIC;
      C_IN : IN STD_LOGIC;
      CE : IN STD_LOGIC;
      BYPASS : IN STD_LOGIC;
      SCLR : IN STD_LOGIC;
      SSET : IN STD_LOGIC;
      SINIT : IN STD_LOGIC;
      C_OUT : OUT STD_LOGIC;
      S : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
    );
  END COMPONENT c_addsub_v12_0;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF AddSub19Sx19S_arch: ARCHITECTURE IS "c_addsub_v12_0,Vivado 2014.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF AddSub19Sx19S_arch : ARCHITECTURE IS "AddSub19Sx19S,c_addsub_v12_0,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF AddSub19Sx19S_arch: ARCHITECTURE IS "AddSub19Sx19S,c_addsub_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=zynq,C_IMPLEMENTATION=0,C_A_WIDTH=19,C_B_WIDTH=19,C_OUT_WIDTH=19,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=0,C_B_TYPE=0,C_LATENCY=2,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=0000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF A: SIGNAL IS "xilinx.com:signal:data:1.0 a_intf DATA";
  ATTRIBUTE X_INTERFACE_INFO OF B: SIGNAL IS "xilinx.com:signal:data:1.0 b_intf DATA";
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 clk_intf CLK";
  ATTRIBUTE X_INTERFACE_INFO OF S: SIGNAL IS "xilinx.com:signal:data:1.0 s_intf DATA";
BEGIN
  U0 : c_addsub_v12_0
    GENERIC MAP (
      C_VERBOSITY => 0,
      C_XDEVICEFAMILY => "zynq",
      C_IMPLEMENTATION => 0,
      C_A_WIDTH => 19,
      C_B_WIDTH => 19,
      C_OUT_WIDTH => 19,
      C_CE_OVERRIDES_SCLR => 0,
      C_A_TYPE => 0,
      C_B_TYPE => 0,
      C_LATENCY => 2,
      C_ADD_MODE => 0,
      C_B_CONSTANT => 0,
      C_B_VALUE => "0000000000000000000",
      C_AINIT_VAL => "0",
      C_SINIT_VAL => "0",
      C_CE_OVERRIDES_BYPASS => 1,
      C_BYPASS_LOW => 0,
      C_SCLR_OVERRIDES_SSET => 1,
      C_HAS_C_IN => 0,
      C_HAS_C_OUT => 0,
      C_BORROW_LOW => 1,
      C_HAS_CE => 0,
      C_HAS_BYPASS => 0,
      C_HAS_SCLR => 0,
      C_HAS_SSET => 0,
      C_HAS_SINIT => 0
    )
    PORT MAP (
      A => A,
      B => B,
      CLK => CLK,
      ADD => '1',
      C_IN => '0',
      CE => '1',
      BYPASS => '0',
      SCLR => '0',
      SSET => '0',
      SINIT => '0',
      S => S
    );
END AddSub19Sx19S_arch;
