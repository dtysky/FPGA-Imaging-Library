__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='ChessWindowFiter'

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.bmp':
        	FileAll.append((root+'/',name,ex))

def color_formot(color):
	res = '0'
	if int(color):
		res = '1'
	return res

def creat_dat(im):
	data_src = im.getdata()
	data_res = ''
	for gray in data_src:
		data_res += color_formot(gray)
		data_res += '\n'
	return data_res[:-1]

def creat_mif(im):
	pass

dat_index = ''

for root,name,ex in FileAll:
	im_src = Image.open(root+name+ex)
	s_x, s_y = im_src.size
	dat_res = open('../HDL_SIM/'+name+'.dat','w')
	dat_res.write(str(s_x)+'\n'+str(s_y)+'\n')
	dat_res.write(creat_dat(im_src))
	dat_index += name+'\n'
	dat_res.close()

dat_index = dat_index[:-1]
dat_index_f = open('../HDL_SIM/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()