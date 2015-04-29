# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "pip_counter" -parent ${Page_0}
  ipgui::add_param $IPINST -name "window_size" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {
Discriptions:
The window size must be less than 16 !

clk: colck.
rst_n: Reset, active low.
mode: 0 for erosion, 1 for dilation
template: The template you want to use for erosion or dilation.
in_enable: Input enable, must enable with the same time as the first input data.
in_data: Input data.
out_enable: Output enable, will be high when the first output data output.
out_data: Output data.}
  ipgui::add_static_text $IPINST -name "Pip Counter" -parent ${Page_0} -text {
Pip Counter:
As follows - "Window Szie : Pip Counter":
1 : 0;
2 : 1;
3 : 3;
4 : 4;
5 : 4;
6 : 5;
7 : 5;
8 : 6;
9 : 6;
10 : 6;
11 : 6;
12 : 7;
13 : 7;
14 : 8;
15 : 8;
16 : 8;}


}

proc update_PARAM_VALUE.pip_counter { PARAM_VALUE.pip_counter } {
	# Procedure called to update pip_counter when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.pip_counter { PARAM_VALUE.pip_counter } {
	# Procedure called to validate pip_counter
	return true
}

proc update_PARAM_VALUE.window_size { PARAM_VALUE.window_size } {
	# Procedure called to update window_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_size { PARAM_VALUE.window_size } {
	# Procedure called to validate window_size
	return true
}


proc update_MODELPARAM_VALUE.window_size { MODELPARAM_VALUE.window_size PARAM_VALUE.window_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_size}] ${MODELPARAM_VALUE.window_size}
}

proc update_MODELPARAM_VALUE.pip_counter { MODELPARAM_VALUE.pip_counter PARAM_VALUE.pip_counter } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pip_counter}] ${MODELPARAM_VALUE.pip_counter}
}

proc update_MODELPARAM_VALUE.full_win_size { MODELPARAM_VALUE.full_win_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "full_win_size". Setting updated value from the model parameter.
set_property value 25 ${MODELPARAM_VALUE.full_win_size}
}

