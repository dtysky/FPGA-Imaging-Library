
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

  # Create instance: ColorGray2Channels_0, and set properties
  set ColorGray2Channels_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorGray2Channels:1.0 ColorGray2Channels_0 ]

  # Create instance: ColorRGB16toRGB24_0, and set properties
  set ColorRGB16toRGB24_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorRGB16toRGB24:1.0 ColorRGB16toRGB24_0 ]

  # Create instance: ColorRGB24toVGA_0, and set properties
  set ColorRGB24toVGA_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:ColorRGB24toVGA:1.0 ColorRGB24toVGA_0 ]

  # Create instance: CountGenerator_0, and set properties
  set CountGenerator_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:CountGenerator:1.0 CountGenerator_0 ]

  # Create instance: Crop_0, and set properties
  set Crop_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Crop:1.0 Crop_0 ]

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

  # Create instance: FrameController2_0, and set properties
  set FrameController2_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:FrameController2:1.0 FrameController2_0 ]
  set_property -dict [ list CONFIG.ram_read_latency {1}  ] $FrameController2_0

  # Create instance: FrameController2_1, and set properties
  set FrameController2_1 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:FrameController2:1.0 FrameController2_1 ]

  # Create instance: FrameController_0, and set properties
  set FrameController_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:FrameController:1.0 FrameController_0 ]
  set_property -dict [ list CONFIG.ram_read_latency {2} CONFIG.wr_mode {1}  ] $FrameController_0

  # Create instance: FrameController_1, and set properties
  set FrameController_1 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:FrameController:1.0 FrameController_1 ]
  set_property -dict [ list CONFIG.row_init {0} CONFIG.wr_mode {0}  ] $FrameController_1

  # Create instance: Graying_0, and set properties
  set Graying_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Graying:1.0 Graying_0 ]

  # Create instance: IICctrl_0, and set properties
  set IICctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:IICctrl:1.0 IICctrl_0 ]

  # Create instance: Mirror_0, and set properties
  set Mirror_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Mirror:1.0 Mirror_0 ]

  # Create instance: Mux2_0, and set properties
  set Mux2_0 [ create_bd_cell -type ip -vlnv dtysky:user:Mux2:1.0 Mux2_0 ]
  set_property -dict [ list CONFIG.data_width {17}  ] $Mux2_0

  # Create instance: Mux2_1, and set properties
  set Mux2_1 [ create_bd_cell -type ip -vlnv dtysky:user:Mux2:1.0 Mux2_1 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $Mux2_1

  # Create instance: Mux2_2, and set properties
  set Mux2_2 [ create_bd_cell -type ip -vlnv dtysky:user:Mux2:1.0 Mux2_2 ]
  set_property -dict [ list CONFIG.data_width {8}  ] $Mux2_2

  # Create instance: Mux2_3, and set properties
  set Mux2_3 [ create_bd_cell -type ip -vlnv dtysky:user:Mux2:1.0 Mux2_3 ]
  set_property -dict [ list CONFIG.data_width {17}  ] $Mux2_3

  # Create instance: Mux4_0, and set properties
  set Mux4_0 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_0 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $Mux4_0

  # Create instance: Mux4_1, and set properties
  set Mux4_1 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_1 ]
  set_property -dict [ list CONFIG.data_width {9}  ] $Mux4_1

  # Create instance: Mux4_2, and set properties
  set Mux4_2 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_2 ]
  set_property -dict [ list CONFIG.data_width {9}  ] $Mux4_2

  # Create instance: Mux4_3, and set properties
  set Mux4_3 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_3 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $Mux4_3

  # Create instance: Mux4_4, and set properties
  set Mux4_4 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_4 ]
  set_property -dict [ list CONFIG.data_width {8}  ] $Mux4_4

  # Create instance: Mux4_5, and set properties
  set Mux4_5 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_5 ]
  set_property -dict [ list CONFIG.data_width {9}  ] $Mux4_5

  # Create instance: Mux4_6, and set properties
  set Mux4_6 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_6 ]
  set_property -dict [ list CONFIG.data_width {9}  ] $Mux4_6

  # Create instance: Mux4_7, and set properties
  set Mux4_7 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_7 ]
  set_property -dict [ list CONFIG.data_width {1}  ] $Mux4_7

  # Create instance: Mux4_8, and set properties
  set Mux4_8 [ create_bd_cell -type ip -vlnv dtysky:Image:Mux4:1.0 Mux4_8 ]

  # Create instance: Pan_0, and set properties
  set Pan_0 [ create_bd_cell -type ip -vlnv dtysky:F-I-L:Pan:1.0 Pan_0 ]

  # Create instance: Rotate_0, and set properties
  set Rotate_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Rotate:1.0 Rotate_0 ]
  set_property -dict [ list CONFIG.ram_RL {6}  ] $Rotate_0

  # Create instance: Scale_0, and set properties
  set Scale_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Scale:1.0 Scale_0 ]
  set_property -dict [ list CONFIG.ram_RL {6}  ] $Scale_0

  # Create instance: Shear_0, and set properties
  set Shear_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:Shear:1.0 Shear_0 ]
  set_property -dict [ list CONFIG.ram_RL {6}  ] $Shear_0

  # Create instance: VGA640x480_0, and set properties
  set VGA640x480_0 [ create_bd_cell -type ip -vlnv dtysky.moe:F-I-L:VGA640x480:1.0 VGA640x480_0 ]

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
  connect_bd_net -net BoardInit_AXI_0_angle [get_bd_pins BoardInit_AXI_0/angle] [get_bd_pins Rotate_0/angle]
  connect_bd_net -net BoardInit_AXI_0_crop_bottom [get_bd_pins BoardInit_AXI_0/crop_bottom] [get_bd_pins Crop_0/bottom]
  connect_bd_net -net BoardInit_AXI_0_crop_left [get_bd_pins BoardInit_AXI_0/crop_left] [get_bd_pins Crop_0/left]
  connect_bd_net -net BoardInit_AXI_0_crop_right [get_bd_pins BoardInit_AXI_0/crop_right] [get_bd_pins Crop_0/right]
  connect_bd_net -net BoardInit_AXI_0_crop_top [get_bd_pins BoardInit_AXI_0/crop_top] [get_bd_pins Crop_0/top]
  connect_bd_net -net BoardInit_AXI_0_mirror_mode [get_bd_pins BoardInit_AXI_0/mirror_mode] [get_bd_pins Mirror_0/mode]
  connect_bd_net -net BoardInit_AXI_0_offset_x [get_bd_pins BoardInit_AXI_0/offset_x] [get_bd_pins Pan_0/offset_x]
  connect_bd_net -net BoardInit_AXI_0_offset_y [get_bd_pins BoardInit_AXI_0/offset_y] [get_bd_pins Pan_0/offset_y]
  connect_bd_net -net BoardInit_AXI_0_rst_all_n [get_bd_pins BoardInit_AXI_0/rst_all_n] [get_bd_pins CountGenerator_0/rst_n] [get_bd_pins Crop_0/rst_n] [get_bd_pins FrameController2_0/rst_n] [get_bd_pins FrameController2_1/rst_n] [get_bd_pins FrameController_0/in_enable] [get_bd_pins FrameController_0/rst_n] [get_bd_pins FrameController_1/rst_n] [get_bd_pins Graying_0/in_enable] [get_bd_pins Graying_0/rst_n] [get_bd_pins IICctrl_0/iRST_N] [get_bd_pins Mirror_0/rst_n] [get_bd_pins Pan_0/rst_n] [get_bd_pins Rotate_0/in_enable] [get_bd_pins Rotate_0/rst_n] [get_bd_pins Scale_0/in_enable] [get_bd_pins Scale_0/rst_n] [get_bd_pins Shear_0/in_enable] [get_bd_pins Shear_0/rst_n] [get_bd_pins VGA640x480_0/rst_n]
  connect_bd_net -net BoardInit_AXI_0_scale_x [get_bd_pins BoardInit_AXI_0/scale_x] [get_bd_pins Scale_0/scale_x]
  connect_bd_net -net BoardInit_AXI_0_scale_y [get_bd_pins BoardInit_AXI_0/scale_y] [get_bd_pins Scale_0/scale_y]
  connect_bd_net -net BoardInit_AXI_0_sels [get_bd_pins BoardInit_AXI_0/sels] [get_bd_pins DataSplit4_0/i]
  connect_bd_net -net BoardInit_AXI_0_sh_u [get_bd_pins BoardInit_AXI_0/sh_u] [get_bd_pins Shear_0/sh_u]
  connect_bd_net -net BoardInit_AXI_0_sh_v [get_bd_pins BoardInit_AXI_0/sh_v] [get_bd_pins Shear_0/sh_v]
  connect_bd_net -net Bram8x320x240_0_doutb [get_bd_pins Bram8x320x240_0/doutb] [get_bd_pins FrameController2_0/in_data] [get_bd_pins FrameController_0/in_data]
  connect_bd_net -net Bram8x320x240_1_doutb [get_bd_pins Bram8x320x240_1/doutb] [get_bd_pins ColorGray2Channels_0/gray]
  connect_bd_net -net ColorGray2Channels_0_channels [get_bd_pins ColorGray2Channels_0/channels] [get_bd_pins ColorRGB24toVGA_0/rgb24]
  connect_bd_net -net ColorRGB16toRGB24_0_rgb24 [get_bd_pins ColorRGB16toRGB24_0/rgb24] [get_bd_pins Graying_0/in_data]
  connect_bd_net -net ColorRGB24toVGA_0_vga [get_bd_pins ColorRGB24toVGA_0/vga] [get_bd_pins VGA640x480_0/in_data]
  connect_bd_net -net CountGenerator_0_count_x [get_bd_pins CountGenerator_0/count_x] [get_bd_pins Crop_0/in_count_x] [get_bd_pins Mirror_0/in_count_x] [get_bd_pins Pan_0/in_count_x]
  connect_bd_net -net CountGenerator_0_count_y [get_bd_pins CountGenerator_0/count_y] [get_bd_pins Crop_0/in_count_y] [get_bd_pins Mirror_0/in_count_y] [get_bd_pins Pan_0/in_count_y]
  connect_bd_net -net CountGenerator_0_out_data [get_bd_pins CountGenerator_0/out_data] [get_bd_pins Crop_0/in_data] [get_bd_pins Mirror_0/in_data] [get_bd_pins Pan_0/in_data]
  connect_bd_net -net CountGenerator_0_out_ready [get_bd_pins CountGenerator_0/out_ready] [get_bd_pins Crop_0/in_enable] [get_bd_pins Mirror_0/in_enable] [get_bd_pins Pan_0/in_enable]
  connect_bd_net -net Crop_0_out_count_x [get_bd_pins Crop_0/out_count_x] [get_bd_pins Mux4_5/i0]
  connect_bd_net -net Crop_0_out_count_y [get_bd_pins Crop_0/out_count_y] [get_bd_pins Mux4_6/i0]
  connect_bd_net -net Crop_0_out_data [get_bd_pins Crop_0/out_data] [get_bd_pins Mux4_4/i0]
  connect_bd_net -net Crop_0_out_ready [get_bd_pins Crop_0/out_ready] [get_bd_pins Mux4_3/i0]
  connect_bd_net -net DataCombin2_0_o [get_bd_pins DataCombin2_0/o] [get_bd_pins Mux4_0/sel] [get_bd_pins Mux4_1/sel] [get_bd_pins Mux4_2/sel] [get_bd_pins Mux4_3/sel] [get_bd_pins Mux4_4/sel] [get_bd_pins Mux4_5/sel] [get_bd_pins Mux4_6/sel] [get_bd_pins Mux4_7/sel] [get_bd_pins Mux4_8/sel]
  connect_bd_net -net DataDelay_0_out_data [get_bd_pins Bram8x320x240_0/addra] [get_bd_pins DataDelay_0/out_data]
  connect_bd_net -net DataDelay_1_out_data [get_bd_pins Bram8x320x240_0/wea] [get_bd_pins DataDelay_1/out_data]
  connect_bd_net -net DataSplit4_0_o0 [get_bd_pins DataCombin2_0/i0] [get_bd_pins DataSplit4_0/o0]
  connect_bd_net -net DataSplit4_0_o1 [get_bd_pins DataCombin2_0/i1] [get_bd_pins DataSplit4_0/o1]
  connect_bd_net -net DataSplit4_0_o2 [get_bd_pins DataSplit4_0/o2] [get_bd_pins Mux2_0/sel] [get_bd_pins Mux2_1/sel] [get_bd_pins Mux2_2/sel] [get_bd_pins Mux2_3/sel]
  connect_bd_net -net FrameController2_0_out_data [get_bd_pins FrameController2_0/out_data] [get_bd_pins Rotate_0/frame_in_data] [get_bd_pins Scale_0/frame_in_data] [get_bd_pins Shear_0/frame_in_data]
  connect_bd_net -net FrameController2_0_out_ready [get_bd_pins FrameController2_0/out_ready] [get_bd_pins Rotate_0/frame_in_ready] [get_bd_pins Scale_0/frame_in_ready] [get_bd_pins Shear_0/frame_in_ready]
  connect_bd_net -net FrameController2_0_ram_addr [get_bd_pins FrameController2_0/ram_addr] [get_bd_pins Mux2_0/i1]
  connect_bd_net -net FrameController2_1_out_data [get_bd_pins FrameController2_1/out_data] [get_bd_pins Mux2_2/i0]
  connect_bd_net -net FrameController2_1_out_ready [get_bd_pins FrameController2_1/out_ready] [get_bd_pins Mux2_1/i0]
  connect_bd_net -net FrameController2_1_ram_addr [get_bd_pins FrameController2_1/ram_addr] [get_bd_pins Mux2_3/i0]
  connect_bd_net -net FrameController_0_out_data [get_bd_pins CountGenerator_0/in_data] [get_bd_pins FrameController_0/out_data]
  connect_bd_net -net FrameController_0_out_ready [get_bd_pins CountGenerator_0/in_enable] [get_bd_pins FrameController_0/out_ready]
  connect_bd_net -net FrameController_0_ram_addr [get_bd_pins FrameController_0/ram_addr] [get_bd_pins Mux2_0/i0]
  connect_bd_net -net FrameController_1_out_data [get_bd_pins FrameController_1/out_data] [get_bd_pins Mux2_2/i1]
  connect_bd_net -net FrameController_1_out_ready [get_bd_pins FrameController_1/out_ready] [get_bd_pins Mux2_1/i1]
  connect_bd_net -net FrameController_1_ram_addr [get_bd_pins FrameController_1/ram_addr] [get_bd_pins Mux2_3/i1]
  connect_bd_net -net Graying_0_out_data [get_bd_pins Bram8x320x240_0/dina] [get_bd_pins Graying_0/out_data]
  connect_bd_net -net IICctrl_0_I2C_SCLK [get_bd_ports I2C_SCLK] [get_bd_pins IICctrl_0/I2C_SCLK]
  connect_bd_net -net Mirror_0_out_count_x [get_bd_pins Mirror_0/out_count_x] [get_bd_pins Mux4_5/i2] [get_bd_pins Mux4_5/i3]
  connect_bd_net -net Mirror_0_out_count_y [get_bd_pins Mirror_0/out_count_y] [get_bd_pins Mux4_6/i2] [get_bd_pins Mux4_6/i3]
  connect_bd_net -net Mirror_0_out_data [get_bd_pins Mirror_0/out_data] [get_bd_pins Mux4_4/i2] [get_bd_pins Mux4_4/i3]
  connect_bd_net -net Mirror_0_out_ready [get_bd_pins Mirror_0/out_ready] [get_bd_pins Mux4_3/i2] [get_bd_pins Mux4_3/i3]
  connect_bd_net -net Mux2_0_o [get_bd_pins Bram8x320x240_0/addrb] [get_bd_pins Mux2_0/o]
  connect_bd_net -net Mux2_1_o [get_bd_pins Bram8x320x240_1/wea] [get_bd_pins Mux2_1/o]
  connect_bd_net -net Mux2_2_o [get_bd_pins Bram8x320x240_1/dina] [get_bd_pins Mux2_2/o]
  connect_bd_net -net Mux2_3_o [get_bd_pins Bram8x320x240_1/addra] [get_bd_pins Mux2_3/o]
  connect_bd_net -net Mux4_0_o [get_bd_pins FrameController2_0/in_enable] [get_bd_pins Mux4_0/o]
  connect_bd_net -net Mux4_1_o [get_bd_pins FrameController2_0/in_count_x] [get_bd_pins Mux4_1/o]
  connect_bd_net -net Mux4_2_o [get_bd_pins FrameController2_0/in_count_y] [get_bd_pins Mux4_2/o]
  connect_bd_net -net Mux4_3_o [get_bd_pins FrameController2_1/in_enable] [get_bd_pins Mux4_3/o]
  connect_bd_net -net Mux4_4_o [get_bd_pins FrameController2_1/in_data] [get_bd_pins Mux4_4/o]
  connect_bd_net -net Mux4_5_o [get_bd_pins FrameController2_1/in_count_x] [get_bd_pins Mux4_5/o]
  connect_bd_net -net Mux4_6_o [get_bd_pins FrameController2_1/in_count_y] [get_bd_pins Mux4_6/o]
  connect_bd_net -net Mux4_7_o [get_bd_pins FrameController_1/in_enable] [get_bd_pins Mux4_7/o]
  connect_bd_net -net Mux4_8_o [get_bd_pins FrameController_1/in_data] [get_bd_pins Mux4_8/o]
  connect_bd_net -net Net [get_bd_ports I2C_SDAT] [get_bd_pins IICctrl_0/I2C_SDAT]
  connect_bd_net -net Pan_0_out_count_x [get_bd_pins Mux4_5/i1] [get_bd_pins Pan_0/out_count_x]
  connect_bd_net -net Pan_0_out_count_y [get_bd_pins Mux4_6/i1] [get_bd_pins Pan_0/out_count_y]
  connect_bd_net -net Pan_0_out_data [get_bd_pins Mux4_4/i1] [get_bd_pins Pan_0/out_data]
  connect_bd_net -net Pan_0_out_ready [get_bd_pins Mux4_3/i1] [get_bd_pins Pan_0/out_ready]
  connect_bd_net -net Rotate_0_frame_enable [get_bd_pins Mux4_0/i2] [get_bd_pins Mux4_0/i3] [get_bd_pins Rotate_0/frame_enable]
  connect_bd_net -net Rotate_0_frame_out_count_x [get_bd_pins Mux4_1/i2] [get_bd_pins Mux4_1/i3] [get_bd_pins Rotate_0/frame_out_count_x]
  connect_bd_net -net Rotate_0_frame_out_count_y [get_bd_pins Mux4_2/i2] [get_bd_pins Mux4_2/i3] [get_bd_pins Rotate_0/frame_out_count_y]
  connect_bd_net -net Rotate_0_out_data [get_bd_pins Mux4_8/i2] [get_bd_pins Mux4_8/i3] [get_bd_pins Rotate_0/out_data]
  connect_bd_net -net Rotate_0_out_ready [get_bd_pins Mux4_7/i2] [get_bd_pins Mux4_7/i3] [get_bd_pins Rotate_0/out_ready]
  connect_bd_net -net Scale_0_frame_enable [get_bd_pins Mux4_0/i0] [get_bd_pins Scale_0/frame_enable]
  connect_bd_net -net Scale_0_frame_out_count_x [get_bd_pins Mux4_1/i0] [get_bd_pins Scale_0/frame_out_count_x]
  connect_bd_net -net Scale_0_frame_out_count_y [get_bd_pins Mux4_2/i0] [get_bd_pins Scale_0/frame_out_count_y]
  connect_bd_net -net Scale_0_out_data [get_bd_pins Mux4_8/i0] [get_bd_pins Scale_0/out_data]
  connect_bd_net -net Scale_0_out_ready [get_bd_pins Mux4_7/i0] [get_bd_pins Scale_0/out_ready]
  connect_bd_net -net Shear_0_frame_enable [get_bd_pins Mux4_0/i1] [get_bd_pins Shear_0/frame_enable]
  connect_bd_net -net Shear_0_frame_out_count_x [get_bd_pins Mux4_1/i1] [get_bd_pins Shear_0/frame_out_count_x]
  connect_bd_net -net Shear_0_frame_out_count_y [get_bd_pins Mux4_2/i1] [get_bd_pins Shear_0/frame_out_count_y]
  connect_bd_net -net Shear_0_out_data [get_bd_pins Mux4_8/i1] [get_bd_pins Shear_0/out_data]
  connect_bd_net -net Shear_0_out_ready [get_bd_pins Mux4_7/i1] [get_bd_pins Shear_0/out_ready]
  connect_bd_net -net VGA640x480_0_frame_addr [get_bd_pins Bram8x320x240_1/addrb] [get_bd_pins VGA640x480_0/frame_addr]
  connect_bd_net -net VGA640x480_0_vga_blue [get_bd_ports vga_blue] [get_bd_pins VGA640x480_0/vga_blue]
  connect_bd_net -net VGA640x480_0_vga_green [get_bd_ports vga_green] [get_bd_pins VGA640x480_0/vga_green]
  connect_bd_net -net VGA640x480_0_vga_hsync [get_bd_ports vga_hsync] [get_bd_pins VGA640x480_0/vga_hsync]
  connect_bd_net -net VGA640x480_0_vga_red [get_bd_ports vga_red] [get_bd_pins VGA640x480_0/vga_red]
  connect_bd_net -net VGA640x480_0_vga_vsync [get_bd_ports vga_vsync] [get_bd_pins VGA640x480_0/vga_vsync]
  connect_bd_net -net camCap_0_addr [get_bd_pins DataDelay_0/in_data] [get_bd_pins camCap_0/addr]
  connect_bd_net -net camCap_0_dout [get_bd_pins ColorRGB16toRGB24_0/rgb16] [get_bd_pins camCap_0/dout]
  connect_bd_net -net camCap_0_wclk [get_bd_pins Bram8x320x240_0/clka] [get_bd_pins DataDelay_0/clk] [get_bd_pins DataDelay_1/clk] [get_bd_pins Graying_0/clk] [get_bd_pins camCap_0/wclk]
  connect_bd_net -net camCap_0_we [get_bd_pins DataDelay_1/in_data] [get_bd_pins camCap_0/we]
  connect_bd_net -net clk_in1_1 [get_bd_ports clk_in1] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins Bram8x320x240_0/clkb] [get_bd_pins Bram8x320x240_1/clka] [get_bd_pins CountGenerator_0/clk] [get_bd_pins Crop_0/clk] [get_bd_pins FrameController2_0/clk] [get_bd_pins FrameController2_1/clk] [get_bd_pins FrameController_0/clk] [get_bd_pins FrameController_1/clk] [get_bd_pins Mirror_0/clk] [get_bd_pins Pan_0/clk] [get_bd_pins Rotate_0/clk] [get_bd_pins Scale_0/clk] [get_bd_pins Shear_0/clk] [get_bd_pins clk_wiz_0/clk_out1]
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


