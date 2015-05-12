# Image processing project : Threshold.
#
# Function: Thresholding depend on two threshold,
# convert the grayscale image to ternary or binary image.
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
# This module is a part of image processing project, you can get all of them here:
# 	https://github.com/dtysky/Image-processing-on-FPGA
#
# This mail is for connecting me:
# 	dtysky@outlook.com
#
# My blog is here:
# 	http://dtysky.moe/

__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Threshold'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(mode, im, th1 = 100, th2 = 200):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	for pixel in data_src:
		if mode == 'Base':
			data_res.append(255 if pixel > th1 else 0)
		elif mode == 'Ternary':
			if pixel <= th1:
				data_res.append(0)
			elif pixel <= th2:
				data_res.append(128)
			else:
				data_res.append(255)
		elif mode == 'Contour':
			data_res.append(255 if pixel > th1 and pixel <= th2 else 0)
		else:
			data_res.append(0)
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	im_res.putdata(transform('Base', im_src ,128))
	im_res.save('../SIM_CHECK/soft' + f.split('.')[0] +'Base.jpg')
	im_res.putdata(transform('Ternary', im_src ,100 ,200))
	im_res.save('../SIM_CHECK/soft' + f.split('.')[0] +'Ternary.jpg')
	im_res.putdata(transform('Contour', im_src ,100 ,200))
	im_res.save('../SIM_CHECK/soft' + f.split('.')[0] +'Contour.jpg')