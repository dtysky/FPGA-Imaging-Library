__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
import os

ModuleName='CHR_ASCII_8X8'

FONT = ImageFont.truetype('FONT.ttf',8)

fi = open('ASCII.dat','r')
fo = open('../HDL/'+ModuleName+'.srcs/'+'sources_1/new/FONT_SOURCE.v','w')

s = ''
s += '`timescale 1ns / 1ps\n'
s += '//////////////////////////////////////////////////////////////////////////////////\n'
s += '// Company: Xilinx\n'
s += '// Engineer: Dai Tianyu (dtysky)\n'
s += '// \n'
s += '// Create Date: 2015/02/2 02:02:04\n'
s += '// Design Name: CHR_ASCII_8X8\n'
s += '// Module Name: FONT_SOURCE\n'
s += '// Project Name: Image processing project\n'
s += '// Target Devices: \n'
s += '// Tool Versions: \n'
s += '// Description: \n'
s += '// \n'
s += '// Dependencies: \n' 
s += '// \n'
s += '// Revision: \n'
s += '// Revision 0.01 - File Created\n'
s += '// Additional Comments:\n'
s += '// \n'
s += '//////////////////////////////////////////////////////////////////////////////////\n'

s += 'module '+ModuleName+'(\n'
s += '\tinput[7:0] index,\n'
s += '\toutput[63:0] result\n\t);\n\n'
s += '\treg[63:0] r_result;\n'
s += '\tassign result = r_result;\n\n\n'
s += '\talways @(*) begin\n'
s += '\t\tcase(index)\n'

ss = ''

for l in fi.read().splitlines():
	l.rstrip()
	index,char = l.split(' , ')
	im = Image.new('1',(8,8),'white')
	draw = ImageDraw.Draw(im)
	char_x,char_y = FONT.getsize(char)
	txt_x = int(8-char_x)/2
	txt_y = -1
	draw.text((txt_x,txt_y),char,font=FONT)
	im.save('img'+index+'.png')
	im_s = ''
	for p in im.getdata():
		if p == 255:
			p = 1
		im_s += str(p)
	s += "\t\t\t8'h" + index + ' : result <= ' + im_s + ';\n'
	ss += "0x" + index + ':' + im_s + '\n'

s += "\t\t\tdefault : result <= 64'd0;\n"
s += '\t\tendcase\n'
s += '\tend\n'
s += 'endmodule'

fo.write(s)
fi.close()
fo.close()
fo = open('../SOFT_SIM/FONT_SOURCE.dat','w')
fo.write(ss[:-1])
fo.close()