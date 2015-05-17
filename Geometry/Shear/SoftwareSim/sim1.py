# Image processing project : Shear.
#
# Function: Shearing an image by your given sh.
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

ModuleName='Shear'

conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in ['.jpg', '.bmp']:
        	FileAll.append((root+'/', name, ex))


# x = u + shv * v
# y = v + shu * u 
def transform(im, shu, shv):
	def address_gen(u, v):
		return int(u + shv * v), int(v + shu * u)
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(Image.new('L', (xsize, ysize), 0).getdata())
	for u in xrange(ysize):
		for v in xrange(xsize):
			x, y = address_gen(u, v)
			if x < 0 or y < 0 or x >= xsize or y >= ysize:
				pass
			else:
				data_res[v * xsize + u] = data_src[y * xsize + x]
	return data_res

for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	im_res = im_src.copy()
	for c in conf:
		shu = float(c['shu'])
		shv = float(c['shv'])
		im_res.putdata(transform(im_src, shu, shv))
		im_res.save('../SimResCheck/%s-%sx%s-soft.jpg' % (name, c['shu'], c['shv']))