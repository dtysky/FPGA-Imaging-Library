__author__ = 'dtysky'

from PIL import Image
import os

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(im):
	data_src = im.getdata()
	data_res = []
	for rgb in data_src:
		gray = int(0.3*rgb[0] + 0.6*rgb[1] + 0.1*rgb[2])
		data_res.append(gray)
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	print im_res.getdata()[0]
	im_res.putdata(transform(im_src))
	im_res.save('res' + f)