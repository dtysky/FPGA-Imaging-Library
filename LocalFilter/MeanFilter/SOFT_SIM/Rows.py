__author__ = 'Dai Tianyu (dtysky)'

class Rows():
	"""A class for creating and maintaining some row cache, using it to sumulate some fifos."""
	def __init__(self, frame, width, depth):
		self.create(frame, width, depth)
		self.first_fill()
	def create(self, frame, width, depth):
		self.frame = list(frame)
		self.frame.reverse()
		self.width = width
		self.depth = depth
	def first_fill(self):
		self.rows = []
		for y in range(self.width):
			self.rows.append([])
			for x in range(self.depth):
				self.rows[y].insert(0,self.frame.pop())
	def frame_empty(self):
		return len(self.frame) == 0
	def rows_empty(self, row):
		return len(self.rows[row]) == 0
	def update(self):
		output = []
		for i in range(len(self.rows)):
			output.append(self.rows[i].pop())
		self.rows[self.width - 1].insert(0,self.frame.pop())
		for i in range(self.width - 1):
			self.rows[i].insert(0,output[i + 1])
		return output