__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,re
from Window import Window
from Rows import Rows

ModuleName='ErosionDilationBin'

Mask0 = [
[0,0,0],
[0,1,0],
[0,0,0]
]

MaskE0 = [
[1,1,1,1,1],
[1,1,1,1,1],
[1,1,1,1,1],
[1,1,1,1,1],
[1,1,1,1,1]
]

MaskE1 = [
[1,1,1],
[1,1,1],
[1,1,1]
]

MaskE2 = [
[1,1,1],
[1,1,1],
[0,0,0]
]

MaskE3 = [
[0,0,0],
[1,1,1],
[0,0,0]
]

MaskE4 = [
[0,1,0],
[0,1,0],
[0,1,0]
]

MaskE5 = [
[0,0,0],
[1,1,0],
[0,0,0]
]

MaskE6 = [
[0,1,0],
[0,1,0],
[0,0,0]
]

MaskE7 = [
[1,0,0],
[0,1,0],
[0,0,0]
]

MaskE8 = [
[0,0,1],
[0,1,0],
[0,0,0]
]

MaskD1 = [
[1,1,1],
[1,1,1],
[1,1,1]
]

MaskD2 = [
[1,1,0],
[1,1,0],
[0,0,0]
]

FileAll = []

# mode = 0 : erosion
# mode = 1 : dilation
def erosion_dilation(im, wsize, mask, mode):
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
			pix = 1
			for wy in range(wsize):
				for wx in range(wsize):
					p_w = w[wy][wx] ^ mode
					p_w = p_w | ~mask[wy][wx]
					pix = pix & p_w
			pix = pix ^ mode
			data_res.append(pix)
	return data_res

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if re.findall(r'jpg|bmp',f):
        	FileAll.append((root+'/',f))

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('1',(s_x,s_y))
	im_res.putdata(erosion_dilation(im_src,3,MaskD1,1))
	im_res.save('../SIM_CHECK/softD' + f)
	im_res.putdata(erosion_dilation(im_src,3,MaskE5,0))
	im_res.save('../SIM_CHECK/softE' + f)