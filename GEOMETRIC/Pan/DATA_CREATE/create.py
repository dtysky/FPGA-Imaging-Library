__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Pan'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex in ['.jpg','.bmp']:
        	FileAll.append((root+'/',name,ex))

def color_formot(color):
	res=bin(color)[2:]
	for i in range(8-len(res)):
		res = '0'+res
	return res

def create_dat(im):
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = ''
	all_size = xsize * ysize - 1
	for y in range(ysize):
		for x in range(xsize):
			data_res += color_formot(xsize - 1 - x) + '\n'
			data_res += color_formot(ysize - 1 - y) + '\n'
			data_res += color_formot(data_src[(ysize - 1 - y) * xsize + (xsize - 1 - x)]) + '\n'
	return data_res[:-1]

def create_mif(im):
	pass

dat_index = ''

for root,name,ex in FileAll:
	im_src = Image.open(root+name+ex)
	s_x, s_y = im_src.size
	dat_res = open('../HDL_SIM/'+name+'.dat','w')
	dat_res.write(str(s_x)+'\n'+str(s_y)+'\n')
	dat_res.write(create_dat(im_src))
	dat_index += name+'\n'
	dat_res.close()

dat_index = dat_index[:-1]
dat_index_f = open('../HDL_SIM/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()