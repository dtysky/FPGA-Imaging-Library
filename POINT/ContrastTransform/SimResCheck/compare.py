__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image, ImageChops, ImageStat
import os, json, re, math

ModuleName='ContrastTransform'
FileFormat = ['.jpg', '.bmp']

def name_format(root, name, ex, conf):
	return '%s-%s' % (name, conf['lm_gain'])

def compare(FileAll):
	psnrs = {}
	for name, f_pair in FileAll.items():
		diffs = ImageChops.difference(\
			Image.open(f_pair[0]), Image.open(f_pair[1]))
		stat = ImageStat.Stat(diffs)
		rms = sum(stat.rms) / len(stat.rms)
		psnr = 20.0 * math.log10(255.0 / rms) if rms != 0 else 1000*1000
		psnrs[name] = psnr
	psnr_t = 0
	res = 'Psnr:\n\n'
	for name in sorted(psnrs):
		psnr_t += psnrs[name]
		res += '%s : %s\n' % (name, psnrs[name])
	res += 'Totle : ' + str(psnr_t / len(psnrs))
	return res

FileAll = {}
for root, dirs, files in os.walk('./'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in FileFormat:
        	tmp_h = re.match(r'(.*)-pipline-hdlfun', name)
        	tmp_s = re.match(r'(.*)-soft', name)
        	img = None
        	if not tmp_h and not tmp_s:
        		continue
        	if tmp_h:
        		img = tmp_h.group(1)
        	if tmp_s:
        		img = tmp_s.group(1)
        	if img not in FileAll:
        		FileAll[img] = []
        	FileAll[img].append(root + name + ex)
fo = open('compare_report.dat', 'w')
fo.write(compare(FileAll))
fo.close()