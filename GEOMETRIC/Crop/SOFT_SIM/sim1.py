__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Crop'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1] in ['.jpg']:
        	FileAll.append((root+'/',f))

#range : top, bottom, left, right
def create(im, crop_range):
	def in_range(pos):
		#pos : x, y
		return pos[0] >= crop_range[2] and pos[0] <= crop_range[3] and pos[1] >= crop_range[0] and pos[1] <= crop_range[1]
	data_src = im.getdata()
	xsize,ysize = im.size
	data_res = []
	for y in range(ysize):
		for x in range(xsize):
			pix = data_src[y * xsize + x]
			if in_range((x, y)):
				data_res.append(pix)
			else:
				data_res.append(0)
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('L', (s_x, s_y), 0)
	im_res.putdata(create(im_src, (40, 200, 40, 280)))
	im_res.save('../SIM_CHECK/soft' + f)