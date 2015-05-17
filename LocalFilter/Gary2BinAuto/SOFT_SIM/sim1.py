# Software simulation for "Gary2BinAuto".
# Module function: Auto binorization from original pixel and a pixel for referencing, 
# the original pixel will be given by a window, and ref pixel may from some fitters.
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
# 	http://dtysky.github.io/

__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows
import MeanFitter, RankFitter

ModuleName='GRAY2BINAuto'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(mode, im, wsize):
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	rows = Rows(data_src, wsize, xsize)
	win = Window(wsize)
	while 1:
		w = win.update(rows.update())
		if win.is_enable():
			break
	for i in range(len(data_src)):
		if rows.frame_empty():
			rows.create(data_src, wsize, xsize)
		if mode == 0:
			data_res.append(0 if w[wsize >> 1][wsize >> 1] < MeanFitter.mean_fitter(w) else 1)
		elif mode == 1:
			data_res.append(0 if w[wsize >> 1][wsize >> 1] < RankFitter.rank_fitter(w, wsize * wsize >> 1) else 1)
		w = win.update(rows.update())
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('1', (s_x, s_y), 0)
	im_res.putdata(transform(0, im_src ,5))
	im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MeanW5.bmp')
	# im_res.putdata(transform(0, im_src ,15))
	# im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MeanW15.bmp')
	# im_res.putdata(transform(1, im_src, 5))
	# im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MedianW5.bmp')
	# im_res.putdata(transform(1, im_src, 15))
	# im_res.save('../SIM_CHECK/soft' + f.split('.')[0] + 'MedianW15.bmp')