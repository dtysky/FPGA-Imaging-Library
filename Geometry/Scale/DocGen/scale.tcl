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

scale_x:
unsigned.
Description: Scale for horizontal, must be reciprocal of real scale.
Range: Fixed number, 6bits.18bits

scale_y:
unsigned.
Description: Scale for vertical, must be reciprocal of real scale.
Range: Fixed number, 4bits.20bits

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
Description: Connect to in_count_x in FrameController.
Range: im_width_bits - 1 : 0

frame_out_count_y:
unsigned.
Description: Connect to in_count_y in FrameController.
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