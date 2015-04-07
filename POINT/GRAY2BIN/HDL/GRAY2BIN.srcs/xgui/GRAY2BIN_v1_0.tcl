# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_static_text $IPINST -name "Port Discriptions:" -parent ${Page_0} -text {Discriptions:


th : Threshold

in_enable: Input enable, must enable with the same time as the first input data.

in_data: Input data.

out_enable: Output enable, will be high when the first output data output.

out_data: Output data.}


}


