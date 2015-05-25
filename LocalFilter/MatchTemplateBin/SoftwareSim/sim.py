"""
Project
FPGA-Imaging-Library

Design
MatchTemplateBin

Function
Match a binary from template for binary images. 

Module
Software simulation.

Version
1.0

Modified
2015-05-25

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
	return '%s-%s-soft%s' % (name, c, '.bmp')

def transform(im, conf):
	mode = im.mode
	template = conf['template']
	if mode not in ['1']:
		show_error('Simulations for this module just supports binary images, check your images !')
	for row in template:
		if len(template) != len(row):
			show_error('every row in "template" must equal to length of template, check your conf !')
		if len(template) not in [3, 5]:
			show_error('size of "template" must equal to e or 5, check your conf !')
		for p in row:
			if p not in [0, 1]:
				show_error('Elements in "template" must equal to 0 or 1, check your conf !')
	template = eval(str(template).replace('1', '255'))
	width = len(template)
	data_res = []
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		data_res.append(1 if win == template else 0)
	im_res = Image.new('1', im.size)
	im_res.putdata(data_res)
	return im_res

def debug(im, conf):
	mode = im.mode
	template = conf['template']
	if mode not in ['1']:
		show_error('Simulations for this module just supports binary images, check your images !')
	for row in template:
		if len(template) != len(row):
			show_error('every row in "template" must equal to length of template, check your conf !')
		if len(template) not in [3, 5]:
			show_error('size of "template" must equal to e or 5, check your conf !')
		for p in row:
			if p not in [0, 1]:
				show_error('Elements in "template" must equal to 0 or 1, check your conf !')
	width = len(template)
	data_res = ''
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		data_res += '%d\n' % 1 if win == template else 0
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