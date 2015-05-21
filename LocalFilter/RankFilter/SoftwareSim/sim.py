"""
Project
FPGA-Imaging-Library

Design
RankFilter

Function
Local filter - Rank filter, it always used for denoising with preserving edge. 

Module
Software simulation.

Version
1.0

Modified
2015-05-21

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
from RowsGenerator import RowsGenerator as RG
from WindowGenerator import WindowGenerator as WG
user32 = windll.LoadLibrary('user32.dll')
MessageBox = lambda x:user32.MessageBoxA(0, x, 'Error', 0) 

FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']
Debug = False

def show_error(e):
	MessageBox(e)
	exit(0)

def name_format(root, name, ex, conf):
	return '%s-%s-%s-soft%s' % (name, conf['window_width'], conf['rank'], '.bmp')

def rank_filter(window, rank):
	win = []
	for row in window:
		win += row
	return sorted(win)[rank]

def transform(im, conf):
	mode = im.mode
	width = int(conf['window_width'])
	rank = int(conf['rank'])
	if mode not in ['L']:
		show_error('Simulations for this module just supports Gray-scale images, check your images !')
	if width not in [3, 5]:
		show_error('Simulations for this module just supports "window_width" 3 and 5, check your conf !')
	if rank < 0 or rank > width * width - 1:
		show_error('"rank" must greater than 0 and less than window * window - 1, check your conf !')
	data_res = []
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		data_res.append(rank_filter(win, rank))
	im_res = Image.new('L', im.size)
	im_res.putdata(data_res)
	return im_res

def debug(im, conf):
	mode = im.mode
	width = int(conf['window_width'])
	rank = int(conf['rank'])
	if mode not in ['L']:
		show_error('Simulations for this module just supports Gray-scale images, check your images !')
	if width not in [3, 5]:
		show_error('Simulations for this module just supports "window_width" 3 and 5, check your conf !')
	if rank < 0 or rank > width * width - 1:
		show_error('"rank" must greater than 0 and less than window * window - 1, check your conf !')
	data_src = im.getdata()
	data_res = ''
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		data_res += '%d\n' % rank_filter(win, rank)
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