vsim work.glbl -voptargs=+acc -L unisims_ver work.LuminanceTransform_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/clk
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/rst_n
add wave -noupdate -radix decimal /LuminanceTransform_TB/LTRGBPipline/lm_gain
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/in_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/in_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/out_ready
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/out_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBPipline/con_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/clk
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/rst_n
add wave -noupdate -radix decimal /LuminanceTransform_TB/LTRGBReqAck/lm_gain
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/in_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/in_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/out_ready
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/out_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTRGBReqAck/con_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/clk
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/rst_n
add wave -noupdate -radix decimal /LuminanceTransform_TB/LTGrayPipline/lm_gain
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/in_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/in_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/out_ready
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/out_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayPipline/con_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/clk
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/rst_n
add wave -noupdate -radix decimal /LuminanceTransform_TB/LTGrayReqAck/lm_gain
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/in_enable
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/in_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/out_ready
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/out_data
add wave -noupdate -radix unsigned /LuminanceTransform_TB/LTGrayReqAck/con_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1048791315 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1048787620 ps} {1048795316 ps}
run -all