proc init_gui { IPINST } {
ipgui::add_param $IPINST -name "Component_Name"
#Adding Page
set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
set_property tooltip {Parameters} ${Page_0}
ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}
ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {
work\_mode: unsigned, This module's working mode.
color\_width: unsigned, Color's bit wide
}
#Adding Page
set Ports [ipgui::add_page $IPINST -name "Ports"]
set_property tooltip {Ports} ${Ports}
ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {
clk: unsigned, Clock.
rst\_n: unsigned, Reset, active low.
in\_enable: unsigned, Input data enable, in pipelines mode, it works as another rst\_n, in req-ack mode, only it is high will in\_data can be changes.
in\_data: unsigned, Input data, it must be synchronous with in\_enable.
out\_ready: unsigned, Output data ready, in both two mode, it will be high while the out\_data can be read.
out\_data: unsigned, Output data, it will be synchronous with out\_ready.
}
#Adding Page
set Help [ipgui::add_page $IPINST -name "Help"]
set_property tooltip {Help} ${Help}
ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {Documents for all modules:
Homepage for this project:
http://fil.dtysky.moe

Sources for this project:
https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
dtysky@outlook.com

My blog:
http://dtysky.moe


}
}