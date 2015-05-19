vsim work.glbl -voptargs=+acc -L unisims_ver work.RowsGenerator_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/clk
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/rst_n
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/in_enable
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/in_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/out_ready
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/out_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/row_wr_en
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/row_rd_en
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/row_din
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/row_dout
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/row_num
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex3/rst
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/clk
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/rst_n
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/in_enable
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/in_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/out_ready
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/out_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/row_wr_en
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/row_rd_en
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/row_din
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/row_dout
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/row_num
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGGrayPipelinex5/rst
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex5/clk
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex5/rst_n
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex5/in_enable
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex5/in_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex5/out_ready
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex5/out_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex3/clk
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex3/rst_n
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex3/in_enable
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex3/in_data
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex3/out_ready
add wave -noupdate -radix unsigned /RowsGenerator_TB/RGBinPipelinex3/out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {509996 ps} 0}
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
WaveRestoreZoom {508 ns} {512 ns}
run -all