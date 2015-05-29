"""
Project
FPGA-Imaging-Library

Design
Scale

Function
Scaling an image by your given scale. 

Module
Software simulation.

Version
1.0

Modified
2015-05-28

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
	return '%s-%sx%s-soft%s' % (name, conf['xscale'], conf['yscale'], '.bmp')

def address_gen(c, cscale):
	return int(round(c / cscale))

def in_range(pos, crange):
	return pos[0] >= crange[2] and pos[0] <= crange[3] and pos[1] >= crange[0] and pos[1] <= crange[1]

def transform(im, conf):
	mode = im.mode
	xscale, yscale = (conf['xscale'], conf['yscale'])
	if mode not in ['L']:
		show_error('Simulations for this module just support Gray-scale images, check your images !')
	if im.size != (512, 512):
		show_error('Simulations for this module just support 512x512 images, check your images !')
	if xscale >= 16 or xscale < 0 or yscale >= 16 or yscale < 0:
		show_error('scales for simulations for this module just supports 0.x - 15.x, check your conf !')
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(Image.new('L', (xsize, ysize), 0).getdata())
	crange = (0, xsize - 1, 0, ysize - 1)
	for y in xrange(ysize):
		for x in xrange(xsize):
			xaddr = address_gen(x, xscale)
			yaddr = address_gen(y, yscale)
			data_res[y * xsize + x] = data_src[yaddr * xsize + xaddr]\
				if in_range((xaddr, yaddr), crange) else 0
	im_res = Image.new(mode, im.size)
	im_res.putdata(data_res)
	return im_res

def debug(im, conf):
	mode = im.mode
	xscale, yscale = (conf['xscale'], conf['yscale'])
	if mode not in ['L']:
		show_error('Simulations for this module just support Gray-scale images, check your images !')
	if im.size != (512, 512):
		show_error('Simulations for this module just support 512x512 images, check your images !')
	if xscale >= 16 or xscale < 0 or yscale >= 16 or yscale < 0:
		show_error('scales for simulations for this module just supports 0.x - 15.x, check your conf !')
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(Image.new('L', (xsize, ysize), 0).getdata())
	crange = (0, xsize - 1, 0, ysize - 1)
	for y in xrange(ysize):
		for x in xrange(xsize):
			xaddr = address_gen(x, xscale)
			yaddr = address_gen(y, yscale)
			data_res[y * xsize + x] = '%s\n' % (
				str(data_src[yaddr * xsize + xaddr]) \
				if in_range((xaddr, yaddr), crange) else '0')
	data_res = ''.join(data_res)
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