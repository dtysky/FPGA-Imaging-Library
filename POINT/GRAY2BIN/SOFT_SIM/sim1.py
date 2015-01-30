__author__ = 'dtysky'

from PIL import Image

img_num = 2

th = 100

def transform(im):
	data_src = im.getdata()
	data_res = []
	for gray in data_src:
		data_res.append(0 if gray<th else 1)
	return data_res

for i in range(img_num):
	im_src = Image.open('img' + str(i) + '.jpg')
	s_x, s_y = im_src.size
	im_res = Image.new('1', (s_x, s_y), 0)
	im_res.putdata(transform(im_src))
	im_res.save('res' + str(i) + '.jpg')