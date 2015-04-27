# Image processing project : Scale.
#
# Function: Scaling an image by your given scale.
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

ModuleName='Scale'

conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in ['.jpg', '.png', '.bmp']:
        	FileAll.append((root+'/', name, ex))

def transform(im, xscale, yscale):
	def address_gen(x, y):
		return int(x / xscale), int(y / yscale)
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(Image.new('L', (xsize, ysize), 0).getdata())
	for y in xrange(ysize):
		for x in xrange(xsize):
			xaddress, yaddress = address_gen(x, y)
			if xaddress < 0 or xaddress >= xsize or yaddress < 0 or yaddress >= ysize:
				pass
			else:
				data_res[y * xsize + x] = data_src[yaddress * xsize + xaddress]
	return data_res

for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	im_res = im_src.copy()
	for c in conf:
		xscale = float(c['xscale'])
		yscale = float(c['yscale'])
		im_res.putdata(transform(im_src, xscale, yscale))
		im_res.save('../SimResCheck/%s-%sx%s-soft.jpg' % (name, c['xscale'], c['yscale']))