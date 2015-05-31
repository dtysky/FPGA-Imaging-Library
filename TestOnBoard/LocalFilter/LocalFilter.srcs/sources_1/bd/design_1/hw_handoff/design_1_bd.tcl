
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set I2C_SCLK [ create_bd_port -dir O I2C_SCLK ]
  set I2C_SDAT [ create_bd_port -dir IO I2C_SDAT ]
  set clk_in1 [ create_bd_port -dir I -type clk clk_in1 ]
  set d [ create_bd_port -dir I -from 7 -to 0 d ]
  set href [ create_bd_port -dir I href ]
  set pclk [ create_bd_port -dir I pclk ]
  set vga_blue [ create_bd_port -dir O -from 4 -to 0 vga_blue ]
  set vga_green [ create_bd_port -dir O -from 5 -to 0 vga_green ]
  set vga_hsync [ create_bd_port -dir O vga_hsync ]
  set vga_red [ create_bd_port -dir O -from 4 -to 0 vga_red ]
  set vga_vsync [ create_bd_port -dir O vga_vsync ]
  set vsync [ create_bd_port -dir I vsync ]
  set xclk [ create_bd_port -dir O xclk ]

  # Create instance: BoardInit_AXI_0, and set properties
  set BoardInit_AXI_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:BoardInit_AXI:1.0 BoardInit_AXI_0 ]
  set_property -dict [ list CONFIG.window_width {3}  ] $BoardInit_AXI_0

  # Create instance: Bram8x320x240_0, and set properties
  set Bram8x320x240_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:Bram8x320x240:1.0 Bram8x320x240_0 ]

  # Create instance: Bram8x320x240_1, and set properties
  set Bram8x320x240_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:Bram8x320x240:1.0 Bram8x320x240_1 ]

  # Create instance: ColorBin2Channels_0, and set properties
  set ColorBin2Channels_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorBin2Channels:1.0 ColorBin2Channels_0 ]
  set_property -dict [ list CONFIG.color_channels {1}  ] $ColorBin2Channels_0

  # Create instance: ColorBin2Channels_1, and set properties
  set ColorBin2Channels_1 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorBin2Channels:1.0 ColorBin2Channels_1 ]
  set_property -dict [ list CONFIG.color_channels {1}  ] $ColorBin2Channels_1

  # Create instance: ColorGray2Channels_0, and set properties
  set ColorGray2Channels_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorGray2Channels:1.0 ColorGray2Channels_0 ]

  # Create instance: ColorRGB16toRGB24_0, and set properties
  set ColorRGB16toRGB24_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorRGB16toRGB24:1.0 ColorRGB16toRGB24_0 ]

  # Create instance: ColorRGB24toVGA_0, and set properties
  set ColorRGB24toVGA_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorRGB24toVGA:1.0 ColorRGB24toVGA_0 ]

  # Create instance: ColorReversal_0, and set properties
  set ColorReversal_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorReversal:1.0 ColorReversal_0 ]
  set_property -dict [ list CONFIG.color_channels {1} CONFIG.color_width {1}  ] $ColorReversal_0

  # Create instance: DataCombin2_0, and set properties
  set DataCombin2_0 [ create_bd_cell -type ip -vlnv dtysky:User:DataCombin2:1.0 DataCombin2_0 ]

  # Create instance: DataDelay_0, and set properties
  set DataDelay_0 [ create_bd_cell -type ip -vlnv dtysky:Image:DataDelay:1.0 DataDelay_0 ]
  set_property -dict [ list CONFIG.data_width {17} CONFIG.delay {5}  ] $DataDelay_0

  # Create instance: DataDelay_1, and set properties
  set DataDelay_1 [ create_bd_cell -type ip -vlnv dtysky:Image:DataDelay:1.0 DataDelay_1 ]
  set_property -dict [ list CONFIG.data_width {1} CONFIG.delay {5}  ] $DataDelay_1

  # Create instance: DataSplit4_0, and set properties
  set DataSplit4_0 [ create_bd_cell -type ip -vlnv dtysky:User:DataSplit4:1.0 DataSplit4_0 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $DataSplit4_0

  # Create instance: ErosionDilationBin_0, and set properties
  set ErosionDilationBin_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ErosionDilationBin:1.0 ErosionDilationBin_0 ]

  # Create instance: FrameController_0, and set properties
  set FrameController_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:FrameController:1.0 FrameController_0 ]
  set_property -dict [ list CONFIG.wr_mode {1}  ] $FrameController_0

  # Create instance: FrameController_1, and set properties
  set FrameController_1 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:FrameController:1.0 FrameController_1 ]
  set_property -dict [ list CONFIG.row_init {1} CONFIG.wr_mode {0}  ] $FrameController_1

  # Create instance: Graying_0, and set properties
  set Graying_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Graying:1.0 Graying_0 ]

  # Create instance: IICctrl_0, and set properties
  set IICctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:IICctrl:1.0 IICctrl_0 ]

  # Create instance: MeanFilter_0, and set properties
  set MeanFilter_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:MeanFilter:1.0 MeanFilter_0 ]

  # Create instance: Mux2_0, and set properties
  set Mux2_0 [ create_bd_cell -type ip -vlnv dtysky:user:Mux2:1.0 Mux2_0 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $Mux2_0

  # Create instance: Mux2_1, and set properties
  set Mux2_1 [ create_bd_cell -type ip -vlnv dtysky:user:Mux2:1.0 Mux2_1 ]

  # Create instance: Mux4_0, and set properties
  set Mux4_0 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_0 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $Mux4_0

  # Create instance: Mux4_1, and set properties
  set Mux4_1 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_1 ]

  # Create instance: RankFifter_0, and set properties
  set RankFifter_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:RankFifter:1.0 RankFifter_0 ]
  set_property -dict [ list CONFIG.window_width {3}  ] $RankFifter_0

  # Create instance: RowsGenerator_0, and set properties
  set RowsGenerator_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:RowsGenerator:1.0 RowsGenerator_0 ]

  # Create instance: RowsGenerator_1, and set properties
  set RowsGenerator_1 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:RowsGenerator:1.0 RowsGenerator_1 ]
  set_property -dict [ list CONFIG.color_width {1}  ] $RowsGenerator_1

  # Create instance: ThresholdLocal_0, and set properties
  set ThresholdLocal_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ThresholdLocal:1.0 ThresholdLocal_0 ]
  set_property -dict [ list CONFIG.in_window_width {3}  ] $ThresholdLocal_0

  # Create instance: VGA640x480_0, and set properties
  set VGA640x480_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:VGA640x480:1.0 VGA640x480_0 ]

  # Create instance: WindowGenerator_0, and set properties
  set WindowGenerator_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:WindowGenerator:1.0 WindowGenerator_0 ]
  set_property -dict [ list CONFIG.window_width {3}  ] $WindowGenerator_0

  # Create instance: WindowGenerator_1, and set properties
  set WindowGenerator_1 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:WindowGenerator:1.0 WindowGenerator_1 ]
  set_property -dict [ list CONFIG.color_width {1} CONFIG.window_width {3}  ] $WindowGenerator_1

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list CONFIG.NUM_MI {1}  ] $axi_interconnect_0

  # Create instance: camCap_0, and set properties
  set camCap_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:camCap:1.0 camCap_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_JITTER {175.402} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25} CONFIG.CLKOUT2_JITTER {175.402} CONFIG.CLKOUT2_PHASE_ERROR {98.575} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25} CONFIG.CLKOUT2_USED {true} CONFIG.CLKOUT3_JITTER {151.636} CONFIG.CLKOUT3_PHASE_ERROR {98.575} CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50} CONFIG.CLKOUT3_USED {true} CONFIG.CLKOUT4_JITTER {130.958} CONFIG.CLKOUT4_PHASE_ERROR {98.575} CONFIG.CLKOUT4_USED {true} CONFIG.NUM_OUT_CLKS {4} CONFIG.USE_RESET {false}  ] $clk_wiz_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50} CONFIG.PCW_EN_CLK0_PORT {0} CONFIG.PCW_UIPARAM_DDR_ENABLE {0}  ] $processing_system7_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins BoardInit_AXI_0/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net BoardInit_AXI_0_ed_mode [get_bd_pins BoardInit_AXI_0/ed_mode] [get_bd_pins ErosionDilationBin_0/mode]
  connect_bd_net -net BoardInit_AXI_0_ed_template [get_bd_pins BoardInit_AXI_0/ed_template] [get_bd_pins ErosionDilationBin_0/template]
  connect_bd_net -net BoardInit_AXI_0_rank [get_bd_pins BoardInit_AXI_0/rank] [get_bd_pins RankFifter_0/rank]
  connect_bd_net -net BoardInit_AXI_0_rst_all_n [get_bd_pins BoardInit_AXI_0/rst_all_n] [get_bd_pins ColorReversal_0/rst_n] [get_bd_pins ErosionDilationBin_0/rst_n] [get_bd_pins FrameController_0/in_enable] [get_bd_pins FrameController_0/rst_n] [get_bd_pins FrameController_1/rst_n] [get_bd_pins Graying_0/in_enable] [get_bd_pins Graying_0/rst_n] [get_bd_pins IICctrl_0/iRST_N] [get_bd_pins MeanFilter_0/rst_n] [get_bd_pins RankFifter_0/rst_n] [get_bd_pins RowsGenerator_0/rst_n] [get_bd_pins RowsGenerator_1/rst_n] [get_bd_pins ThresholdLocal_0/rst_n] [get_bd_pins VGA640x480_0/rst_n] [get_bd_pins WindowGenerator_0/rst_n] [get_bd_pins WindowGenerator_1/rst_n]
  connect_bd_net -net BoardInit_AXI_0_sels [get_bd_pins BoardInit_AXI_0/sels] [get_bd_pins DataSplit4_0/i]
  connect_bd_net -net Bram8x320x240_0_doutb [get_bd_pins Bram8x320x240_0/doutb] [get_bd_pins FrameController_0/in_data]
  connect_bd_net -net Bram8x320x240_1_doutb [get_bd_pins Bram8x320x240_1/doutb] [get_bd_pins ColorGray2Channels_0/gray]
  connect_bd_net -net ColorBin2Channels_0_channels [get_bd_pins ColorBin2Channels_0/channels] [get_bd_pins Mux4_1/i2]
  connect_bd_net -net ColorBin2Channels_1_channels [get_bd_pins ColorBin2Channels_1/channels] [get_bd_pins Mux4_1/i3]
  connect_bd_net -net ColorGray2Channels_0_channels [get_bd_pins ColorGray2Channels_0/channels] [get_bd_pins ColorRGB24toVGA_0/rgb24]
  connect_bd_net -net ColorRGB16toRGB24_0_rgb24 [get_bd_pins ColorRGB16toRGB24_0/rgb24] [get_bd_pins Graying_0/in_data]
  connect_bd_net -net ColorRGB24toVGA_0_vga [get_bd_pins ColorRGB24toVGA_0/vga] [get_bd_pins VGA640x480_0/in_data]
  connect_bd_net -net ColorReversal_0_out_data [get_bd_pins ColorBin2Channels_0/b] [get_bd_pins ColorReversal_0/out_data] [get_bd_pins RowsGenerator_1/in_data]
  connect_bd_net -net ColorReversal_0_out_ready [get_bd_pins ColorReversal_0/out_ready] [get_bd_pins Mux4_0/i2] [get_bd_pins RowsGenerator_1/in_enable]
  connect_bd_net -net DataCombin2_0_o [get_bd_pins DataCombin2_0/o] [get_bd_pins Mux4_0/sel] [get_bd_pins Mux4_1/sel]
  connect_bd_net -net DataDelay_0_out_data [get_bd_pins Bram8x320x240_0/addra] [get_bd_pins DataDelay_0/out_data]
  connect_bd_net -net DataDelay_1_out_data [get_bd_pins Bram8x320x240_0/wea] [get_bd_pins DataDelay_1/out_data]
  connect_bd_net -net DataSplit4_0_o0 [get_bd_pins DataSplit4_0/o0] [get_bd_pins Mux2_0/sel] [get_bd_pins Mux2_1/sel]
  connect_bd_net -net DataSplit4_0_o1 [get_bd_pins DataCombin2_0/i0] [get_bd_pins DataSplit4_0/o1]
  connect_bd_net -net DataSplit4_0_o2 [get_bd_pins DataCombin2_0/i1] [get_bd_pins DataSplit4_0/o2]
  connect_bd_net -net ErosionDilationBin_0_out_data [get_bd_pins ColorBin2Channels_1/b] [get_bd_pins ErosionDilationBin_0/out_data]
  connect_bd_net -net ErosionDilationBin_0_out_ready [get_bd_pins ErosionDilationBin_0/out_ready] [get_bd_pins Mux4_0/i3]
  connect_bd_net -net FrameController_0_out_data [get_bd_pins FrameController_0/out_data] [get_bd_pins RowsGenerator_0/in_data]
  connect_bd_net -net FrameController_0_out_ready [get_bd_pins FrameController_0/out_ready] [get_bd_pins RowsGenerator_0/in_enable]
  connect_bd_net -net FrameController_0_ram_addr [get_bd_pins Bram8x320x240_0/addrb] [get_bd_pins FrameController_0/ram_addr]
  connect_bd_net -net FrameController_1_out_data [get_bd_pins Bram8x320x240_1/dina] [get_bd_pins FrameController_1/out_data]
  connect_bd_net -net FrameController_1_out_ready [get_bd_pins Bram8x320x240_1/wea] [get_bd_pins FrameController_1/out_ready]
  connect_bd_net -net FrameController_1_ram_addr [get_bd_pins Bram8x320x240_1/addra] [get_bd_pins FrameController_1/ram_addr]
  connect_bd_net -net Graying_0_out_data [get_bd_pins Bram8x320x240_0/dina] [get_bd_pins Graying_0/out_data]
  connect_bd_net -net IICctrl_0_I2C_SCLK [get_bd_ports I2C_SCLK] [get_bd_pins IICctrl_0/I2C_SCLK]
  connect_bd_net -net MeanFilter_0_out_data [get_bd_pins MeanFilter_0/out_data] [get_bd_pins Mux2_1/i0] [get_bd_pins Mux4_1/i0]
  connect_bd_net -net MeanFilter_0_out_ready [get_bd_pins MeanFilter_0/out_ready] [get_bd_pins Mux2_0/i0] [get_bd_pins Mux4_0/i0]
  connect_bd_net -net Mux2_0_o [get_bd_pins Mux2_0/o] [get_bd_pins ThresholdLocal_0/ref_enable]
  connect_bd_net -net Mux2_1_o [get_bd_pins Mux2_1/o] [get_bd_pins ThresholdLocal_0/ref_data]
  connect_bd_net -net Mux4_0_o [get_bd_pins FrameController_1/in_enable] [get_bd_pins Mux4_0/o]
  connect_bd_net -net Mux4_1_o [get_bd_pins FrameController_1/in_data] [get_bd_pins Mux4_1/o]
  connect_bd_net -net Net [get_bd_ports I2C_SDAT] [get_bd_pins IICctrl_0/I2C_SDAT]
  connect_bd_net -net RankFifter_0_out_data [get_bd_pins Mux2_1/i1] [get_bd_pins Mux4_1/i1] [get_bd_pins RankFifter_0/out_data]
  connect_bd_net -net RankFifter_0_out_ready [get_bd_pins Mux2_0/i1] [get_bd_pins Mux4_0/i1] [get_bd_pins RankFifter_0/out_ready]
  connect_bd_net -net RowsGenerator_0_out_data [get_bd_pins RowsGenerator_0/out_data] [get_bd_pins WindowGenerator_0/in_data]
  connect_bd_net -net RowsGenerator_0_out_ready [get_bd_pins RowsGenerator_0/out_ready] [get_bd_pins WindowGenerator_0/in_enable]
  connect_bd_net -net RowsGenerator_1_out_data [get_bd_pins RowsGenerator_1/out_data] [get_bd_pins WindowGenerator_1/in_data]
  connect_bd_net -net RowsGenerator_1_out_ready [get_bd_pins RowsGenerator_1/out_ready] [get_bd_pins WindowGenerator_1/in_enable]
  connect_bd_net -net ThresholdLocal_0_out_data [get_bd_pins ColorReversal_0/in_data] [get_bd_pins ThresholdLocal_0/out_data]
  connect_bd_net -net ThresholdLocal_0_out_ready [get_bd_pins ColorReversal_0/in_enable] [get_bd_pins ThresholdLocal_0/out_ready]
  connect_bd_net -net VGA640x480_0_frame_addr [get_bd_pins Bram8x320x240_1/addrb] [get_bd_pins VGA640x480_0/frame_addr]
  connect_bd_net -net VGA640x480_0_vga_blue [get_bd_ports vga_blue] [get_bd_pins VGA640x480_0/vga_blue]
  connect_bd_net -net VGA640x480_0_vga_green [get_bd_ports vga_green] [get_bd_pins VGA640x480_0/vga_green]
  connect_bd_net -net VGA640x480_0_vga_hsync [get_bd_ports vga_hsync] [get_bd_pins VGA640x480_0/vga_hsync]
  connect_bd_net -net VGA640x480_0_vga_red [get_bd_ports vga_red] [get_bd_pins VGA640x480_0/vga_red]
  connect_bd_net -net VGA640x480_0_vga_vsync [get_bd_ports vga_vsync] [get_bd_pins VGA640x480_0/vga_vsync]
  connect_bd_net -net WindowGenerator_0_out_data [get_bd_pins MeanFilter_0/in_data] [get_bd_pins RankFifter_0/in_data] [get_bd_pins ThresholdLocal_0/in_data] [get_bd_pins WindowGenerator_0/out_data]
  connect_bd_net -net WindowGenerator_0_out_ready [get_bd_pins MeanFilter_0/in_enable] [get_bd_pins RankFifter_0/in_enable] [get_bd_pins ThresholdLocal_0/in_enable] [get_bd_pins WindowGenerator_0/out_ready]
  connect_bd_net -net WindowGenerator_1_out_data [get_bd_pins ErosionDilationBin_0/in_data] [get_bd_pins WindowGenerator_1/out_data]
  connect_bd_net -net WindowGenerator_1_out_ready [get_bd_pins ErosionDilationBin_0/in_enable] [get_bd_pins WindowGenerator_1/out_ready]
  connect_bd_net -net camCap_0_addr [get_bd_pins DataDelay_0/in_data] [get_bd_pins camCap_0/addr]
  connect_bd_net -net camCap_0_dout [get_bd_pins ColorRGB16toRGB24_0/rgb16] [get_bd_pins camCap_0/dout]
  connect_bd_net -net camCap_0_wclk [get_bd_pins Bram8x320x240_0/clka] [get_bd_pins DataDelay_0/clk] [get_bd_pins DataDelay_1/clk] [get_bd_pins Graying_0/clk] [get_bd_pins camCap_0/wclk]
  connect_bd_net -net camCap_0_we [get_bd_pins DataDelay_1/in_data] [get_bd_pins camCap_0/we]
  connect_bd_net -net clk_in1_1 [get_bd_ports clk_in1] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins Bram8x320x240_0/clkb] [get_bd_pins Bram8x320x240_1/clka] [get_bd_pins ColorReversal_0/clk] [get_bd_pins ErosionDilationBin_0/clk] [get_bd_pins FrameController_0/clk] [get_bd_pins FrameController_1/clk] [get_bd_pins MeanFilter_0/clk] [get_bd_pins RankFifter_0/clk] [get_bd_pins RowsGenerator_0/clk] [get_bd_pins RowsGenerator_1/clk] [get_bd_pins ThresholdLocal_0/clk] [get_bd_pins WindowGenerator_0/clk] [get_bd_pins WindowGenerator_1/clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports xclk] [get_bd_pins Bram8x320x240_1/clkb] [get_bd_pins IICctrl_0/iCLK] [get_bd_pins VGA640x480_0/clk_25m] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins BoardInit_AXI_0/s00_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins BoardInit_AXI_0/pll_locked] [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net d_1 [get_bd_ports d] [get_bd_pins camCap_0/d]
  connect_bd_net -net href_1 [get_bd_ports href] [get_bd_pins camCap_0/href]
  connect_bd_net -net pclk_1 [get_bd_ports pclk] [get_bd_pins camCap_0/pclk]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins BoardInit_AXI_0/rst_n] [get_bd_pins BoardInit_AXI_0/s00_axi_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net vsync_1 [get_bd_ports vsync] [get_bd_pins camCap_0/vsync]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs BoardInit_AXI_0/S00_AXI/S00_AXI_reg] SEG_BoardInit_AXI_0_S00_AXI_reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


