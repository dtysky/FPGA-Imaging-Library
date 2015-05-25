__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image
import os, json, math
from ctypes import *
from RowsGenerator import RowsGenerator as RG
from WindowGenerator import WindowGenerator as WG
user32 = windll.LoadLibrary('user32.dll')
MessageBox = lambda x:user32.MessageBoxA(0, x, 'Error', 0) 

FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

def show_error(e):
	MessageBox(e)
	exit(0)

def name_format(root, name, ex, conf):
	c = ''
	for row in conf['template']:
		c += str(row).replace('[', "").replace(']', "").replace(', ', "")
	return '%s-%s-%s' % (name, conf['mode'], c)

def conf_format(im, conf):
	ed_mode = 0 if conf['mode'] == 'Erosion' else 1
	template = list(conf['template'])
	template.reverse()
	temp = []
	for row in template:
		row = list(row)
		row.reverse()
		temp.append(row)
	template = str(temp).replace('[','').replace(']','').replace(', ','')
	return '%d\n%d\n%s\n' % (len(conf['template']), ed_mode, template)

def color_format(mode, color):
	c = '0' if color == 0 else '1'
	return c

def create_dat(im, conf):
	mode = im.mode
	template = list(conf['template'])
	ed_mode = conf['mode']
	if mode not in ['1']:
		show_error('Simulations for this module just supports binary images, check your images !')
	if ed_mode not in ['Erosion', 'Dilation']:
		show_error('"mode" just supports "Erosion" and "Dilation", check your conf !')
	for row in template:
		if len(template) != len(row):
			show_error('every row in "template" must equal to length of template, check your conf !')
		if len(template) not in [3, 5]:
			show_error('size of "template" must equal to e or 5, check your conf !')
		for p in row:
			if p not in [0, 1]:
				show_error('Elements in "template" must equal to 0 or 1, check your conf !')
	width = len(template)
	data_res = ''
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		win.reverse()
		for row in win:
			row = list(row)
			row.reverse()
			for p in row:
				data_res += color_format(mode, p)
		data_res += '\n'
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