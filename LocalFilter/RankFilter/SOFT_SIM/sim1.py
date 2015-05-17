__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows

ModuleName='RankFitter'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def rank_fitter(window, rank):
	w= []
	for row in window:
		w = w + row
	big_counter = []
	res = []
	for i in range(len(w)):
		big_counter.append(0)
		res.append(0)
	for i in range(len(w)):
		for j in range(i + 1, len(w)):
			if w[i] >= w[j]:
				big_counter[i] += 1
			else:
				big_counter[j] += 1
	for i in range(len(big_counter)):
		res[big_counter[i]] = w[i]
	return res[rank]

def create(im, wsize, rank):
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
		data_res.append(rank_fitter(w, rank))
		w = win.update(rows.update())
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	im_res.putdata(create(im_src, 3, 4))
	im_res.save('../SIM_CHECK/soft' + f)
	# fo = open('../SIM_CHECK/soft' + f + '.dat','w')
	# for pix in im_res.getdata():
	# 	fo.write(str(pix) + '\n')