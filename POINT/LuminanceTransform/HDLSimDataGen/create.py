__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image
import os, json

ModuleName='LuminanceTransform'
FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

def name_format(root, name, ex, conf):
	return '%s-%s' % (name, conf['lm_gain'])

def conf_format(im, conf):
	c = conf['lm_gain']
	r = [bin(int(c)).split('0b').pop()]
	r.insert(0, '1' if c < 0 else '0')
	for i in xrange(12 - len(r[1])):
		r[1] = '0' + r[1]
	r = r[0] + r[1]
	return '%s\n%s' % (im.mode, r)

def color_format(mode, color):
	if mode == '1':
		color = 0 if color == 0 else 255
	if mode != 'RGB':
		color = [color]
	res = ''
	for c in color:
		tmp = bin(c)[2:]
		for i in xrange(10 - len(bin(c))):
			tmp = '0' + tmp
		res += tmp
	return res

def create_dat(im, conf):
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = ''
	for color in data_src:
		data_res += color_format(im.mode, color) + '\n'
	return data_res[:-1]

FileAll = []
for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in FileFormat:
        	FileAll.append((root+'/', name, ex))
dat_index = ''
for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	xsize, ysize = im_src.size
	for c in Conf:
		dat_res = open('../FunSimForHDL/%s.dat' \
			% name_format(root, name, ex, c), 'w')
		dat_res.write('%d\n%d\n' % (xsize, ysize))
		dat_res.write('%s\n' % conf_format(im_src, c))
		dat_res.write(create_dat(im_src, c))
		dat_index += '%s' % name_format(root, name, ex, c)
		dat_index += '\n'
		dat_res.close()
dat_index = dat_index[:-1]
dat_index_f = open('../FunSimForHDL/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()