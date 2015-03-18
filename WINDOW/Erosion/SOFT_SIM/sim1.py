__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
import WindowCreat

ModuleName='WindowCreat'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def mean_th_creat(window):
	s = sum(window)
	return s / len(window)

def mid_creat(window):
	return sorted(window)[len(window)/2]

def mean_creat(im):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	for y in range(ysize):
		for x in range(xsize):
			gray = data_src[y * xsize + x]
			window = WindowCreat.window_creat(9,data_src,xsize,ysize,x,y)
			th = mean_th_creat(window)
			data_res.append(th)
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	im_res.putdata(mean_creat(im_src))
	im_res.save('../SIM_CHECK/soft' + f)