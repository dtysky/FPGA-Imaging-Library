__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='MatchTemplateBin'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex in ['.jpg','.bmp']:
        	FileAll.append((root+'/',name,ex))

def color_formot(color):
	if color == 0:
		res = '0'
	else:
		res = '1'
	return res

def create_dat(im):
	data_src = im.getdata()
	data_res = ''
	for gray in data_src:
		data_res += color_formot(gray)
		data_res += '\n'
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