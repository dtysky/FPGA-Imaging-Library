__author__ = 'dtysky'

from PIL import Image
import os

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.jpg':
        	FileAll.append((root+'/',name,ex))

def color_formot(color):
	res=bin(color)[2:]
	for i in range(8-len(res)):
		res = '0'+res
	return res

def creat_dat(im):
	data_src = im.getdata()
	data_res = ''
	for rgb in data_src:
		for c in rgb:
			data_res += color_formot(c)
		data_res +='\n'
	return data_res[:-1]

def creat_mif(im):
	pass

for root,name,ex in FileAll:
	im_src = Image.open(root+name+ex)
	s_x, s_y = im_src.size
	dat_res = open('img'+name+'.dat','w')
	dat_res.write(creat_dat(im_src))
	dat_res.close()