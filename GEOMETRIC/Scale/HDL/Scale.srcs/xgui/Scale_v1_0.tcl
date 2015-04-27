
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/Scale_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  set_property tooltip {Parameters} ${Page_0}
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}

  #Adding Page
  set Pins [ipgui::add_page $IPINST -name "Pins"]
  set_property tooltip {Pins} ${Pins}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Pins} -text {Discriptions:

clk: Clock.
rst_n: Reset, active low.
scale_x: Horizontal scale, its value must be the reciprocal of your expected scale, because of this module using reverse mapping.
yscale: Longitudinal scale, its value must be the reciprocal of your expected scale, because of this module using reverse mapping.
in_enable: Input enable.
frame_in_enable: Connect it to a read-mode "FrameController" module's "out_enable".
frame_in_data: Connect it to a read-mode "FrameController" module's "out_data".
frame_out_enable: Connect it to a read-mode "FrameController" module's "in_enable".
frame_out_count_x: Connect it to a read-mode "FrameController" module's "in_count_x".
frame_out_count_y: Connect it to a read-mode "FrameController" module's "in_count_y".
out_enable: Output enable, low -> high when the first data can be read.
out_data: Output data.}

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

Copyright  2015, Dai Tianyu(dtysky). All Rights Reserved.
This project is free software and released under the GNU Lesser General Public License (LGPL).}


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

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
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


proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
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

