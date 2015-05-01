__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,math

ModuleName='Window'

ColorWidth = 8

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM/'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def convert(data, fo):
	win_size = int(math.sqrt(len(data[3].strip()) / ColorWidth))
	for ps in data[2:]:
		data_res = ''
		for y in range(win_size):
			c_y = win_size - 1 - y
			for x in range(win_size):
				c_x = win_size - 1 - x
				c_p = c_y * win_size + c_x
				data_res += str(eval('0b' + ps[c_p * ColorWidth : (c_p + 1) * ColorWidth])) + ', '
			data_res = data_res[:-2] + '\n'
		data_res += '\n'
		fo.write(data_res)

for root,name,ex in FileAll:
	dat_src = open(root+name+ex)
	data_src = dat_src.readlines()
	dat_src.close()
	fo = open('hdl'+name+'.dat','w')
	convert(data_src, fo)
	fo.close()