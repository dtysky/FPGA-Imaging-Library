__author__ = 'Dai Tianyu (dtysky)'
# Generateing LUTs for sin and cos.
from math import sin, cos, radians

# Convert num(1bit.16bis) to 17bits fixed binary decimal
def format_d(num):
	r, d = str(num).split('.')
	tmp = float('0.' + d)
	res = ''
	for i in xrange(16):
		tmp = tmp * 2
		res += '1' if tmp >= 1 else '0'
		tmp = tmp - 1 if tmp >= 1 else tmp
	return r + res

fo = open('SinLUT.dat', 'w')
fo.write('module SinLUT(angle, value);\n')
fo.write('\tinput[8 : 0] angle;\n')
fo.write('\toutput[16 : 0] value;\n')
fo.write('\treg[16 : 0] reg_value;\n')
fo.write('\tassign value = reg_value;\n')
fo.write('\talways@(*) begin\n')
fo.write('\t\tcase(angle)\n')
for i in xrange(360):
	fo.write('\t\t\t%d : reg_value <= %s;\n' % (i, format_d(sin(radians(i)))))
fo.write('\t\t\tdefault: reg_value <= 0;\n')
fo.write('\t\tendcase\n')
fo.write('\tend\n')
fo.write('endmodule\t')

fo = open('CosLUT.dat', 'w')
fo.write('module CosLUT(angle, value);\n')
fo.write('\tinput[8 : 0] angle;\n')
fo.write('\toutput[16 : 0] value;\n')
fo.write('\treg[16 : 0] reg_value;\n')
fo.write('\tassign value = reg_value;\n')
fo.write('\talways@(*) begin\n')
fo.write('\t\tcase(angle)\n')
for i in xrange(360):
	fo.write('\t\t\t%d : reg_value <= %s;\n' % (i, format_d(cos(radians(i)))))
fo.write('\t\t\tdefault: reg_value <= 0;\n')
fo.write('\t\tendcase\n')
fo.write('\tend\n')
fo.write('endmodule\t')