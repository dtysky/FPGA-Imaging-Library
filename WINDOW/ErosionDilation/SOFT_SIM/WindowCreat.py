__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='WindowCreat'

FileAll = []

def window_creat(wsize,data_src,xsize,ysize,xnow,ynow):
	window = []
	wsize_half = wsize >> 1
	for y in range(wsize):
		for x in range(wsize):
			xoffset = 0 if xnow - wsize_half + x >= xsize else xnow - wsize_half + x
			yoffset = 0 if ynow - wsize_half + y >= ysize else ynow - wsize_half + y
			window.append(data_src[yoffset * xsize + xoffset])
	return window