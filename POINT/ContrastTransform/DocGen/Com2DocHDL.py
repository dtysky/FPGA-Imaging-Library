#coding:utf-8
"""
Creat documentions from HDL files's comments.

Copyright (C) 2015  Tianyu Dai (dtysky)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe
"""

import os, sys, re, json
from Parse import *
from OutGen import *

__author__ = 'Tianyu Dai (dtysky)'

conf = json.load(open('conf.json', 'r'))['conf']

FileAll = []
for root, dirs, files in os.walk(conf['path']):
    for f in files:
    	name, ex = os.path.splitext(f)
        if ex in conf['mode']:
        	FileAll.append((root+'/', name, ex))

ftmp = list(FileAll)
for ex_path in conf['excluded_path']:
	for f in ftmp:
		if ex_path in f[0]:
			FileAll.remove(f)

Doc = complete_source(parse_file(FileAll), conf['additional_files'])
fo = open(conf['out_path'] + Doc['Design'] + '.md', 'w')
fo.write(generate_md(Doc, conf['titles']))
fo.close()
if conf['tcl'][0]:
	fo = open(conf['out_path'] + Doc['Design'] + '.tcl', 'w')
	fo.write(generate_tcl(Doc, conf['tcl'][1]))
	fo.close()