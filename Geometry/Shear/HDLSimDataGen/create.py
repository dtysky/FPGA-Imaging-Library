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
	return '%s-%sx%s' % (name, conf['ush'], conf['vsh'])

def conf_format(im, conf):
	shs = (conf['ush'], conf['vsh'])
	res = ''
	for p in shs:
		r = int(p)
		d = abs(p - r)
		r = [bin(int(r)).split('0b').pop()]
		r.insert(0, '1' if p < 0 else '0')
		for i in xrange(6 - len(r[1])):
			r[1] = '0' + r[1]
		r = r[0] + r[1]
		dtmp = ''
		for i in xrange(18):
			d = d * 2
			dtmp += '1' if d >= 1 else '0'
			d = d - 1 if d >= 1 else d
		res += r + dtmp + '\n'
	return res

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

def count_format(size, count):
	res = bin(count)[2:]
	for i in xrange(len(bin(size)) - len(bin(count))):
		res = '0' + res
	return res

def create_dat(im, conf):
	mode = im.mode
	ush, vsh = (conf['ush'], conf['vsh'])
	if mode not in ['L']:
		show_error('Simulations for this module just support Gray-sh images, check your images !')
	if im.size != (512, 512):
		show_error('Simulations for this module just support 512x512 images, check your images !')
	if ush >= 64 or ush <= -64 or vsh >= 64 or vsh <= -64:
		show_error('shs for simulations for this module just supports -63.x - 63.x, check your conf !')
	data_src = list(im.getdata())
	data_res = ''
	for p in data_src:
		data_res += color_format(mode, p) + '\n'
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