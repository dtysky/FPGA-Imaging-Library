__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image, ImageChops, ImageStat
import os, json, re, math

FileFormat = ['.jpg', '.bmp']

def name_format(root, name, ex, conf):
	return '%s-%s' % (name, conf['lm_gain'])

def get_psnr(FileAll):
	psnrs = {}
	for name, f_pair in FileAll.items():
		diffs = ImageChops.difference(\
			Image.open(f_pair[0]), Image.open(f_pair[1]))
		stat = ImageStat.Stat(diffs)
		rms = sum(stat.rms) / len(stat.rms)
		psnr = 20.0 * math.log10(255.0 / rms) if rms != 0 else 1000*1000
		psnrs[name] = psnr
	return psnrs

def compare(FileAll):
	psnrs = get_psnr(FileAll)
	psnr_t = 0
	res = 'PSNR:\n\n'
	for name in sorted(psnrs):
		psnr_t += psnrs[name]
		res += '%s : %f  \n' % (name, psnrs[name])
	res += 'Totle : %f  ' % (psnr_t / len(psnrs))
	return res

def compare_table(FileAll):
	psnrs = get_psnr(FileAll)
	psnr_t = 0
	res = '''#### PSNR:\n\n<table border="1" cellspacing="0">\n'''
	res += '\t<tr>\n'
	for name in sorted(psnrs):
		psnr_t += psnrs[name]
		res += '\t\t<th>%s</th>\n' % name
	res += '\t\t<th>%s</th>\n' % 'total'
	res += '\t</tr>\n'
	res += '\t<tr>\n'
	for name in sorted(psnrs):
		res += '\t\t<td>%.2f</td>\n' % psnrs[name]
	res += '\t\t<td>%.2f</td>\n' % (psnr_t / len(psnrs))
	res += '\t</tr>\n'
	res += "</table>"
	return res

FileAll = {}
for root, dirs, files in os.walk('./'):
    for f in files:
    	name, ex=os.path.splitext(f)
        if ex in FileFormat:
        	tmp_h = re.match(r'(.*)-reqack-hdlfun', name)
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