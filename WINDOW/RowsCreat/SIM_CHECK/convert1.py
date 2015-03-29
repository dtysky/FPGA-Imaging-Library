__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='RowsCreat'

ColorWidth = 8

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM/Rows8x512/'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def convert(data, fo):
	for ps in data[2:]:
		data_res = ''
		rows_width = len(ps.strip()) / ColorWidth
		for i in range(rows_width):
			j = rows_width - 1 - i
			data_res += str(eval('0b' + ps[j * ColorWidth : (j + 1) * ColorWidth])) + ', '
		data_res = data_res[:-2] +'\n'
		fo.write(data_res)

for root,name,ex in FileAll:
	dat_src = open(root+name+ex)
	data_src = dat_src.readlines()
	dat_src.close()
	fo = open('hdl'+name+'.dat','w')
	convert(data_src, fo)
	fo.close()