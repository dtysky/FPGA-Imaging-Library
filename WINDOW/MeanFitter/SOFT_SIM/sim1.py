__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows

ModuleName='MeanFitter'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def mean_fitter(window):
	w_sum = 0
	w_len = 0
	for row in window:
		w_sum += sum(row)
		w_len += len(row)
	return w_sum / w_len

def create(im, wsize):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	rows = Rows(data_src, wsize, xsize)
	win = Window(wsize)
	while 1:
		w = win.update(rows.update())
		if win.is_enable():
			break
	for i in range(len(data_src)):
		if rows.frame_empty():
			rows.create(data_src, wsize, xsize)
		data_res.append(mean_fitter(w))
		w = win.update(rows.update())
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	im_res.putdata(create(im_src, 5))
	im_res.save('../SIM_CHECK/soft' + f)
	# fo = open('../SIM_CHECK/soft' + f + '.dat','w')
	# for pix in im_res.getdata():
	# 	fo.write(str(pix) + '\n')