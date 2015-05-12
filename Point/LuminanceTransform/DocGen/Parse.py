#coding:utf-8
"""
Parse block.

Copyright (C) 2015  Dai Tianyu (dtysky)

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

import os, sys, re
from MyFs import *
from ReadBlock import *

__author__ = 'Dai Tianyu (dtysky)'

def parse_block(block, fs):
	res = {
		'type':None, 
		'args':{}
	}
	if not block:
		return res
	ptr = 0
	for ptr in  xrange(len(block)):
		line = block[ptr]
		tmp = re.match(r'\s*::(\S+)', line)
		if tmp:
			if res['type'] == 1:
				fs.error("'::' after ':' is not supported now !")
			res['type'] = 2
			res['args'][tmp.group(1)] = ''
			ptr += 1
			while ptr < len(block) and block[ptr] != '':
				if '::' in block[ptr]:
					break
				res['args'][tmp.group(1)] += block[ptr]
				ptr += 1
			continue
		tmp = re.match(r'\s*:(\S+)', line)
		if tmp:
			if res['type'] == 2:
				fs.error("'::' after ':' is not supported now !")
			res['type'] = 1
			res['args'][tmp.group(1)] = ''
			ptr += 1
			while ptr < len(block) and block[ptr] != '':
				if '::' in block[ptr]:
					break
				res['args'][tmp.group(1)] += block[ptr]
				ptr += 1
	return res

def parse_sp(line):
	def attrs_return(tmp):
		attrs = tmp.groupdict()
		res = {
			'id': None,
			'type': 'unsigned',
			'range': 'None',
			'name': None,
			'default': 'None'
		}
		for attr in attrs:
			res[attr] = attrs[attr]
		return res
	tmp = re.match(r'\s*(?P<id>\S+)\s+(?P<type>\S+)\s*\[(?P<range>.+)\]\s+(?P<name>\S+)\s*=\s*(?P<default>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s*\[(?P<range>.+)\]\s+(?P<name>\S+)\s*=\s*(?P<default>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s+(?P<name>\S+)\s*=\s*(?P<default>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s+(?P<type>\S+)\s*\[(?P<range>.+)\]\s+(?P<name>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s*\[(?P<range>.+)\]\s+(?P<name>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s+(?P<type>\S+)\s+(?P<name>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s*(?P<name>\S+)\s*;', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s*(?P<name>\S+)\s*()\s*\(.*', line)
	if tmp:
		return attrs_return(tmp)
	tmp = re.match(r'\s*(?P<id>\S+)\s*#\(.*\)\s*(?P<name>\S+)\s*\(.*', line)
	if tmp:
		return attrs_return(tmp)
	return {'id': None}

def id_type(sid):
	if sid == 'parameter':
		return 'Parameters'
	elif sid in ['input', 'output', 'inout']:
		return 'Ports'
	else:
		return 'Instances'

def parse_file(files):
	res = {
	'Project' : '',
	'Design' : '',
	'Function' : '',
	'Version' : '',
	'Modified' : '',
	'Files' : []
	}
	fi = MyFS()
	for root, name, ex in files:
		fi.open(root + name + ex, 'r')
		if fi.read_line() != '//Com2DocHDL':
			continue
		head = parse_block(read_block(fi), fi)
		if not head['type'] or head['type'] == 2:
			fi.error('Files for parsing must have a head block !')
		args = head['args']

		if 'Module' not in args:
			fi.error("Head block must have 'Module' !")
		if args['Module'] != 'Main module':
			res['Files'].append((name + ex, args['Module']))
			continue

		res['Files'].insert(0, (name + ex ,args['Module']))
		for attr in args:
			if attr in res and attr not in ['Files']:
				res[attr] = args[attr]

		block = True
		while block:
			block = read_block(fi)
			attrs = parse_block(block, fi)
			if not attrs['type']:
				continue
			if attrs['type'] == 0:
				fi.error("':' out of head block is not allowed !")
			args = attrs['args']
			sp = parse_sp(fi.read_line())
			if not sp['id']:
				fi.error("After the '::' must have a 'parameter', 'port' or 'instance' !")
			sid = id_type(sp['id'])
			if sid not in res:
				res[sid] = []
			if sid == 'Parameters':
				res[sid].append({
					'type' : sp['type'],
					'range' : sp['range'] if 'range' not in args else args['range'],
					'name' : sp['name'],
					'default' : sp['default'],
					'description' : args['description']
					})
			elif sid == 'Ports':
				res[sid].append({
					'port' : sp['id'],
					'type' : sp['type'],
					'range' : sp['range'] if 'range' not in args else args['range'],
					'name' : sp['name'],
					'default' : sp['default'],
					'description' : args['description']
					})
			else:
				res[sid].append({
					'type' : sp['id'],
					'name' : sp['name'],
					'description' : args['description']
					})
	fi.close()
	return res