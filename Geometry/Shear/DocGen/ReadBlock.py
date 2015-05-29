#coding:utf-8
"""
Read next block.

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
__author__ = 'Dai Tianyu (dtysky)'

def read_block(fs):
	while not fs.is_end():
		if '/*' in fs.read_line():
			break
	if fs.is_end():
		return None
	res = []
	while 1:
		line = fs.read_line()
		if '*/' in line:
			break
		res.append(line)
		if fs.is_end():
			return None
	return res