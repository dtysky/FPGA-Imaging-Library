onerror {resume}
quietly virtual signal -install /ColorReversal_TB/CRRGBPipeline { /ColorReversal_TB/CRRGBPipeline/in_data[23:16]} in_data_r
quietly virtual signal -install /ColorReversal_TB/CRRGBPipeline { /ColorReversal_TB/CRRGBPipeline/in_data[15:8]} in_data_g
quietly virtual signal -install /ColorReversal_TB/CRRGBPipeline { /ColorReversal_TB/CRRGBPipeline/in_data[7:0]} in_data_b
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /ColorReversal_TB/CRRGBReqAck { /ColorReversal_TB/CRRGBReqAck/in_data[23:16]} in_data_r
quietly virtual signal -install /ColorReversal_TB/CRRGBReqAck { /ColorReversal_TB/CRRGBReqAck/in_data[15:8]} in_data_g
quietly virtual signal -install /ColorReversal_TB/CRRGBReqAck { /ColorReversal_TB/CRRGBReqAck/in_data[7:0]} in_data_b
quietly virtual signal -install /ColorReversal_TB/CRRGBPipeline { /ColorReversal_TB/CRRGBPipeline/out_data[23:16]} out_data_r
quietly virtual signal -install /ColorReversal_TB/CRRGBPipeline { /ColorReversal_TB/CRRGBPipeline/out_data[15:8]} out_data_g
quietly virtual signal -install /ColorReversal_TB/CRRGBPipeline { /ColorReversal_TB/CRRGBPipeline/out_data[7:0]} out_data_b
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /ColorReversal_TB/CRRGBReqAck { /ColorReversal_TB/CRRGBReqAck/out_data[23:16]} out_data_r
quietly virtual signal -install /ColorReversal_TB/CRRGBReqAck { /ColorReversal_TB/CRRGBReqAck/out_data[15:8]} out_data_g
quietly virtual signal -install /ColorReversal_TB/CRRGBReqAck { /ColorReversal_TB/CRRGBReqAck/out_data[7:0]} out_data_b
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/in_data_r
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/in_data_g
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/in_data_b
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/out_data_r
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/out_data_g
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBPipeline/out_data_b
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/in_data_r
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/in_data_g
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/in_data_b
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/out_data_r
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/out_data_g
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGBReqAck/out_data_b
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayPipeline/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayPipeline/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayPipeline/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayPipeline/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayPipeline/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayPipeline/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayReqAck/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayReqAck/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayReqAck/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayReqAck/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayReqAck/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGrayReqAck/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinPipeline/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinPipeline/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinPipeline/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinPipeline/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinPipeline/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinPipeline/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinReqAck/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinReqAck/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinReqAck/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinReqAck/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinReqAck/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBinReqAck/out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {164 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 278
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
WaveRestoreZoom {0 ps} {7200 ps}
