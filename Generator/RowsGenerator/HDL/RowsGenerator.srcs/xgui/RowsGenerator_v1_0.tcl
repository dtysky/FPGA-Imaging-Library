
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/RowsGenerator_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "rows_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

rows_width:
unsigned.
Description: The width of rows.

im_width:
unsigned.
Description: Thee width of image.

color_width:
unsigned.
Description: Color's bit wide.

im_width_bits:
unsigned.
Description: The bits of width of image.

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

in_enable:
unsigned.
Description: Input data enable, it works as fifo0's wr_en.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: color_width - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.The lowest color_width-bits of this are the first row!
Range: rows_width * color_width - 1 : 0

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

proc update_PARAM_VALUE.im_width_bits { PARAM_VALUE.im_width_bits PARAM_VALUE.im_width PARAM_VALUE.im_width_bits } {
	# Procedure called to update im_width_bits when any of the dependent parameters in the arguments change
	
	set im_width_bits ${PARAM_VALUE.im_width_bits}
	set im_width ${PARAM_VALUE.im_width}
	set values(im_width) [get_property value $im_width]
	set values(im_width_bits) [get_property value $im_width_bits]
	set_property value [gen_USERPARAMETER_im_width_bits_VALUE $values(im_width) $values(im_width_bits)] $im_width_bits
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

proc update_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to update im_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to validate im_width
	return true
}

proc update_PARAM_VALUE.rows_width { PARAM_VALUE.rows_width } {
	# Procedure called to update rows_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.rows_width { PARAM_VALUE.rows_width } {
	# Procedure called to validate rows_width
	return true
}


proc update_MODELPARAM_VALUE.rows_width { MODELPARAM_VALUE.rows_width PARAM_VALUE.rows_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.rows_width}] ${MODELPARAM_VALUE.rows_width}
}

proc update_MODELPARAM_VALUE.im_width { MODELPARAM_VALUE.im_width PARAM_VALUE.im_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width}] ${MODELPARAM_VALUE.im_width}
}

proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

proc update_MODELPARAM_VALUE.im_width_bits { MODELPARAM_VALUE.im_width_bits PARAM_VALUE.im_width_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width_bits}] ${MODELPARAM_VALUE.im_width_bits}
}

