__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image
import os, json, math
from ctypes import *
from RowsGenerator import RowsGenerator as RG
from WindowGenerator import WindowGenerator as WG
from MeanFilter import *
from RankFilter import *
user32 = windll.LoadLibrary('user32.dll')
MessageBox = lambda x:user32.MessageBoxA(0, x, 'Error', 0) 

FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

def show_error(e):
	MessageBox(e)
	exit(0)

def name_format(root, name, ex, conf):
	return '%s-%s-%s' % (name, conf['window_width'], conf['filter'])

def conf_format(im, conf):
	return '%s\n' % conf['filter']

def color_format(mode, color):
	res = bin(color)[2:]
	for i in xrange(10 - len(bin(color))):
		res = '0' + res
	return res

def create_dat(im, conf):
	mode = im.mode
	width = int(conf['window_width'])
	half_width = width >> 1
	full_half_width = width * width >> 1
	fil = conf['filter']
	if mode not in ['L']:
		show_error('Simulations for this module just supports Gray-scale images, check your images !')
	if width not in [3, 5]:
		show_error('Simulations for this module just supports "window_width" 3 and 5, check your conf !')
	if fil not in ['mean', 'mid']:
		show_error('"filter" just supports "mean" and "mid"m check your conf !')
	data_res = ''
	rows = RG(im, width)
	window = WG(width)
	while not rows.frame_empty():
		win = window.update(rows.update())
		if not window.is_enable():
			continue
		data_res += '%s\n' % color_format(mode, win[half_width][half_width])
		if fil == 'mean':
			data_res += '%s\n' % color_format(mode, mean_filter(win))
		else:
			data_res += '%s\n' % color_format(mode, rank_filter(win, full_half_width))
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