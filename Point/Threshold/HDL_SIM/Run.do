vsim work.glbl -voptargs=+acc -L unisims_ver work.Threshold_TB
onerror {resume}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {416000 ps} 0}
quietly wave cursor active 1
add wave -position end  sim:/Threshold_TB/clk
add wave -position end  sim:/Threshold_TB/rst_n
add wave -position end  sim:/Threshold_TB/in_enable
add wave -position end  sim:/Threshold_TB/in_data
add wave -position end  sim:/Threshold_TB/out_enableBase
add wave -position end  sim:/Threshold_TB/out_dataBase
add wave -position end  sim:/Threshold_TB/out_dataTernary
add wave -position end  sim:/Threshold_TB/out_dataContour
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
WaveRestoreZoom {415607 ps} {416394 ps}
run -all