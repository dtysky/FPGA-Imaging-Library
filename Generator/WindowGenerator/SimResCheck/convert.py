__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os, math

FileFormat = ['.res']

def name_format(root, name, ex):
	return '%s-hdlfun.dat' % name

def convert(data, fo):
	mode = data[2].strip()
	if mode == 'L':
		wsize = int(math.sqrt(len(data[3].strip()) / 8))
		cszie = 8
	else:
		wsize = int(math.sqrt(len(data[3].strip())))
		cszie = 1
	for p in data[3:]:
		data_res = ''
		x = 0
		for i in xrange(wsize * wsize):
			j = wsize * wsize - 1 - i
			data_res += '%d ' % eval('0b' + p[j * cszie : (j + 1) * cszie])
			if x == wsize - 1:
				x = 0
				data_res = data_res[:-1] + '\n'
			else:
				x += 1
		fo.write('%s\n' % data_res)

FileAll = []
for root, dirs, files in os.walk('../FunSimForHDL'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in FileFormat:
        	FileAll.append((root+'/', name, ex))
for root, name, ex in FileAll:
	dat_src = open(root + name + ex)
	data_src = dat_src.readlines()
	convert(data_src, open(name_format(root, name, ex), 'w'))
	dat_src.close()