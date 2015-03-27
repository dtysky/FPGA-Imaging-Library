__author__ = 'Dai Tianyu (dtysky)'

def mean_fitter(window):
	w_sum = 0
	w_len = 0
	for row in window:
		w_sum += sum(row)
		w_len += len(row)
	return w_sum / w_len