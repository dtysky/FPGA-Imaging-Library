# Image processing project : Mirror.
#
# Function: Getting a mirror of your given image.
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
# Documents for all modules:
# 	http://ifl.dtysky.moe

# All modules for image processing project:
# 	https://github.com/dtysky/FPGA-Imaging-Library

# This mail is for connecting me:
# 	dtysky@outlook.com

# My blog is here:
# 	http://dtysky.moe

__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Mirror'

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in ['.jpg', '.png', '.bmp']:
        	FileAll.append((root+'/', name, ex))

# mode: 0 for horizontal, 1 for vertical, 2 for all
def create(im, mode):
	def address_gen(x, y, xmax, ymax):
		if mode == 0:
			return xmax - x, y
		elif mode == 1:
			return x, ymax - y
		return xmax - x, ymax - y
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(data_src)
	for y in xrange(ysize):
		for x in xrange(xsize):
			xaddress, yaddress = address_gen(x, y, xsize - 1, ysize - 1)
			data_res[yaddress * xsize + xaddress] = data_src[y * xsize + x]
	return data_res

for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	im_res = im_src.copy()
	im_res.putdata(create(im_src, 0))
	im_res.save('../SimResCheck/soft' + name + 'Hori.jpg')
	im_res.putdata(create(im_src, 1))
	im_res.save('../SimResCheck/soft' + name + 'Vert.jpg')
	im_res.putdata(create(im_src, 2))
	im_res.save('../SimResCheck/soft' + name + 'All.jpg')