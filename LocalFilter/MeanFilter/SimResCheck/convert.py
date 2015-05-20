__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

FileFormat = ['.res']

def name_format(root, name, ex):
	return '%s-hdlfun.bmp' % name

def convert(data):
	data_res = []
	for p in data[2:]:
		data_res.append(int(p))
	xsize, ysize = int(data[0]), int(data[1])
	im_res = Image.new('L', (xsize, ysize))
	im_res.putdata(data_res)
	return im_res

FileAll = []
for root, dirs, files in os.walk('../FunSimForHDL'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in FileFormat:
        	FileAll.append((root+'/', name, ex))
for root, name, ex in FileAll:
	dat_src = open(root + name + ex)
	data_src = dat_src.readlines()
	convert(data_src).save(name_format(root, name, ex))
	dat_src.close()