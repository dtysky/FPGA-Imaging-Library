# Image processing project : ColorSpaceConvert.
#
# Function: Convert color space, modes which this module support as follows:
# RGB24 <->  RGB16, CMYK <-> RGB24, RGB24 <-> HSV, RGB24 <-> HSL, RGB24 <-> YCrCb
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
# 	http://ifl.dtysky.moe

# Sources for this project:
# 	https://github.com/dtysky/FPGA-Imaging-Library

# My e-mail:
# 	dtysky@outlook.com

# My blog:
# 	http://dtysky.moe

__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os, json

ModuleName='ColorSpaceConvert'
FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']
Debug = False

def name_format(root, name, ex, conf, key):
	return '%s-%s-soft%s' % (name, conf['mode'], ex)

def transform(im, conf):
	mode = conf['mode']
	data_src = im.getdata()
	data_res = []
	for color in data_src:
		# r = {r[7 : 3], 3'b0}
		# g = {g[7 : 2], 2'b0}
		# b = {b[7 : 3], 2'b0}
		if mode == 'RGB24-RGB16':
			r, g, b = data_src
			r = r >> 3 << 3
			g = g >> 2 << 2
			b = b >> 3 << 3
			data_res.append((r, g,b ))
		# c = 255 - r = ~r
		# m = 255 - g = ~b
		# y = 255 - g = ~b
		elif mode == 'RGB24-CMY':
			r, g, b = data_src
			c = 255 - r
			m = 255 - g
			y = 255 - b
			data_res.append((c, m ,y))
		# k = 
		# c = 255 - r = ~r
		# m = 255 - g = ~b
		# y = 255 - g = ~b
		elif mode == 'RGB24-CMYK':
			r, g, b = data_src

		elif mode == 'RGB24-HSV':

		elif mode == 'RGB24-HSL':

		elif mode == 'RGB24-YCrCb':

		# r = {r, r[4 : 2]}
		# g = {g, g[4 : 3]}
		# b = {b, b[4 : 2]}
		elif mode == 'RGB16-RGB24':
			r, g, b = data_src
			data_res.append( \
				((r << 3) + (r >> 2), (g << 2) + (g >> 4), (b << 3) + (b >> 2))
		# r = 255 - c = ~c
		# g = 255 - m = ~m
		# b = 255 - y = ~y	
		elif mode == 'CMY-RGB24':

		elif mode == 'CMYK-RGB24':

		elif mode == 'HSV-RGB24':

		elif mode == 'HSL-RGB24':

		elif mode == 'YCrCb-RGB24':
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
			debugs = debug(im_src, c)
			for key in dic:
				open('../SimResCheck/%s.dat' \
					% name_format(root, name, ex, c, key), 'w').write(debugs[key])
			continue
		ims = transform(im_src, c)
		for key in ims:
			ims[key].save('../SimResCheck/%s' % name_format(root, name, ex, c, key))