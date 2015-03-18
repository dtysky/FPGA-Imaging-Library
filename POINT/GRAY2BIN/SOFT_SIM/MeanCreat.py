__author__ = 'Dai Tianyu (dtysky)'

import WindowCreat

ModuleName='MeanCreat'

def mean_th_creat(window):
	s = sum(window)
	return s / len(window)

def mid_creat(window):
	return sorted(window)[len(window)/2]

def mean_creat(im,wsize):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	for y in range(ysize):
		for x in range(xsize):
			gray = data_src[y * xsize + x]
			window = WindowCreat.window_creat(wsize,data_src,xsize,ysize,x,y)
			th = mean_th_creat(window)
			data_res.append(th)
	return data_res