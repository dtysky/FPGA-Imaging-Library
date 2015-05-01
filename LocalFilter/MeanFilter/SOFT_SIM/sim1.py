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
	for row in window:
		w_sum += sum(row)
	if len(window) == 1:
		return w_sum
	elif len(window) == 2:
		return w_sum >> 2;
	elif len(window) == 3:
		return (w_sum >> 4) + (w_sum >> 5) + (w_sum >> 6);
	elif len(window) == 4:
		return w_sum >> 4;
	elif len(window) == 5:
		return (w_sum >> 5) + (w_sum >> 7);
	elif len(window) == 6:
		return (w_sum >> 6) + (w_sum >> 7) + (w_sum >> 8);
	elif len(window) == 7:
		return (w_sum >> 6) + (w_sum >> 8);
	elif len(window) == 8:
		return w_sum >> 6;
	elif len(window) == 9:
		return (w_sum >> 7) + (w_sum >> 8) + (w_sum >> 10);
	elif len(window) == 10:
		return (w_sum >> 7) + (w_sum >> 9);
	elif len(window) == 11:
		return (w_sum >> 7) + (w_sum >> 10);
	elif len(window) == 12:
		return (w_sum >> 8) + (w_sum >> 9) + (w_sum >> 10);
	elif len(window) == 13:
		return (w_sum >> 8) + (w_sum >> 9);
	elif len(window) == 14:
		return (w_sum >> 8) + (w_sum >> 10);
	elif len(window) == 15:
		return (w_sum >> 8) + (w_sum >> 11);
	elif len(window) == 16:
		return w_sum >> 8;

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
	im_res.putdata(create(im_src, 3))
	im_res.save('../SIM_CHECK/soft' + f)
	# fo = open('../SIM_CHECK/soft' + f + '.dat','w')
	# for pix in im_res.getdata():
	# 	fo.write(str(pix) + '\n')