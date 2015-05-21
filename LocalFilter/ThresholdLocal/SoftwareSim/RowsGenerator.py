"""
Project
FPGA-Imaging-Library

Design
RowsGenerator

Function
Generate rows cache. 

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

class RowsGenerator():
	"""A class for creating and maintaining some row cache, using it to sumulate some fifos."""
	def __init__(self, im, width):
		self.create(im, width)
		self.first_fill()
	def create(self, im, width):
		self.im = im
		self.frame = list(im.getdata())
		self.frame.reverse()
		self.width = width
		self.depth = im.size[0]
	def first_fill(self):
		self.rows = []
		for y in xrange(self.width):
			self.rows.append([])
			for x in xrange(self.depth):
				self.rows[y].insert(0, self.frame.pop())
	def frame_empty(self):
		return len(self.frame) == 0
	def rows_empty(self, row):
		return len(self.rows[row]) == 0
	def update(self):
		if self.frame_empty():
			self.create(self.im, self.width)
		output = []
		for i in xrange(len(self.rows)):
			output.append(self.rows[i].pop())
		self.rows[self.width - 1].insert(0, self.frame.pop())
		for i in xrange(self.width - 1):
			self.rows[i].insert(0, output[i + 1])
		return output