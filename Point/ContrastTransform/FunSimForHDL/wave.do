onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/rst_n
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/in_enable
add wave -noupdate -radix unsigned -childformat {{{/ContrastTransform_TB/CTRGBPipline/in_data[23]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[22]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[21]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[20]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[19]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[18]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[17]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[16]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[15]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[14]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[13]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[12]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[11]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[10]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[9]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[8]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[7]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[6]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[5]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[4]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[3]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[2]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[1]} -radix unsigned} {{/ContrastTransform_TB/CTRGBPipline/in_data[0]} -radix unsigned}} -subitemconfig {{/ContrastTransform_TB/CTRGBPipline/in_data[23]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[22]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[21]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[20]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[19]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[18]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[17]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[16]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[15]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[14]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[13]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[12]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[11]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[10]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[9]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[8]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[7]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[6]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[5]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[4]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[3]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[2]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[1]} {-radix unsigned} {/ContrastTransform_TB/CTRGBPipline/in_data[0]} {-radix unsigned}} /ContrastTransform_TB/CTRGBPipline/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBPipline/con_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/rst_n
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTRGBReqAck/con_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/rst_n
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/ct_scale
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/in_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/in_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/out_ready
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/out_data
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayPipline/con_enable
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/clk
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/rst_n
add wave -noupdate -radix unsigned /ContrastTransform_TB/CTGrayReqAck/ct_scale
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
