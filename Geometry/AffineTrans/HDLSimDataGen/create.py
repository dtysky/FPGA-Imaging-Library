__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os, json

ModuleName='AffineTrans'

conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

FileAll = []

for root,dirs,files in os.walk('../ImageForTest'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in ['.jpg', '.bmp']:
        	FileAll.append((root+'/', name, ex))

def aff_format1(a):
	r = int(a)
	d = abs(a - r)
	r = [bin(int(r)).split('0b').pop()]
	r.insert(0, '1' if a < 0 else '0')
	for i in xrange(8 - len(r[1])):
		r[1] = '0' + r[1]
	r = r[0] + r[1]
	res = ''
	for i in xrange(16):
		d = d * 2
		res += '1' if d >= 1 else '0'
		d = d - 1 if d >= 1 else d
	return r + res

def aff_format2(a):
	r = [bin(int(a)).split('0b').pop()]
	r.insert(0, '1' if a < 0 else '0')
	for i in xrange(16 - len(r[1])):
		r[1] = '0' + r[1]
	return r[0] + r[1]

def color_format(color):
	res = bin(color)[2:]
	for i in xrange(8 - len(res)):
		res = '0' + res
	return res

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
		aux = float(c['aux'])
		auy = float(c['auy'])
		au = int(c['au'])
		avx = float(c['avx'])
		avy = float(c['avy'])
		av = int(c['av'])
		axu = avy / (aux * avy - auy * avx)
		axv = -auy / (aux * avy - auy * avx)
		ax = (auy * av - au * avy) / (aux * avy - auy * avx)
		ayu = -avx / (aux * avy - auy * avx)
		ayv = aux / (aux * avy - auy * avx)
		ay = (-aux * av + au * avx) / (aux * avy - auy * avx)
		# print axu, axv, ax, ayu, ayv, ay
		dat_res = open('../FunSimForHDL/%s-%sx%sx%s-%sx%sx%s.dat' % \
			(name, c['aux'], c['auy'], c['au'], c['avx'], c['avy'], c['av']), 'w')
		dat_res.write('%d\n%d\n' % (xsize, ysize))
		if not first:
			dat_res.write('%s\n%s\n%s\n%s\n%s\n%s\n' % \
				(aff_format1(axu), aff_format1(axv), aff_format2(ax), aff_format1(ayu), aff_format1(ayv), aff_format2(ay)))
			dat_res.write(create_dat(im_src))
		else:
			dat_res.write('%s\n%s\n%s\n%s\n%s\n%s' % \
				(aff_format1(axu), aff_format1(axv), aff_format2(ax), aff_format1(ayu), aff_format1(ayv), aff_format2(ay)))
		first = True
		dat_index += '%s-%sx%sx%s-%sx%sx%s\n' % \
			(name, c['aux'], c['auy'], c['au'], c['avx'], c['avy'], c['av'])
		dat_res.close()

dat_index = dat_index[:-1]
dat_index_f = open('../FunSimForHDL/imgindex.dat','w')
dat_index_f.write(dat_index)
dat_index_f.close()