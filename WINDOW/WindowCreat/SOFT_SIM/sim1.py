__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='WindowCreat'

FileAll = []

def fifo_init(wsize):
	fifos = []
	for y in range(WindowSize):
		fifos.append([])
		for x in range(WindowSize):
			fifos.append(0)
	return fifos

def window_creat(wsize,data_src,xsize,ysize,xnow,ynow):

	window = []
	wsize_half = wsize >> 1
	for y in range(wsize):
		for x in range(wsize):
			xoffset = 0 if xnow - wsize_half + x >= xsize else xnow - wsize_half + x
			yoffset = 0 if ynow - wsize_half + y >= ysize else ynow - wsize_half + y
			window.append(data_src[yoffset * xsize + xoffset])
	return window

def creat(wsize,im):
	fifos = fifo_init(wsize)
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	for y in range(ysize):
		for x in range(xsize):
			gray = data_src[y * xsize + x]
			window = window_creat(9,data_src,xsize,ysize,x,y)
			dbg_tmp = str(y) + ' , ' + str(x) + ':\n'
			pi = 0
			for py in range(3):
				for px in range(3):
					dbg_tmp += str(window[pi]) + ','
					pi += 1
				dbg_tmp += '\n'
			data_res.append(dbg_tmp)
	return data_res

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

for root,f in FileAll:
	im_src = Image.open(root+f)
	fo = open('../SIM_CHECK/dbg' + f + '.dat','w')
	for w in creat(im_src):
		fo.write(str(w) + '\n')
	fo.close()