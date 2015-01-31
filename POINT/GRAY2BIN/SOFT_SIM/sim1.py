__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

th = 100
FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(im):
	data_src = im.getdata()
	data_res = []
	for gray in data_src:
		data_res.append(0 if gray<th else 1)
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('1', (s_x, s_y), 0)
	im_res.putdata(transform(im_src))
	im_res.save('../SIM_CHECK/soft' + f)