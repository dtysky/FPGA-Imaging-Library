__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
import WindowCreat,MeanCreat

ModuleName='GRAY2BIN'

th = 128
FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(im,wsize):
	data_src = im.getdata()
	ths = MeanCreat.mean_creat(im,wsize)
	xsize,ysize = im.size
	data_res = []
	for y in range(ysize):
		for x in range(xsize):
			gray = data_src[y * xsize + x]
			th = ths[y * xsize + x]
			data_res.append(0 if gray < th else 1)
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('1', (s_x, s_y), 0)
	im_res.putdata(transform(im_src,11))
	im_res.save('../SIM_CHECK/mean_soft' + f)