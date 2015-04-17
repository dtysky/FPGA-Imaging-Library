fo = open('CountEncoder.dat', 'w')

fo.write('module CountEncoder(index, value);\n')
fo.write('\tparameter full_win_bits = 3;\n')
fo.write('\tinput[2 ** full_win_bits - 1 : 0] index;\n')
fo.write('\toutput[full_win_bits - 1 : 0] value;\n')
fo.write('\treg[full_win_bits - 1 : 0] reg_value;\n')
fo.write('\tassign value = reg_value;\n')
fo.write('\tgenerate\n')
fo.write('\t\tcase(full_win_bits)\n')
for i in range(5):
	fo.write('\t\t\t%d : \n' % (i))
	fo.write('\t\t\t\talways@(*) begin\n')
	fo.write('\t\t\t\t\tcase(index)\n')
	for j in range(2 ** (i * i)):
		fo.write('\t\t\t\t\t\t%d : reg_value <= %d;\n' % (j, bin(j).count('1')))
	fo.write('\t\t\t\t\t\tdefault: ;\n')
	fo.write('\t\t\t\t\tendcase\n')
	fo.write('\t\t\t\tend\n')
fo.write('\t\t\tdefault : ;\n')
fo.write('\t\tendcase\n')
fo.write('\tendgenerate\n')
fo.write('endmodule\t')

fo = open('Encoder.dat', 'w')

fo.write('module Encoder(index, value);\n')
fo.write('\tparameter full_win_bits = 3;\n')
fo.write('\tinput[2 ** full_win_bits - 1 : 0] index;\n')
fo.write('\toutput[full_win_bits - 1 : 0] value;\n')
fo.write('\treg[full_win_bits - 1 : 0] reg_value;\n')
fo.write('\tassign value = reg_value;\n')
fo.write('\tgenerate\n')
fo.write('\t\tcase(full_win_bits)\n')
for i in range(5):
	fo.write('\t\t\t%d : \n' % (i))
	fo.write('\t\t\t\talways@(*) begin\n')
	fo.write('\t\t\t\t\tcase(index)\n')
	v = 0
	for j in range(2 ** (i * i)):
		if (bin(j).count('1') == 1):
			fo.write('\t\t\t\t\t\t%d : reg_value <= %d;\n' % (j, v))
			v += 1
	fo.write('\t\t\t\t\t\tdefault: reg_value <= 0;\n')
	fo.write('\t\t\t\t\tendcase\n')
	fo.write('\t\t\t\tend\n')
fo.write('\t\t\tdefault : ;\n')
fo.write('\t\tendcase\n')
fo.write('\tendgenerate\n')
fo.write('endmodule\t')