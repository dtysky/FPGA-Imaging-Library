# Image processing project : AffineTrans.
#
# Function: Affine transformation.
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

ModuleName='AffineTrans'

conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in ['.jpg', '.bmp']:
        	FileAll.append((root+'/', name, ex))


# u = aux x + auy y + au
# v = avx x + avy y + av
#
# x = (auy * av - au * avy + avy * u - auy * v) / (aux * avy - auy * avx)
# y = (-aux * av + au * avx - avx * u + aux * v) / (aux * avy - auy * avx)
#
# ax = (auy * av - au * avy) / (aux * avy - auy * avx)
# axu = avy / (aux * avy - auy * avx)
# axv = -auy / (aux * avy - auy * avx)
# ay = (-aux * av + au * avx) / (aux * avy - auy * avx)
# ayu = -avx / (aux * avy - auy * avx)
# ayv = aux / (aux * avy - auy * avx)

# x = axu * u + axv * v + ax
# y = ayu * u + ayv * v + ay

def transform(im, aux, auy, au, avx, avy, av):
	ax = (auy * av - au * avy) / (aux * avy - auy * avx)
	axu = avy / (aux * avy - auy * avx)
	axv = -auy / (aux * avy - auy * avx)
	ay = (-aux * av + au * avx) / (aux * avy - auy * avx)
	ayu = -avx / (aux * avy - auy * avx)
	ayv = aux / (aux * avy - auy * avx)
	def address_gen(u, v):
		return int(axu * u + axv * v + ax), int(ayu * u + ayv * v + ay)
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
		aux = float(c['aux'])
		auy = float(c['auy'])
		au = float(c['au'])
		avx = float(c['avx'])
		avy = float(c['avy'])
		av = float(c['av'])
		im_res.putdata(transform(im_src, aux, auy, au, avx, avy, av))
		im_res.save('../SimResCheck/%s-%sx%sx%s-%sx%sx%s-soft.jpg' % \
			(name, c['aux'], c['auy'], c['au'], c['avx'], c['avy'], c['av']))