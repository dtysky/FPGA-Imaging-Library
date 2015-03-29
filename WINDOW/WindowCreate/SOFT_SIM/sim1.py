__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from RowsCreat import Rows

ModuleName='WindowCreat'

FileAll = []

class Window():
	"""A class for creating and maintaining a window."""
	def __init__(self, wsize):
		self.creat(wsize)
	def creat(self, wsize):
		self.enable = False
		self.init = 0
		self.window = []
		self.wsize = wsize
		self.wsize_half = wsize >> 1
		for y in range(wsize):
			self.window.append([])
			for x in range(wsize):
				self.window[y].append(0)
	def update(self, rows_col):
		if self.init == self.wsize_half:
			self.enable = True
		else:
			self.init += 1
		window_last = list(self.window)
		for y in range(self.wsize):
			self.window[y].pop()
			self.window[y].insert(0, rows_col[y])
		return window_last
	def is_enable(self):
		return self.enable

def creat(im, wsizes):
	data_res = []
	data_src = im.getdata()
	xsize,ysize = im.size
	windows = []
	for wsize in wsizes:
		windows.append(Window(wsize))
	for win in windows:
		wsize = win.wsize
		wsize_half = win.wsize_half
		rows = Rows(data_src, max(wsizes), xsize)
		for y in range(ysize):
			for x in range(xsize):
				if rows.frame_empty():
					rows = Rows(data_src, max(wsizes), xsize)
				w = win.update(rows.update())
				if not win.is_enable():
					continue
				dbg_tmp = str(y) + ' , ' + str(x - wsize_half) + ':\n'
				for py in range(wsize):
					for px in range(wsize):
						dbg_tmp += str(w[py][px]) + ','
					dbg_tmp = dbg_tmp[:-1] + '\n'
				data_res.append(dbg_tmp)
	return data_res

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

for root,f in FileAll:
	im_src = Image.open(root+f)
	wsizes = [3,5]
	fo = open('../SIM_CHECK/dbg' + f + '.dat','w')
	for w in creat(im_src, wsizes):
		fo.write(str(w) + '\n')
	fo.close()