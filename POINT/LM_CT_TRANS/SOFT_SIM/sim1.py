__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

#Out = ct_control * (In + lm_control)

lm_control = 20
ct_control = 0.5

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.jpg':
        	FileAll.append((root+'/',f))

def transform(im):
	data_src = im.getdata()
	data_res = []
	for rgb in data_src:
		p = []
		for c in rgb:
			p.append(int(ct_control * (c + lm_control)))
		data_res.append((p[0],p[1],p[2]))
	return data_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	s_x, s_y = im_src.size
	im_res = Image.new('RGB', (s_x, s_y), 0)
	im_res.putdata(transform(im_src))
	im_res.save('../SIM_CHECK/soft' + f)