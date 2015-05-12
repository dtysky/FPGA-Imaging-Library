__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='LuminanceTransform'
FileFormat = ['.res']

def name_format(root, name, ex):
	return '%s-hdlfun.jpg' % name

def convert(data):
	data_res = []
	mode = data[2].strip()
	if mode == 'RGB':
		for p in data[3:]:
			r, g, b = p.split(' ')
			data_res.append((int(r), int(g), int(b)))
	elif mode == 'L':
		for p in data[3:]:
			data_res.append(int(p))
	elif mode == '1':
		for p in data[3:]:
			data_res.append(0 if int(p) == 0 else 255)
	xsize, ysize = int(data[0]), int(data[1])
	im_res = Image.new(mode, (xsize, ysize))
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