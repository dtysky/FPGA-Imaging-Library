__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

width = 320
height = 180

grid_width = width/8
grid_height = height/8

font_source = {}
fi = open('FONT_SOURCE.dat','r')
for l in fi.read().splitlines():
	key,value = l.split(':')
	font_source[eval(key)] = eval(value)
fi.close()

def transform(im,pos = [(0,0),],index=[0x20,]):
	data = im.getdata()
	for p in pos:
		x0,y0 = p
		char = font_source[index]
		for x in range(8):
			for y in range(8):
				if char[x*8 + y]:
					data[x0*8 + x*8 + y0*8 + y] = (255,255,255);
				else:
					data[x0*8 + x*8 + y0*8 + y] = (0,0,0);
	return data

pos = []
index = []

for i in range(95):
	index.append(0x20 + i)
	pos.append((i/grid_width,i%grid_width))

im_res = Image.new('RGB', (width, height), 0)
im_res.putdata(transform(im_res,pos.index))
im_res.save('../SIM_CHECK/soft.jpg')