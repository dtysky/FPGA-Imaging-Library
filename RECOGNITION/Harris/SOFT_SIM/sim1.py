__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os
import WindowCreat,MeanFitter,MidFitter

ModuleName='Harris'

Top = 15
Bottom = 205
Left = 60
Right = 280

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.bmp':
        	FileAll.append((root+'/',f))

def harris(im,d_value,wsize_fitter):
	def in_range(x,y):
		return x > Left and x < Right and y > Top and y < Bottom
	im_fitter = MeanFitter.creat(im,wsize_fitter)
	#im_fitter = MidFitter.creat(im,wsize_fitter)
	xsize,ysize = im.size
	data_res = []

	now_pix = 0
	last_pix_col = 0
	last_pix_row = []
	for i in range(xsize):
		last_pix_row.append(0)

	for y in range(ysize):
		for x in range(xsize):
			now_pix = im_fitter[y * xsize + x]
			if x == 0:
				last_pix_col = now_pix
			if y == 0:
				last_pix_row[x] = now_pix

			diff_col = abs(now_pix - last_pix_col)
			diff_row = abs(now_pix - last_pix_row[x])

			if in_range(x,y):
				data_res.append(1 if diff_col >= d_value and diff_row >= d_value else 0)
			else:
				data_res.append(0)

			last_pix_col = now_pix
			last_pix_row[x] = now_pix

	return data_res

def harris_mark(im,harris_res):
	xsize,ysize = im.size
	im_res = im.copy()
	for y in range(ysize):
		for x in range(xsize):
			if harris_res[y * xsize + x]:
				# if x > 0 and y > 0:
				# 	im_res.putpixel((x-1,y),255)
				# 	im_res.putpixel((x,y-1),255)
				im_res.putpixel((x,y),255)
				# if x < xsize-1 and y < ysize-1:
				# 	im_res.putpixel((x+1,y),255)
				# 	im_res.putpixel((x,y+1),255)
	return im_res

for root,f in FileAll:
	im_src = Image.open(root+f)
	harris_res = harris(im_src,5,3)
	# open('../SIM_CHECK/soft' + f + '.dat','w').write(str(harris_res))
	im_res = Image.new('1',im_src.size)
	im_res.putdata(harris_res)
	im_res.save('../SIM_CHECK/soft' + f + '.bmp')
	im_res = harris_mark(im_src,harris_res)
	im_res.save('../SIM_CHECK/soft_mark' + f)