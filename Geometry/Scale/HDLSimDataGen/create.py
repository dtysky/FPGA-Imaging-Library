__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os, json

ModuleName='Scale'

conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in ['.jpg', '.bmp']:
        	FileAll.append((root+'/', name, ex))

def color_format(color):
	res = bin(color)[2:]
	for i in xrange(8 - len(res)):
		res = '0' + res
	return res

def scale_format(scale):
	def format_r(r):
		tmp = bin(int(r))[2:]
		for j in xrange(16 - len(tmp)):
			tmp = '0' + tmp
		return tmp
	# Convert d to 16bits binary decimal
	def format_d(d):
		tmp = float('0.' + d)
		res = ''
		for i in xrange(16):
			tmp = tmp * 2
			res += '1' if tmp >= 1 else '0'
			tmp = tmp - 1 if tmp >= 1 else tmp
		return res
	r, d = str(format(1 / float(scale), '.16f')).split('.')
	r, d = format_r(r), format_d(d)
	return r + d

def create_dat(im):
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = ''
	all_size = xsize * ysize - 1
	for y in range(ysize):
		for x in range(xsize):
			data_res += color_format(xsize - 1 - x) + '\n'
			data_res += color_format(ysize - 1 - y) + '\n'
			data_res += color_format(data_src[(ysize - 1 - y) * xsize + (xsize - 1 - x)]) + '\n'
	return data_res[:-1]

dat_index = ''

for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	xsize, ysize = im_src.size
	first = False
	for c in conf:
		dat_res = open('../FunSimForHDL/%s-%sx%s.dat' % (name, c['xscale'], c['yscale']), 'w')
		dat_res.write('%d\n%d\n' % (xsize, ysize))
		if not first:
			dat_res.write('%s\n%s\n' % (scale_format(c['xscale']), scale_format(c['yscale'])))
			dat_res.write(create_dat(im_src))
		else:
			dat_res.write('%s\n%s' % (scale_format(c['xscale']), scale_format(c['yscale'])))
		first = True
		dat_index += '%s-%sx%s\n' % (name, c['xscale'], c['yscale'])
		dat_res.close()

dat_index = dat_index[:-1]
dat_index_f = open('../FunSimForHDL/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()