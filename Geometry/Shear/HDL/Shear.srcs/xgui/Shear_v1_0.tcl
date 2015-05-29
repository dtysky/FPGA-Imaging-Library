
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/Shear_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}
  ipgui::add_param $IPINST -name "mul_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ram_RL" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

work_mode:
unsigned.
Description: This module's working mode.

data_width:
unsigned.
Description: Data bit width.

im_width:
unsigned.
Description: Width of image.

im_height:
unsigned.
Description: Height of image.

im_width_bits:
unsigned.
Description: The bits of width of image.

mul_delay:
unsigned.
Description: Delay for multiplier.

ram_RL:
unsigned.
Description: Delay for FrameController.

}

  #Adding Page
  set Ports [ipgui::add_page $IPINST -name "Ports"]
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {
clk:
unsigned.
Description: Clock.
Range: None

rst_n:
unsigned.
Description: Reset, active low.
Range: None

sh_u:
signed.
Description: Sh for horizontal.
Range: Fixed number, 13bits.12bits

sh_v:
signed.
Description: Sh for vertical.
Range: Fixed number, 13bits.12bits

in_enable:
unsigned.
Description: Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
Range: None

frame_in_ready:
unsigned.
Description: Connect to out_ready in FrameController.
Range: None

frame_in_data:
unsigned.
Description: Connect to out_data in FrameController.
Range: data_width - 1 : 0

frame_enable:
unsigned.
Description: Connect to in_enable in FrameController.
Range: None

frame_out_count_x:
unsigned.
Description: Connect to in_count_u in FrameController.
Range: im_width_bits - 1 : 0

frame_out_count_y:
unsigned.
Description: Connect to in_count_v in FrameController.
Range: im_width_bits - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.
Range: data_width - 1 : 0

}

  #Adding Page
  set Help [ipgui::add_page $IPINST -name "Help"]
  ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {
Homepage for this project:
http://fil.dtysky.moe

Sources for this project:
https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
dtysky@outlook.com

My blog:
http://dtysky.moe

Copyright 2015, Tianyu Dai(dtysky). All Rights Reserved.
This project is free software and released under the GNU Lesser General Public License (LGPL).
}


}

proc update_PARAM_VALUE.im_width_bits { PARAM_VALUE.im_width_bits PARAM_VALUE.im_width PARAM_VALUE.im_height PARAM_VALUE.im_width_bits } {
	# Procedure called to update im_width_bits when any of the dependent parameters in the arguments change
	
	set im_width_bits ${PARAM_VALUE.im_width_bits}
	set im_width ${PARAM_VALUE.im_width}
	set im_height ${PARAM_VALUE.im_height}
	set values(im_width) [get_property value $im_width]
	set values(im_height) [get_property value $im_height]
	set values(im_width_bits) [get_property value $im_width_bits]
	set_property value [gen_USERPARAMETER_im_width_bits_VALUE $values(im_width) $values(im_height) $values(im_width_bits)] $im_width_bits
}

proc validate_PARAM_VALUE.im_width_bits { PARAM_VALUE.im_width_bits } {
	# Procedure called to validate im_width_bits
	return true
}

proc update_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to update data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to validate data_width
	return true
}

proc update_PARAM_VALUE.im_height { PARAM_VALUE.im_height } {
	# Procedure called to update im_height when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_height { PARAM_VALUE.im_height } {
	# Procedure called to validate im_height
	return true
}

proc update_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to update im_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to validate im_width
	return true
}

proc update_PARAM_VALUE.mul_delay { PARAM_VALUE.mul_delay } {
	# Procedure called to update mul_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.mul_delay { PARAM_VALUE.mul_delay } {
	# Procedure called to validate mul_delay
	return true
}

proc update_PARAM_VALUE.ram_RL { PARAM_VALUE.ram_RL } {
	# Procedure called to update ram_RL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ram_RL { PARAM_VALUE.ram_RL } {
	# Procedure called to validate ram_RL
	return true
}

proc update_PARAM_VALUE.work_mode { PARAM_VALUE.work_mode } {
	# Procedure called to update work_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.work_mode { PARAM_VALUE.work_mode } {
	# Procedure called to validate work_mode
	return true
}


proc update_MODELPARAM_VALUE.work_mode { MODELPARAM_VALUE.work_mode PARAM_VALUE.work_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.work_mode}] ${MODELPARAM_VALUE.work_mode}
}

proc update_MODELPARAM_VALUE.data_width { MODELPARAM_VALUE.data_width PARAM_VALUE.data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width}] ${MODELPARAM_VALUE.data_width}
}

proc update_MODELPARAM_VALUE.im_width { MODELPARAM_VALUE.im_width PARAM_VALUE.im_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width}] ${MODELPARAM_VALUE.im_width}
}

proc update_MODELPARAM_VALUE.im_height { MODELPARAM_VALUE.im_height PARAM_VALUE.im_height } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_height}] ${MODELPARAM_VALUE.im_height}
}

proc update_MODELPARAM_VALUE.im_width_bits { MODELPARAM_VALUE.im_width_bits PARAM_VALUE.im_width_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width_bits}] ${MODELPARAM_VALUE.im_width_bits}
}

proc update_MODELPARAM_VALUE.mul_delay { MODELPARAM_VALUE.mul_delay PARAM_VALUE.mul_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.mul_delay}] ${MODELPARAM_VALUE.mul_delay}
}

proc update_MODELPARAM_VALUE.ram_RL { MODELPARAM_VALUE.ram_RL PARAM_VALUE.ram_RL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ram_RL}] ${MODELPARAM_VALUE.ram_RL}
}

