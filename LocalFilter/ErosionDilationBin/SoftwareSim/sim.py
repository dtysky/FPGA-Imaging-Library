"""
Project
FPGA-Imaging-Library

Design
ErosionDilationBin

Function
Erosion or Dilation for binary images. 

Module
Software simulation.

Version
1.0

Modified
2015-05-22

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
	c = ''
	for row in conf['template']:
		c += str(row).replace('[', "").replace(']', "").replace(', ', "")
	return '%s-%s-%s-soft%s' % (name, conf['mode'], c, '.bmp')

def transform(im, conf):
	mode = im.mode
	template = conf['template']
	ed_mode = conf['mode']
	if mode not in ['1']:
		show_error('Simulations for this module just supports binary images, check your images !')
	if ed_mode not in ['Erosion', 'Dilation']:
		show_error('"filter" just supports "Erosion" and "Dilation", check your conf !')
	for row in template:
		if len(template) != len(row):
			show_error('every row in "template" must equal to length of template, check your conf !')
	ed_mode = 0 if ed_mode == 'Erosion' else 1
	width = len(template)
	data_res = []
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		pix = 1
		for wy in xrange(width):
			for wx in xrange(width):
				p_w = win[wy][wx] ^ ed_mode
				p_w = p_w | ~template[wy][wx]
				pix = pix & p_w
		pix = pix ^ ed_mode
		data_res.append(pix)
	im_res = Image.new('1', im.size)
	im_res.putdata(data_res)
	return im_res

def debug(im, conf):
	mode = im.mode
	template = conf['template']
	ed_mode = conf['mode']
	if mode not in ['L']:
		show_error('Simulations for this module just supports binary images, check your images !')
	if ed_mode not in ['Erosion', 'Dilation']:
		show_error('"filter" just supports "Erosion" and "Dilation", check your conf !')
	for row in template:
		if len(template) != len(row):
			show_error('every row in "template" must equal to length of template, check your conf !')
	ed_mode = 0 if ed_mode == 'Erosion' else 1
	width = len(template)
	data_res = ''
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		pix = 1
		for wy in xrange(width):
			for wx in xrange(width):
				p_w = w[wy][wx] ^ ed_mode
				p_w = p_w | ~mask[wy][wx]
				pix = pix & p_w
		pix = pix ^ ed_mode
		data_res += '%d\n' % pix
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