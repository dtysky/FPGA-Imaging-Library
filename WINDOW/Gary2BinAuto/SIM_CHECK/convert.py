###########################################################################
#
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
# And you can use this mail to connect me, if you have any issues in this project:
# 	dtysky@outlook.com
#
# My blog is here:
# 	http://dtysky.github.io/
#
###########################################################################


__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Gary2BinAuto'

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def convert(data):
	data_res = []
	for b in data[2:]:
		data_res.append(int(b))
	return list(data_res)

for root,name,ex in FileAll:
	dat_src = open(root + name + ex)
	data_src = dat_src.readlines()
	s_x = int(data_src[0])
	s_y = int(data_src[1])
	im_res = Image.new('1',(s_x,s_y),0)
	im_res.putdata(convert(data_src))
	im_res.save('hdl'+name+'MeanW5.bmp')
	dat_src.close()