#coding:utf-8
"""
File controller.

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

import re
import sys
import os
from ctypes import *
import codecs
import hashlib
import locale
user32 = windll.LoadLibrary('user32.dll')
MessageBox = lambda x:user32.MessageBoxA(0, x, 'Error', 0) 

class MyFS():

	def __init__(self):
		pass
	def open(self,path,mode):
		self.path=path
		self.linepos=0
		self.end=False
		if mode=='r':
			if not os.path.exists(path):
				self.Error('The file '+path+' does not exist !')
		self.fs=codecs.open(path,mode,'utf-8')
	def read_line(self):
		self.linepos+=1
		tmp=self.fs.readline()
		if tmp=='':
			self.end=True
		return tmp.strip().replace('_', '\_')
	def error(self,e,exit=True):
		MessageBox(e.encode(locale.getdefaultlocale()[1])+'\r\n'+'Path : '+self.path.encode(locale.getdefaultlocale()[1])+'\r\n'+'Line : '+str(self.linepos))
		if exit:
			sys.exit(0)
	def is_end(self):
		return self.end
	def write(self,s):
		self.fs.write(s)
		self.fs.flush()
	def close(self):
		self.fs.close()