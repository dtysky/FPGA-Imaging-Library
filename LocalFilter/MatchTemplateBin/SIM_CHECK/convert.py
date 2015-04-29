__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='MatchTemplateBin'

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def convert(data):
	data_res = []
	for bin in data[2:]:
		data_res.append(int(bin))
	return list(data_res)

for root,name,ex in FileAll:
	dat_src = open(root+name+ex)
	data_src = dat_src.readlines()
	s_x = int(data_src[0])
	s_y = int(data_src[1])
	im_res = Image.new('1',(s_x,s_y),0)
	im_res.putdata(convert(data_src))
	im_res.save('hdl'+name+'.bmp')
	dat_src.close()