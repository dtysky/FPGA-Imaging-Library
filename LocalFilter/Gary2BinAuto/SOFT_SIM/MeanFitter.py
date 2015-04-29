__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
from Window import Window
from Rows import Rows

ModuleName='MeanFitter'

def mean_fitter(window):
	w_sum = 0
	for row in window:
		w_sum += sum(row)
	if len(window) == 1:
		return w_sum
	elif len(window) == 2:
		return w_sum >> 2;
	elif len(window) == 3:
		return (w_sum >> 4) + (w_sum >> 5) + (w_sum >> 6);
	elif len(window) == 4:
		return w_sum >> 4;
	elif len(window) == 5:
		return (w_sum >> 5) + (w_sum >> 7);
	elif len(window) == 6:
		return (w_sum >> 6) + (w_sum >> 7) + (w_sum >> 8);
	elif len(window) == 7:
		return (w_sum >> 6) + (w_sum >> 8);
	elif len(window) == 8:
		return w_sum >> 6;
	elif len(window) == 9:
		return (w_sum >> 7) + (w_sum >> 8) + (w_sum >> 10);
	elif len(window) == 10:
		return (w_sum >> 7) + (w_sum >> 9);
	elif len(window) == 11:
		return (w_sum >> 7) + (w_sum >> 10);
	elif len(window) == 12:
		return (w_sum >> 8) + (w_sum >> 9) + (w_sum >> 10);
	elif len(window) == 13:
		return (w_sum >> 8) + (w_sum >> 9);
	elif len(window) == 14:
		return (w_sum >> 8) + (w_sum >> 10);
	elif len(window) == 15:
		return (w_sum >> 8) + (w_sum >> 11);
	elif len(window) == 16:
		return w_sum >> 8;