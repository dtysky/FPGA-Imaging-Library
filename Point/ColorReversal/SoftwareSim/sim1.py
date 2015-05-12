# Image processing project : ColorReversal.
#
# Function: Get a reversal all ponit's color.
#
# Software simulation.
#
# Copyright (C) 2015  Dai Tianyu (dtysky)
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#
# Homepage for this project:
# 	http://fil.dtysky.moe

# Sources for this project:
# 	https://github.com/dtysky/FPGA-Imaging-Library

# My e-mail:
# 	dtysky@outlook.com

# My blog:
# 	http://dtysky.moe

__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os, json

ModuleName='ColorReversal'
FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']
Debug = True

def name_format(root, name, ex, conf):
	return '%s-soft%s' % (name, ex)

def transform(im, conf):
	mode = im.mode
	data_src = im.getdata()
	data_res = []
	for color in data_src:
		if mode == 'RGB':
			data_res.append((255 - color[0], 255 - color[1], 255 - color[2]))
		else:
			data_res.append(255 - color)
	im_res = im.copy()
	im_res.putdata(data_res)
	return im_res

def debug(im, conf):
	mode = im.mode
	data_src = im.getdata()
	data_res = ''
	for color in data_src:
		if mode == 'RGB':
			data_res += '%d %d %d\n' % (255 - color[0], 255 - color[1], 255 - color[2])
		else:
			data_res += '%d\n' % (255 - color)
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