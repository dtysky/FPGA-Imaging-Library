__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image, ImageChops, ImageStat
import os, json, re, math

FileFormat = ['.dat']

def name_format(root, name, ex, conf):
	return '%s-%s' % (name, conf['lm_gain'])

def get_psnr(FileAll):
	psnrs = {}
	for name, f_pair in FileAll.items():
		with open(f_pair[0], 'r') as f0:
			s0 = f0.readlines()
		with open(f_pair[1], 'r') as f1:
			s1 = f1.readlines()
		leng = min(len(s0), len(s1))
		for i in xrange(leng):
			psnr = s0[i] == s1[i]
			if not psnr:
				break
		psnrs[name] = psnr
	return psnrs

def compare(FileAll):
	psnrs = get_psnr(FileAll)
	psnr_t = True
	res = 'PSNR:\n\n'
	for name in sorted(psnrs):
		if not psnrs[name]:
			psnr_t = False
		res += '%s : %s  \n' % (name, 'OK' if psnrs[name] else 'No')
	res += 'Totle : %s  ' % 'OK' if psnr_t else 'No'
	return res

def compare_table(FileAll):
	psnrs = get_psnr(FileAll)
	psnr_t = True
	res = '''#### PSNR:\n\n<table border="1" cellspacing="0">\n'''
	res += '\t<tr>\n'
	for name in sorted(psnrs):
		if not psnrs[name]:
			psnr_t = False
		res += '\t\t<th>%s</th>\n' % name
	res += '\t\t<th>%s</th>\n' % 'Total'
	res += '\t</tr>\n'
	res += '\t<tr>\n'
	for name in sorted(psnrs):
		res += '\t\t<td>%s</td>\n' % 'OK' if psnrs[name] else 'No'
	res += '\t\t<td>%s</td>\n' % 'OK' if psnr_t else 'No'
	res += '\t</tr>\n'
	res += "</table>"
	return res

FileAll = {}
for root, dirs, files in os.walk('./'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in FileFormat:
        	tmp_h = re.match(r'(.*)-pipeline-hdlfun', name)
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
fo = open('compare_report.txt', 'w')
fo.write(compare(FileAll))
fo.close()
fo = open('compare_report_table.txt', 'w')
fo.write(compare_table(FileAll))
fo.close()