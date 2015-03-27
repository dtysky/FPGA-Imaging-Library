__author__ = 'Dai Tianyu (dtysky)'

class Rows():
	"""A class for creating and maintaining some row cache, using it to sumulate some fifos."""
	def __init__(self, frame, width, deepth):
		self.creat(frame, width, deepth)
		self.frist_fill()
	def creat(self, frame, width, deepth):
		self.frame = list(frame)
		self.frame.reverse()
		self.width = width
		self.deepth = deepth
	def frist_fill(self):
		self.rows = []
		for y in range(self.width):
			self.rows.append([])
			for x in range(self.deepth):
				self.rows[y].insert(0,self.frame.pop())
	def frame_empty(self):
		return len(self.frame) == 0
	def rows_empty(self, row):
		return len(self.rows[row]) == 0
	def update(self):
		output = []
		if not self.frame_empty():
			self.rows[0].insert(0,self.frame.pop())
		for i in range(len(self.rows)-1):
			now_pix = self.rows[i].pop()
			self.rows[i+1].insert(0,now_pix)
			output.append(now_pix)
		output.append(self.rows[self.width - 1].pop())
		return output