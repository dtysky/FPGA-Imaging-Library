vsim work.glbl -voptargs=+acc -L unisims_ver work.FrameController_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/clk
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/rst_n
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/in_enable
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/in_data
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/out_ready
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/out_data
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineWrite/ram_addr
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/clk
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/rst_n
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/in_enable
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/in_data
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/out_ready
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/out_data
add wave -noupdate -radix unsigned /FrameController_TB/FramePipelineRead/ram_addr
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/clk
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/rst_n
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/in_enable
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/in_data
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/out_ready
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/out_data
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckWrite/ram_addr
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/clk
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/rst_n
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/in_enable
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/in_data
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/out_ready
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/out_data
add wave -noupdate -radix unsigned /FrameController_TB/FrameReqAckRead/ram_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7659559 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {7655850 ps} {7663850 ps}
run -all