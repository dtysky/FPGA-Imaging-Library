__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

FileFormat = ['.res']

def name_format(root, name, ex):
	return '%s-hdlfun.dat' % name

def convert(data, fo):
	mode = data[2].strip()
	if mode == 'L':
		rsize = len(data[3].strip()) / 8
		cszie = 8
	else:
		rsize = len(data[3].strip())
		cszie = 1
	data_res = ''
	for p in data[3:]:
		for i in xrange(rsize):
			j = rsize - 1 - i
			fo.write('%d ' % eval('0b' + p[j * cszie : (j + 1) * cszie]))
		fo.write('\n')

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