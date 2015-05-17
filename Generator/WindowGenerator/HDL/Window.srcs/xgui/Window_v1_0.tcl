# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "window_size" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {Discriptions:

The lowest color_width-bits of out_data are the top left corner of this window !

window_size must be less than 16 !



clk: Clock.

rst_n: Reset, active low.

in_enable: The flag from rows enable.

in_data: The data from rows.

out_enable: A flag showing the oyt_data enable.

out_data: Window output.}


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

