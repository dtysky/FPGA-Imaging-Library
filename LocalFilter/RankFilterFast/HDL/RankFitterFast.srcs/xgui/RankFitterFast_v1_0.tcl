
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/RankFitterFast_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "window_size" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "full_win_bits" -parent ${Page_0}


}

proc update_PARAM_VALUE.full_win_bits { PARAM_VALUE.full_win_bits PARAM_VALUE.window_size PARAM_VALUE.full_win_bits } {
	# Procedure called to update full_win_bits when any of the dependent parameters in the arguments change
	
	set full_win_bits ${PARAM_VALUE.full_win_bits}
	set window_size ${PARAM_VALUE.window_size}
	set values(window_size) [get_property value $window_size]
	set values(full_win_bits) [get_property value $full_win_bits]
	set_property value [gen_USERPARAMETER_full_win_bits_VALUE $values(window_size) $values(full_win_bits)] $full_win_bits
}

proc validate_PARAM_VALUE.full_win_bits { PARAM_VALUE.full_win_bits } {
	# Procedure called to validate full_win_bits
	return true
}

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
	return true
}

proc update_PARAM_VALUE.window_size { PARAM_VALUE.window_size } {
	# Procedure called to update window_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_size { PARAM_VALUE.window_size } {
	# Procedure called to validate window_size
	return true
}


proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

proc update_MODELPARAM_VALUE.window_size { MODELPARAM_VALUE.window_size PARAM_VALUE.window_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_size}] ${MODELPARAM_VALUE.window_size}
}

proc update_MODELPARAM_VALUE.full_win_bits { MODELPARAM_VALUE.full_win_bits PARAM_VALUE.full_win_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.full_win_bits}] ${MODELPARAM_VALUE.full_win_bits}
}

