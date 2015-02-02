__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='LM_CT_TRANS'

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def convert(data):
	data_res = []
	for rgb in data[2:]:
		p = []
		for c in rgb.split(','):
			p.append(int(c))
		data_res.append((p[0],p[1],p[2]))
	return list(data_res)

for root,name,ex in FileAll:
	dat_src = open(root+name+ex)
	data_src = dat_src.readlines()
	s_x = int(data_src[0])
	s_y = int(data_src[1])
	im_res = Image.new('RGB',(s_x,s_y),0)
	im_res.putdata(convert(data_src))
	im_res.save('hdl'+name+'.jpg')
	dat_src.close()