# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ref_window_size" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {
Discriptions:

clk: Clock.
rst_n: Reset, active low.
org_enable: Input enable from windw which content the orginal pixel.
org_data: Input data from window which content the orginal pixel, the first data must be given in the same time with in_enable enabling.
ref_enable: Pixels for referencing enable.
ref_data: Input data from pixels for referencing, the first data must be given in the same time with in_enable enabling.
out_enable: Output enable, low -> high when the first data can be read.
out_data: Output data.}


}

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
	return true
}

proc update_PARAM_VALUE.ref_window_size { PARAM_VALUE.ref_window_size } {
	# Procedure called to update ref_window_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ref_window_size { PARAM_VALUE.ref_window_size } {
	# Procedure called to validate ref_window_size
	return true
}


proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

proc update_MODELPARAM_VALUE.ref_window_size { MODELPARAM_VALUE.ref_window_size PARAM_VALUE.ref_window_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ref_window_size}] ${MODELPARAM_VALUE.ref_window_size}
}

