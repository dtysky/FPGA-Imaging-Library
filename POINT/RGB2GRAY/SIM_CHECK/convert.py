__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='RGB2GRAY'

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def color_formot(color):
	res=bin(color)[2:]
	for i in range(8-len(res)):
		res = '0'+res
	return res

def convert(fp):
	data_src = fp.readline
	data_res = ''
	for rgb in data_src:
		for c in rgb:
			data_res += color_formot(c)
		data_res +='\n'
	return data_res[:-1]

dat_index = ''

for root,name,ex in FileAll:
	im_src = Image.open(root+name+ex)
	s_x, s_y = im_src.size
	dat_res = open('../HDL_SIM/img'+name+'.dat','w')
	dat_res.write(creat_dat(im_src))
	dat_index += 'img'+name+'\n'
	dat_res.close()

dat_index = dat_index[:-1]
dat_index_f = open('../HDL_SIM/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()