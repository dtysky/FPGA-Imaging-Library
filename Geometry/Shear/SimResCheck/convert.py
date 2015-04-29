__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Shear'

FileAll = []

for root, dirs, files in os.walk('../FunSimForHDL'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex == '.res':
        	FileAll.append((root+'/', name, ex))

def convert(data):
	data_res = []
	for p in data[2:]:
		data_res.append(int(p))
	return list(data_res)

for root, name, ex in FileAll:
	dat_src = open(root + name + ex)
	data_src = dat_src.readlines()
	xsize = int(data_src[0])
	ysize = int(data_src[1])
	im_res = Image.new('L', (xsize, ysize), 0)
	im_res.putdata(convert(data_src))
	im_res.save(name + '-hdlfun.jpg')
	dat_src.close()