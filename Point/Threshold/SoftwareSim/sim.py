"""
Project
FPGA-Imaging-Library

Design
Threshold

Function
Convert gray-scales image to binary images.

Module
Software simulation.

Version
1.0

Modified
2015-05-15

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
	return '%s-%s-%s-%s-soft%s' % (name, conf['mode'], conf['th1'], conf['th2'], '.bmp')

def transform(im, conf):
	mode = im.mode
	th1 = int(conf['th1'])
	th2 = int(conf['th2'])
	if mode not in ['L']:
		show_error('This module just supports Gray-scale images, check your images !')
	if conf['mode'] not in ['Base', 'Contour']:
		show_error('''This module just supports conf "Base" and "Contour", check your conf !''')
	if conf['mode'] == 'Base':
		im_res = im.point(lambda p : 255 if p > th1 else 0)
	else:
		im_res = im.point(lambda p : 255 if p > th1 and p <= th2 else 0)
	return im_res

def debug(im, conf):
	mode = im.mode
	th1 = int(conf['th1'])
	th2 = int(conf['th2'])
	data_src = im.getdata()
	data_res = ''
	if mode not in ['L']:
		show_error('This module just supports Gray-scale images, check your images !')
	if conf['mode'] not in ['Base', 'Contour']:
		show_error('''This module just supports conf "Base" and "Contour", check your conf !''')
	for p in data_src:
		if conf['mode'] == 'Base':
			data_res += '255\n' if p > th1 else '0\n'
		else:
			data_res += '255\n' if p > th1 and p <= th2 else '0\n'
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