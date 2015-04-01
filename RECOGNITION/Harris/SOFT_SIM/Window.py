__author__ = 'Dai Tianyu (dtysky)'

class Window():
	"""A class for creating and maintaining a window."""
	def __init__(self, wsize):
		self.init = 0
		self.create(wsize)
	def create(self, wsize):
		self.enable = False
		self.window = []
		self.wsize = wsize
		self.wsize_half = wsize >> 1
		for y in range(wsize):
			self.window.append([])
			for x in range(wsize):
				self.window[y].append(0)
	def update(self, rows_col):
		if self.init == self.wsize_half:
			self.enable = True
		else:
			self.init += 1
		window_last = list(self.window)
		for y in range(self.wsize):
			self.window[y].pop()
			self.window[y].insert(0, rows_col[y])
		return window_last
	def is_enable(self):
		return self.enable