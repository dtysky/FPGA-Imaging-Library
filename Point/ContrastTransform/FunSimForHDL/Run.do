vsim work.glbl -voptargs=+acc -L unisims_ver work.ContrastTransform_TB
onerror {resume}
quietly virtual signal -install /ContrastTransform_TB/CTRGBPipeline { /ContrastTransform_TB/CTRGBPipeline/in_data[23:16]} in_data_r
quietly virtual signal -install /ContrastTransform_TB/CTRGBPipeline { /ContrastTransform_TB/CTRGBPipeline/in_data[15:8]} in_data_g
quietly virtual signal -install /ContrastTransform_TB/CTRGBPipeline { /ContrastTransform_TB/CTRGBPipeline/in_data[7:0]} in_data_b
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /ContrastTransform_TB/CTRGBReqAck { /ContrastTransform_TB/CTRGBReqAck/in_data[23:16]} in_data_r
quietly virtual signal -install /ContrastTransform_TB/CTRGBReqAck { /ContrastTransform_TB/CTRGBReqAck/in_data[15:8]} in_data_g
quietly virtual signal -install /ContrastTransform_TB/CTRGBReqAck { /ContrastTransform_TB/CTRGBReqAck/in_data[7:0]} in_data_b
quietly virtual signal -install /ContrastTransform_TB/CTRGBPipeline { /ContrastTransform_TB/CTRGBPipeline/out_data[23:16]} out_data_r
quietly virtual signal -install /ContrastTransform_TB/CTRGBPipeline { /ContrastTransform_TB/CTRGBPipeline/out_data[15:8]} out_data_g
quietly virtual signal -install /ContrastTransform_TB/CTRGBPipeline { /ContrastTransform_TB/CTRGBPipeline/out_data[7:0]} out_data_b
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /ContrastTransform_TB/CTRGBReqAck { /ContrastTransform_TB/CTRGBReqAck/out_data[23:16]} out_data_r
quietly virtual signal -install /ContrastTransform_TB/CTRGBReqAck { /ContrastTransform_TB/CTRGBReqAck/out_data[15:8]} out_data_g
quietly virtual signal -install /ContrastTransform_TB/CTRGBReqAck { /ContrastTransform_TB/CTRGBReqAck/out_data[7:0]} out_data_b
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/rst_n
add wave -noupdate -radix binary /ContrastTransform_TB/CTRGBPipeline/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/in_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/in_data_r
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/in_data_g
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/in_data_b
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/out_data_r
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/out_data_g
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/out_data_b
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipeline/con_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/rst_n
add wave -noupdate -radix binary /ContrastTransform_TB/CTRGBReqAck/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_data_r
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_data_g
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_data_b
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_data_r
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_data_g
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_data_b
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/con_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/rst_n
add wave -noupdate -radix binary /ContrastTransform_TB/CTGrayPipeline/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/in_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipeline/con_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/rst_n
add wave -noupdate -radix binary /ContrastTransform_TB/CTGrayReqAck/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/in_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/con_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2266762486 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 291
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
WaveRestoreZoom {2266758610 ps} {2266765730 ps}
run -all