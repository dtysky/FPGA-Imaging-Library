__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image, ImageChops, ImageStat
import os, json, re

ModuleName='LuminanceTransform'
FileFormat = ['.jpg', '.bmp']
Conf = json.load(open('../ImageForTest/conf.json', 'r'))['conf']

def name_format(root, name, ex, conf):
	return '%s-%s' % (name, conf['lm_gain'])

def compare(FileAll):
	mse = {}
	for name, f_pair in FileAll.items():
		diffs = ImageChops.difference(\
			Image.open(f_pair[0]), Image.open(f_pair[1]))
		stat = ImageStat.Stat(diffs)
		rms = sum(stat.rms) / len(stat.rms)
		mse[name] = rms
	return str(mse)

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