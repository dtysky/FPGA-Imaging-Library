vsim work.glbl -voptargs=+acc -L unisims_ver work.FrameController2_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /FrameController2_TB/clk
add wave -noupdate -radix unsigned /FrameController2_TB/rst_n
add wave -noupdate -radix unsigned /FrameController2_TB/in_count_xW
add wave -noupdate -radix unsigned /FrameController2_TB/in_count_yW
add wave -noupdate -radix unsigned /FrameController2_TB/in_enableW
add wave -noupdate -radix unsigned /FrameController2_TB/in_dataW
add wave -noupdate -radix unsigned /FrameController2_TB/out_enableW
add wave -noupdate -radix unsigned /FrameController2_TB/out_dataW
add wave -noupdate -radix unsigned /FrameController2_TB/ram_addrW
add wave -noupdate -radix unsigned /FrameController2_TB/out_count_xW
add wave -noupdate -radix unsigned /FrameController2_TB/out_count_yW
add wave -noupdate -radix unsigned /FrameController2_TB/in_enableR
add wave -noupdate -radix unsigned /FrameController2_TB/in_dataR
add wave -noupdate -radix unsigned /FrameController2_TB/out_enableR
add wave -noupdate -radix unsigned /FrameController2_TB/out_dataR
add wave -noupdate -radix unsigned /FrameController2_TB/ram_addrR
add wave -noupdate -radix unsigned /FrameController2_TB/out_count_xR
add wave -noupdate -radix unsigned /FrameController2_TB/out_count_yR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10114978 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 362
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
WaveRestoreZoom {10014392 ps} {10215608 ps}
run -all