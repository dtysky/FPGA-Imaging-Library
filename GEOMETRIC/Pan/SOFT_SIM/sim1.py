# Image processing project : Pan.
#
# Function: Panning a image from your given offset.
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
ModuleName='Pan'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def create(im, xoffset, yoffset):
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = list(data_src)
	for y in xrange(ysize):
		for x in xrange(xsize):
			xaddress = x + xoffset if x + xoffset < xsize else x + xoffset - xsize
			yaddress = y + yoffset if y + yoffset < ysize else y + yoffset - ysize
			if xaddress >= xoffset and yaddress >= yoffset and xaddress < xsize + xoffset and yaddress < ysize + yoffset:
				data_res[yaddress * xsize + xaddress] = data_src[y * xsize + x]
			else:
				data_res[yaddress * xsize + xaddress] = 0
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	im_res.putdata(create(im_src, 100, 100))
	im_res.save('../SIM_CHECK/soft' + f)
	# fo = open('../SIM_CHECK/soft' + f + '.dat','w')
	# for pix in im_res.getdata():
	# 	fo.write(str(pix) + '\n')