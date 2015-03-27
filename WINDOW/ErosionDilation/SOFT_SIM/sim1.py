__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,re
from WindowCreat import Window
from RowsCreat import Rows

ModuleName='ErosionDilation'

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

def is_same(im, wsize, mask):
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

# act = 0 : erosion
# act = 1 : dilation
def erosion_dilation(im, wsize, mask, act):
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
			pix = 1
			for wy in range(wsize):
				for wx in range(wsize):
					p_w = w[wy][wx] ^ act
					p_w = p_w | ~mask[wy][wx]
					pix = pix & p_w
			pix = pix ^ act
			data_res.append(pix)
	return data_res

def ims_or(ims, xsize, ysize):
	data_res = list(ims[0])
	for y in range(ysize):
		for x in range(xsize):
			for p_src in ims:
				data_res[y * xsize + x] = (data_res[y * xsize + x] | p_src[y * xsize + x])
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
	im_res.putdata(erosion_dilation(im_res,5,MaskE0,0))
	for i in range(12):
		im_res.putdata(ims_or(
			[erosion_dilation(im_res,3,MaskE5,0),
			erosion_dilation(im_res,3,MaskE6,0),
			erosion_dilation(im_res,3,MaskE7,0),
			erosion_dilation(im_res,3,MaskE8,0),
			is_same(im_res,3,Mask0)],
			s_x,s_y
			))
	im_res.save('../SIM_CHECK/soft' + f)