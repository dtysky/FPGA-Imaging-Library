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
	font_source[eval(key)] = value
fi.close()

def transform(im,char = [{'pos':(0,0),'index':0x20}]):
	data = list(im.getdata())
	for c in char:
		x0,y0 = c['pos']
		ch = font_source[c['index']]
		print x0,y0,ch
		for y in range(8):
			for x in range(8):
				if int(ch[y*8 + x]):
					data[(y0*8+y)*width + x0*8 + x] = (255,255,255);
				else:
					data[(y0*8+y)*width + x0*8 + x] = (0,0,0);
	return data

char = []


for i in range(95):
	char.append({'pos':(i%grid_width,i/grid_width),'index':0x20 + i})

im_res = Image.new('RGB', (width, height), 0)
im_res.putdata(transform(im_res,char))
im_res.save('../SIM_CHECK/soft.jpg')