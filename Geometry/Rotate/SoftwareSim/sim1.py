# Image processing project : Rotate.
#
# Function: Rotating an image by your given angle.
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
from math import sin, cos, radians

ModuleName='Rotate'

conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in ['.jpg', '.png', '.bmp']:
        	FileAll.append((root+'/', name, ex))

# u = xcenter + (x - xcenter) * cos(a) - (y - ycenter) * sin(a)
# v = ycenter + (x - xcenter) * sin(a) + (y - ycenter) * cos(a)
#
# x = (u -xcenter) * cos(a) + (v - ycenter) * sin(a) + xcenter
# y = (- u + xcenter)  * sin(a) + (v - ycenter) * cos(a) + ycenter
def transform(im, angle):
	def address_gen(u, v, xc, yc):
		sina = sin(angle)
		cosa = cos(angle)
		return \
		int((u - xc) * cosa  + (v - yc) * sina + xc), \
		int((- u + xc) * sina + (v - yc) * cosa + yc)
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(Image.new('L', (xsize, ysize), 0).getdata())
	for u in xrange(ysize):
		for v in xrange(xsize):
			x, y = address_gen(u, v, xsize >> 1, ysize >> 1)
			if x < 0 or y < 0 or x >= xsize or y >= ysize:
				pass
			else:
				data_res[v * xsize + u] = data_src[y * xsize + x]
	return data_res

for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	im_res = im_src.copy()
	for c in conf:
		angle = radians(int(c['angle']))
		im_res.putdata(transform(im_src, angle))
		im_res.save('../SimResCheck/%s-%s-soft.jpg' % (name, c['angle']))