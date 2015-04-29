__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows

ModuleName='RankFitter'

def rank_fitter(window, rank):
	w= []
	for row in window:
		w = w + row
	# big_counter = []
	# res = []
	# for i in range(len(w)):
	# 	big_counter.append(0)
	# 	res.append(0)
	# for i in range(len(w)):
	# 	for j in range(i + 1, len(w)):
	# 		if w[i] >= w[j]:
	# 			big_counter[i] += 1
	# 		else:
	# 			big_counter[j] += 1
	# for i in range(len(big_counter)):
	# 	res[big_counter[i]] = w[i]
	return sorted(w)[rank]