__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows
import MeanFitter, RankFitter

ModuleName='GRAY2BINAuto'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(mode, im, wsize):
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
		if mode == 0:
			data_res.append(0 if w[wsize >> 1][wsize >> 1] < MeanFitter.mean_fitter(w) else 1)
		elif mode == 1:
			data_res.append(0 if w[wsize >> 1][wsize >> 1] < RankFitter.rank_fitter(w, wsize * wsize >> 1) else 1)
		w = win.update(rows.update())
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('1', (s_x, s_y), 0)
	im_res.putdata(transform(0, im_src ,5))
	im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MeanW5.bmp')
	# im_res.putdata(transform(0, im_src ,15))
	# im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MeanW15.bmp')
	# im_res.putdata(transform(1, im_src, 5))
	# im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MedianW5.bmp')
	# im_res.putdata(transform(1, im_src, 15))
	# im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MedianW15.bmp')