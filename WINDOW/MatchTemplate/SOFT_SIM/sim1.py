__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,re
from WindowCreat import Window
from RowsCreat import Rows

ModuleName='MatchTemplate'

Mask0 = [
[0,0,0],
[0,255,0],
[0,0,0]
]

FileAll = []

def match_template(im, wsize, mask):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	rows = Rows(data_src, wsize, xsize)
	win = Window(wsize)
	while 1:
		win.update(rows.update())
		if win.is_enable():
			break
	for y in range(ysize):
		for x in range(xsize):
			if rows.frame_empty():
				rows = Rows(data_src, wsize, xsize)
			w = win.update(rows.update())
			pix = 0
			for wy in range(wsize):
				for wx in range(wsize):
					pix = pix | (w[wy][wx] ^ mask[wy][wx])
			data_res.append(1 if pix == 0 else 0)
	return data_res

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if re.findall(r'jpg|bmp',f):
        	FileAll.append((root+'/',f))

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('1',(s_x,s_y))
	im_res.putdata(match_template(im_src,3,Mask0))
	im_res.save('../SIM_CHECK/soft' + f)