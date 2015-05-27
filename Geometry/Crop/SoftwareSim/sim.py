"""
Project
FPGA-Imaging-Library

Design
Crop

Function
Cropping images, depending on your top, bottom, left and right coordinate. 

Module
Software simulation.

Version
1.0

Modified
2015-05-26

Copyright (C) 2015 Tianyu Dai (dtysky) <dtysky@outlook.com>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Homepage for this project:
	http://fil.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe
"""

__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image
import os, json
from ctypes import *
user32 = windll.LoadLibrary('user32.dll')
MessageBox = lambda x:user32.MessageBoxA(0, x, 'Error', 0) 

FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']
Debug = False

def show_error(e):
	MessageBox(e)
	exit(0)

def name_format(root, name, ex, conf):
	return '%s-%sx%sx%sx%s-soft%s' % (name, conf['top'], conf['bottom'], conf['left'], conf['right'], '.bmp')

def in_range(pos, crange):
	return pos[0] >= crange[2] and pos[0] <= crange[3] and pos[1] >= crange[0] and pos[1] <= crange[1]

def transform(im, conf):
	mode = im.mode
	crange = (conf['top'], conf['bottom'], conf['left'], conf['right'])
	if mode not in ['RGB', 'L']:
		show_error('Simulations for this module just supports RGB and Gray-scale images, check your images !')
	if im.size != (512, 512):
		show_error('Simulations for this module just supports 512x512 images, check your images !')
	data_src = im.getdata()
	data_res = []
	xsize, ysize = im.size
	for y in xrange(ysize):
		for x in xrange(xsize):
			if mode == 'RGB':
				data_res.append(data_src[y * xsize + x] if in_range((x,y), crange) else (0, 0, 0))
			else:
				data_res.append(data_src[y * xsize + x] if in_range((x,y), crange) else 0)
	im_res = Image.new(mode, im.size)
	im_res.putdata(data_res)
	return im_res

def debug(im, conf):
	mode = im.mode
	crange = (conf['top'], conf['bottom'], conf['left'], conf['right'])
	if mode not in ['RGB', 'L']:
		show_error('Simulations for this module just supports RGB and Gray-scale images, check your images !')
	if im.size != (512, 512):
		show_error('Simulations for this module just supports 512x512 images, check your images !')
	data_src = im.getdata()
	data_res = ''
	xsize, ysize = im.size
	for y in xrange(ysize):
		for x in xrange(xsize):
			if mode == 'RGB':
				data_res += '%d %d %s\n' % (x, y, \
					str(data_src[y * xsize + x]).replace('(','').replace(')','').replace(', ',' ')\
					if in_range((x,y), crange) else '0 0 0')
			else:
				data_res += '%d %d %s\n' % (x, y, \
					str(data_src[y * xsize + x]).replace('(','').replace(')','').replace(', ',' ')\
					if in_range((x,y), crange) else '0')
	return data_res

FileAll = []
for root, dirs, files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in FileFormat:
        	FileAll.append((root+'/', name, ex))
for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	for c in Conf:
		if Debug:
			open('../SimResCheck/%s.dat' \
				% name_format(root, name, ex, c), 'w').write(debug(im_src, c))
			continue
		transform(im_src, c).save('../SimResCheck/%s' % name_format(root, name, ex, c))