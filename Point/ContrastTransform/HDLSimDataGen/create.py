__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image
import os, json
from ctypes import *
user32 = windll.LoadLibrary('user32.dll')
MessageBox = lambda x:user32.MessageBoxA(0, x, 'Error', 0) 

FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

def show_error(e):
	MessageBox(e)
	exit(0)

def name_format(root, name, ex, conf):
	return '%s-%s' % (name, conf['ct_scale'])

def conf_format(im, conf):
	c = conf['ct_scale']
	r = int(c)
	d = abs(c - r)
	r = bin(int(r)).split('0b').pop()
	for i in xrange(12 - len(r)):
		r = '0' + r
	dtmp = ''
	for i in xrange(12):
		d = d * 2
		dtmp += '1' if d >= 1 else '0'
		d = d - 1 if d >= 1 else d
	return '%s\n%s\n' % (im.mode, r + dtmp)

def color_format(mode, color):
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
	mode = im.mode
	ct_scale = conf['ct_scale']
	if mode not in ['RGB', 'L']:
		show_error('This module just supports RGB and Gray-scale images, check your images !')
	if ct_scale < 0:
		show_error('''"ct_scale" must be greater than 0 !''')
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = ''
	for color in data_src:
		data_res += color_format(mode, color) + '\n'
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
		dat_res.write('%s' % conf_format(im_src, c))
		dat_res.write(create_dat(im_src, c))
		dat_index += '%s' % name_format(root, name, ex, c)
		dat_index += '\n'
		dat_res.close()
dat_index = dat_index[:-1]
dat_index_f = open('../FunSimForHDL/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()