vsim -voptargs=+acc -L unisims_ver work.Mirror_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/clk
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/rst_n
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/mode
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/in_enable
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/in_data
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/in_count_x
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/in_count_y
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/out_enable
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/out_data
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/out_count_x
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/out_count_y
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/reg_out_x
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/reg_out_y
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/reg_out_data
add wave -noupdate -radix unsigned /Mirror_TB/Mirror1/reg_out_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52428966 ps} 0}
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
WaveRestoreZoom {52423719 ps} {52432439 ps}
run -all