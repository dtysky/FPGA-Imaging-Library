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

def color_formot(color):
	res = bin(color)[2:]
	for i in xrange(8 - len(res)):
		res = '0' + res
	return res

def scale_formot(scale):
	def formot(i):
		tmp = bin(int(i))[2:]
		for j in xrange(16 - len(tmp)):
			tmp = '0' + tmp
		return tmp
	r, d = str(1 / float(scale)).split('.')
	r, d = formot(r), formot(d)
	return r + d

def create_dat(im):
	data_src = im.getdata()
	xsize, ysize = im.size
	data_res = ''
	all_size = xsize * ysize - 1
	for y in range(ysize):
		for x in range(xsize):
			data_res += color_formot(xsize - 1 - x) + '\n'
			data_res += color_formot(ysize - 1 - y) + '\n'
			data_res += color_formot(data_src[(ysize - 1 - y) * xsize + (xsize - 1 - x)]) + '\n'
	return data_res[:-1]

dat_index = ''

for root, name, ex in FileAll:
	im_src = Image.open(root + name + ex)
	xsize, ysize = im_src.size
	for c in conf:
		dat_res = open('../FunSimForHDL/%s-%sx%s.dat' % (name, c['xscale'], c['yscale']), 'w')
		dat_res.write('%d\n%d\n' % (xsize, ysize))
		dat_res.write('%s\n%s\n' % (scale_formot(c['xscale']), scale_formot(c['yscale'])))
		dat_res.write(create_dat(im_src))
		dat_index += '%s-%sx%s\n' % (name, c['xscale'], c['yscale'])
		dat_res.close()

dat_index = dat_index[:-1]
dat_index_f = open('../FunSimForHDL/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()