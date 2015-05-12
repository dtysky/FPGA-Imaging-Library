vsim work.glbl -voptargs=+acc -L unisims_ver work.Graying_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/clk
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/rst_n
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/in_enable
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/in_data
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/r
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/g
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/b
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/mul_r
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/mul_g
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/mul_b
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/out_ready
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/out_data
add wave -noupdate -radix unsigned /Graying_TB/CTRGBPipline/con_enable
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/clk
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/rst_n
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/in_enable
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/in_data
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/r
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/g
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/b
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/mul_r
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/mul_g
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/mul_b
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/out_ready
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/out_data
add wave -noupdate -radix unsigned /Graying_TB/CTRGBReqAck/con_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {786643537 ps} 0}
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
WaveRestoreZoom {786639450 ps} {786647450 ps}
run -all