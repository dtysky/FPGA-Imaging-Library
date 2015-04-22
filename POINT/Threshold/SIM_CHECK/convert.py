__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os

ModuleName='Threshold'

FileAll = []

for root,dirs,files in os.walk('../HDL_SIM'):
    for f in files:
    	name,ex=os.path.splitext(f)
        if ex=='.res':
        	FileAll.append((root+'/',name,ex))

def convert(mode ,data):
	data_res = []
	if mode in ['Base', 'Contour']:
		for b in data[2:]:
			data_res.append(255 if int(b) == 1 else 0)
	else:
		for b in data[2:]:
			if int(b) == 0:
				data_res.append(0)
			elif int(b) == 1:
				data_res.append(128)
			elif int(b) == 2:
				data_res.append(255)
	return list(data_res)

for root,name,ex in FileAll:
	dat_src = open(root + name + ex)
	data_src = dat_src.readlines()
	s_x = int(data_src[0])
	s_y = int(data_src[1])
	im_res = Image.new('L',(s_x,s_y),0)
	if 'Base' in name:
		im_res.putdata(convert('Base' ,data_src))
	elif 'Ternary' in name:
		im_res.putdata(convert('Ternary', data_src))
	elif 'Contour' in name:
		im_res.putdata(convert('Contour', data_src))
	im_res.save('hdl'+name+'.jpg')
	dat_src.close()