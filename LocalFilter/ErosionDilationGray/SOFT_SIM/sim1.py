__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,re
from Window import Window
from Rows import Rows

ModuleName='ErosionDilation'

MaskE1 = [
[0,1,0],
[1,1,1],
[0,1,0]
]


MaskD1 = [
[0,1,0],
[1,1,1],
[0,1,0]
]

FileAll = []

# mode = 0 : erosion
# mode = 1 : dilation
def erosion_dilation(window, mask, mode):
	w = []
	for y in range(len(window)):
		for x in range(len(window[y])):
			w.append(window[y][x] if mask[y][x] == 1 else -1);
	w_max = max(w)
	w_min = 0
	for p in sorted(w):
		if p != -1:
			w_min = p
			break
	print sorted(w), w_max, w_min
	exit(0)
	return w_min if mode == 0 else w_max

def create(im, wsize, mask, mode):
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
				rows.create(data_src, wsize, xsize)
			w = win.update(rows.update())
			data_res.append(erosion_dilation(w, mask, mode))
	return data_res

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if re.findall(r'jpg|bmp',f):
        	FileAll.append((root+'/',f))

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L',(s_x,s_y))
	im_res.putdata(create(im_src,3,MaskD1,1))
	im_res.save('../SIM_CHECK/softD' + f)
	im_res.putdata(create(im_src,3,MaskE1,0))
	im_res.save('../SIM_CHECK/softE' + f)