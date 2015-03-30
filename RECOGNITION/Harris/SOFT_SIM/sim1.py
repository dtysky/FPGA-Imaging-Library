__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows
from MeanFitter import mean_fitter

ModuleName='Harris'

Top = 15
Bottom = 205
Left = 60
Right = 280

FileAll = []

def fitter(im, wsize):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	rows = Rows(data_src, wsize, xsize)
	win = Window(wsize)
	while 1:
		win.update(rows.update())
		if win.is_enable():
			break
	for i in range(len(data_src)):
		if rows.frame_empty():
			rows = Rows(data_src, wsize, xsize)
		w = win.update(rows.update())
		if win.is_enable():
			data_res.append(mean_fitter(w))
	return data_res

def harris(im, d_value):
	def in_range(x,y):
		return x > Left and x < Right and y > Top and y < Bottom
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	now_pix = 0
	last_pix_col = 0
	last_pix_row = []
	rows = Rows(data_src, 3, xsize)
	win = Window(3)
	while 1:
		win.update(rows.update())
		if win.is_enable():
			break
	for y in range(ysize):
		for x in range(xsize):
			if rows.frame_empty():
				rows.create(data_src, 3, xsize)
			w = win.update(rows.update())
			pix_tblr = [w[0][1],w[2][1],w[1][2],w[1][0]]
			pix_now = w[1][1]
			diff_tblr = []
			for pix in pix_tblr:
				diff_tblr.append(abs(pix_now - pix))
			pix_res = 0
			if in_range(x,y):
				for d_tb in diff_tblr[0:2]:
					for d_lr in diff_tblr[2:4]:
						if d_tb >= d_value and d_lr >= d_value:
							pix_res = 1
			data_res.append(pix_res)
	return data_res

def harris_mark(im,harris_res):
	xsize,ysize = im.size
	im_res = im.copy()
	for y in range(ysize):
		for x in range(xsize):
			if harris_res[y * xsize + x]:
				im_res.putpixel((x,y),255)
	return im_res

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

for root,f in FileAll:
	im_src = Image.open(root+f)
	im_tmp = im_src.copy()
	im_tmp.putdata(fitter(im_src, 3))
	harris_res = harris(im_tmp, 5)
	im_res = Image.new('1',im_src.size)
	im_res.putdata(harris_res)
	im_res.save('../SIM_CHECK/soft' + f + '.bmp')
	im_res = harris_mark(im_src,harris_res)
	im_res.save('../SIM_CHECK/soft_mark' + f)