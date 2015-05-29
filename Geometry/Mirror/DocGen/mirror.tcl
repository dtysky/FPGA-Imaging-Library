proc init_gui { IPINST } {
ipgui::add_param $IPINST -name "Component_Name"
#Adding Page
set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
set_property tooltip {Parameters} ${Page_0}
ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0}
ipgui::add_param $IPINST -name "data_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}
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

}
#Adding Page
set Ports [ipgui::add_page $IPINST -name "Ports"]
set_property tooltip {Ports} ${Ports}
ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {
clk:
unsigned.
Description: Clock.
Range: None

rst_n:
unsigned.
Description: Reset, active low.
Range: None

mode:
unsigned.
Description: Mode for mirror.
Range: 00 for horizontal, 01 for vertical, 10 or 11 for all

in_enable:
unsigned.
Description: Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: data_width - 1 : 0

in_count_x:
unsigned.
Description: Input pixel count for width.
Range: im_width_bits - 1 : 0

in_count_y:
unsigned.
Description: Input pixel count for height.
Range: im_width_bits - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.
Range: data_width - 1 : 0

out_count_x:
unsigned.
Description: Output pixel count for height.
Range: im_width_bits - 1 : 0

out_count_y:
unsigned.
Description: Output pixel count for height.
Range: im_width_bits - 1 : 0

}
#Adding Page
set Help [ipgui::add_page $IPINST -name "Help"]
set_property tooltip {Help} ${Help}
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