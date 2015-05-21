"""
Project
FPGA-Imaging-Library

Design
WindowGenerator

Function
Generate window. 

Module
Software simulation.

Version
1.0

Modified
2015-05-17

Copyright (C) 2015  Tianyu Dai (dtysky) <dtysky@outlook.com>

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

Homepage for this project:
	http://fil.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe
"""

__author__ = 'Tianyu Dai (dtysky)'

from PIL import Image

class WindowGenerator():
	"""A class for creating and maintaining a window."""
	def __init__(self, wsize):
		self.init = 0
		self.create(wsize)
	def create(self, wsize):
		self.enable = False
		self.window = []
		self.wsize = wsize
		self.wsize_half = wsize >> 1
		for y in xrange(wsize):
			self.window.append([0 for x in xrange(wsize)])
	def update(self, rows_col):
		if self.enable:
			pass
		elif self.init == self.wsize_half:
			self.enable = True
		else:
			self.init += 1
		window_last = list(self.window)
		for y in xrange(self.wsize):
			self.window[y].pop()
			self.window[y].insert(0, rows_col[y])
		return window_last
	def is_enable(self):
		return self.enable