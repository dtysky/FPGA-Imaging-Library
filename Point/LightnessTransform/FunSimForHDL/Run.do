vsim work.glbl -voptargs=+acc -L unisims_ver work.LightnessTransform_TB
onerror {resume}
quietly virtual signal -install /LightnessTransform_TB/LTRGBPipeline { /LightnessTransform_TB/LTRGBPipeline/in_data[23:16]} in_data_r
quietly virtual signal -install /LightnessTransform_TB/LTRGBPipeline { /LightnessTransform_TB/LTRGBPipeline/in_data[15:8]} in_data_g
quietly virtual signal -install /LightnessTransform_TB/LTRGBPipeline { /LightnessTransform_TB/LTRGBPipeline/in_data[7:0]} in_data_b
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /LightnessTransform_TB/LTRGBReqAck { /LightnessTransform_TB/LTRGBReqAck/in_data[23:16]} in_data_r
quietly virtual signal -install /LightnessTransform_TB/LTRGBReqAck { /LightnessTransform_TB/LTRGBReqAck/in_data[15:8]} in_data_g
quietly virtual signal -install /LightnessTransform_TB/LTRGBReqAck { /LightnessTransform_TB/LTRGBReqAck/in_data[7:0]} in_data_b
quietly virtual signal -install /LightnessTransform_TB/LTRGBPipeline { /LightnessTransform_TB/LTRGBPipeline/out_data[23:16]} out_data_r
quietly virtual signal -install /LightnessTransform_TB/LTRGBPipeline { /LightnessTransform_TB/LTRGBPipeline/out_data[15:8]} out_data_g
quietly virtual signal -install /LightnessTransform_TB/LTRGBPipeline { /LightnessTransform_TB/LTRGBPipeline/out_data[7:0]} out_data_b
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /LightnessTransform_TB/LTRGBReqAck { /LightnessTransform_TB/LTRGBReqAck/out_data[23:16]} out_data_r
quietly virtual signal -install /LightnessTransform_TB/LTRGBReqAck { /LightnessTransform_TB/LTRGBReqAck/out_data[15:8]} out_data_g
quietly virtual signal -install /LightnessTransform_TB/LTRGBReqAck { /LightnessTransform_TB/LTRGBReqAck/out_data[7:0]} out_data_b
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/clk
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/rst_n
add wave -noupdate -radix decimal /LightnessTransform_TB/LTRGBPipeline/lm_gain
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/in_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/in_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/in_data_r
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/in_data_g
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/in_data_b
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/out_ready
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/out_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/out_data_r
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/out_data_g
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/out_data_b
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBPipeline/con_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/clk
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/rst_n
add wave -noupdate -radix decimal /LightnessTransform_TB/LTRGBReqAck/lm_gain
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/in_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/in_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/in_data_r
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/in_data_g
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/in_data_b
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/out_ready
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/out_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/out_data_r
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/out_data_g
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/out_data_b
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTRGBReqAck/con_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/clk
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/rst_n
add wave -noupdate -radix decimal /LightnessTransform_TB/LTGrayPipeline/lm_gain
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/in_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/in_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/out_ready
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/out_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayPipeline/con_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/clk
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/rst_n
add wave -noupdate -radix decimal /LightnessTransform_TB/LTGrayReqAck/lm_gain
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/in_enable
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/in_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/out_ready
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/out_data
add wave -noupdate -radix unsigned /LightnessTransform_TB/LTGrayReqAck/con_enable
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