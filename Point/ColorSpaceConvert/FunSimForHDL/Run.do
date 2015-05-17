vsim -voptargs=+acc -L unisims_ver work.ColorReversal_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRRGB/reg_out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRGray/reg_out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/clk
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/rst_n
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/in_enable
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/in_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/out_ready
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/out_data
add wave -noupdate -radix unsigned /ColorReversal_TB/CRBin/reg_out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99444 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
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
WaveRestoreZoom {95859 ps} {103203 ps}
run -all