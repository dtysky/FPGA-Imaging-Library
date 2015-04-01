__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,re
from Window import Window
from Rows import Rows

ModuleName='MatchTemplateBin'

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
		w = win.update(rows.update())
		if win.is_enable():
			break
	for y in range(ysize):
		for x in range(xsize):
			if rows.frame_empty():
				rows.create(data_src, wsize, xsize)
			data_res.append(1 if w == mask else 0)
			w = win.update(rows.update())
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