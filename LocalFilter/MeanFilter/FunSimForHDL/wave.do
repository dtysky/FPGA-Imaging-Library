onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/clk
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/rst_n
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/in_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/out_ready
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/out_data
add wave -noupdate -radix unsigned -childformat {{{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[0]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[1]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[2]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[3]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[4]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[5]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[6]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[7]} -radix unsigned} {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[8]} -radix unsigned}} -subitemconfig {{/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[0]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[1]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[2]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[3]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[4]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[5]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[6]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[7]} {-radix unsigned} {/MeanFilter_TB/MFGrayPipelinex3/reg_in_data[8]} {-radix unsigned}} /MeanFilter_TB/MFGrayPipelinex3/reg_in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/reg_out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/sum_all
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex3/con_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/clk
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/rst_n
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/in_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/out_ready
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/reg_in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/reg_out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/sum_all
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayPipelinex5/con_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/clk
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/rst_n
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/in_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/out_ready
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/reg_in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/reg_out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/sum_all
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx3/con_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/clk
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/rst_n
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/in_enable
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/out_ready
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/reg_in_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/reg_out_data
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/sum_all
add wave -noupdate -radix unsigned /MeanFilter_TB/MFGrayReqAckx5/con_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {234741155 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 285
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
WaveRestoreZoom {234740606 ps} {234742390 ps}
