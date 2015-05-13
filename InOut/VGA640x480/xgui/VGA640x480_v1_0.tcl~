# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Ports [ipgui::add_page $IPINST -name "Ports"]
  set_property tooltip {Ports} ${Ports}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {clk_25m: unsigned, Clock, 25MHz.

rst_n: unsigned, Reset, active low.

in_data: unsigned, Input data, 16bits RGB.

vga_red: unsigned, Output data for VGA, red channel.

vga_green: unsigned, Output data for VGA, green channel.

vga_blue: unsigned, Output data for VGA, blue channel.

vga_hsync: unsigned, HSYNC for VGA.

vga_vsync: unsigned, VSYNC for VGA.

frame_addr: unsigned, Address for a frame which storing the image.}

  #Adding Page
  set Help [ipgui::add_page $IPINST -name "Help"]
  set_property tooltip {Help} ${Help}
  ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {Homepage for this project:
http://fil.dtysky.moe

Sources for this project:
https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
dtysky@outlook.com

My blog:
http://dtysky.moe

}


}


proc update_MODELPARAM_VALUE.hRez { MODELPARAM_VALUE.hRez } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "hRez". Setting updated value from the model parameter.
set_property value 640 ${MODELPARAM_VALUE.hRez}
}

proc update_MODELPARAM_VALUE.hStartSync { MODELPARAM_VALUE.hStartSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "hStartSync". Setting updated value from the model parameter.
set_property value 656 ${MODELPARAM_VALUE.hStartSync}
}

proc update_MODELPARAM_VALUE.hEndSync { MODELPARAM_VALUE.hEndSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "hEndSync". Setting updated value from the model parameter.
set_property value 752 ${MODELPARAM_VALUE.hEndSync}
}

proc update_MODELPARAM_VALUE.hMaxCount { MODELPARAM_VALUE.hMaxCount } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "hMaxCount". Setting updated value from the model parameter.
set_property value 800 ${MODELPARAM_VALUE.hMaxCount}
}

proc update_MODELPARAM_VALUE.vRez { MODELPARAM_VALUE.vRez } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "vRez". Setting updated value from the model parameter.
set_property value 480 ${MODELPARAM_VALUE.vRez}
}

proc update_MODELPARAM_VALUE.vStartSync { MODELPARAM_VALUE.vStartSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "vStartSync". Setting updated value from the model parameter.
set_property value 490 ${MODELPARAM_VALUE.vStartSync}
}

proc update_MODELPARAM_VALUE.vEndSync { MODELPARAM_VALUE.vEndSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "vEndSync". Setting updated value from the model parameter.
set_property value 492 ${MODELPARAM_VALUE.vEndSync}
}

proc update_MODELPARAM_VALUE.vMaxCount { MODELPARAM_VALUE.vMaxCount } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "vMaxCount". Setting updated value from the model parameter.
set_property value 525 ${MODELPARAM_VALUE.vMaxCount}
}

proc update_MODELPARAM_VALUE.hsync_active { MODELPARAM_VALUE.hsync_active } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "hsync_active". Setting updated value from the model parameter.
set_property value 0 ${MODELPARAM_VALUE.hsync_active}
}

proc update_MODELPARAM_VALUE.vsync_active { MODELPARAM_VALUE.vsync_active } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "vsync_active". Setting updated value from the model parameter.
set_property value 0 ${MODELPARAM_VALUE.vsync_active}
}

