"""
Project
FPGA-Imaging-Library

Design
MeanFilter

Function
Local filter - Mean filter, it always used for smoothing images. 

Module
Software simulation.

Version
1.0

Modified
2015-05-19

Copyright (C) 2015 Tianyu Dai (dtysky) <dtysky@outlook.com>

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

def mean_filter(window):
	w_sum = 0
	for row in window:
		w_sum += sum(row)
	if len(window) == 2:
		return w_sum >> 2;
	elif len(window) == 3:
		return (w_sum >> 4) + (w_sum >> 5) + (w_sum >> 6);
	elif len(window) == 4:
		return w_sum >> 4;
	elif len(window) == 5:
		return (w_sum >> 5) + (w_sum >> 7) + (w_sum >> 10);
	elif len(window) == 6:
		return (w_sum >> 6) + (w_sum >> 7) + (w_sum >> 8);
	elif len(window) == 7:
		return (w_sum >> 6) + (w_sum >> 8) + (w_sum >> 10);
	elif len(window) == 8:
		return w_sum >> 6;
	elif len(window) == 9:
		return (w_sum >> 7) + (w_sum >> 8) + (w_sum >> 11);
	elif len(window) == 10:
		return (w_sum >> 7) + (w_sum >> 9) + (w_sum >> 13);
	elif len(window) == 11:
		return (w_sum >> 7) + (w_sum >> 12) + (w_sum >> 13);
	elif len(window) == 12:
		return (w_sum >> 8) + (w_sum >> 9) + (w_sum >> 10);
	elif len(window) == 13:
		return (w_sum >> 8) + (w_sum >> 9) + (w_sum >> 14);
	elif len(window) == 14:
		return (w_sum >> 8) + (w_sum >> 10) + (w_sum >> 12);
	elif len(window) == 15:
		return (w_sum >> 8) + (w_sum >> 11);