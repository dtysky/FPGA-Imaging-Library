#coding = utf-8

__author__ = 'Dai Tianyu (dtysky)'

from PIL import Image
import os,re

ModuleName='ChessWindowFiter'

LeftTop = (30,21)
RightBottom = (455,480)
GridWidth = 13
GridHeight = 14
Width = 485
Height = 496
# 14 16, >>4
GridDia = ((RightBottom[0] - LeftTop[0]) >> 4) + ((RightBottom[0] - LeftTop[0]) >> 6) + ((RightBottom[0] - LeftTop[0]) >> 7)
GridRad = GridDia >> 1

FileAll = []

for root,dirs,files in os.walk('../IMAGE_FOR_TEST'):
    for f in files:
        if os.path.splitext(f)[1]=='.bmp':
        	FileAll.append((root+'/',f))

def reco(im,color):
	def inrange(row,col):
		return row >= LeftTop[1]-GridRad and row <= RightBottom[1]+GridRad \
		 and col >= LeftTop[0]-GridRad and col <= RightBottom[0]+GridRad
	res_grids = []
	for i in range(GridHeight):
		res_grids.append([])
		for j in range(GridWidth):
			res_grids[i].append(0)
	now_row = 0
	now_col = 0
	now_grid_row = 0
	now_grid_col = 0
	one_grid_row = 0
	one_grid_col = 0
	for pix in im:
		if not inrange(now_row,now_col):
			one_grid_col = 0
		else:
			if one_grid_col == GridDia-1:
				one_grid_col = 0
				if now_grid_col == GridWidth-1:
					now_grid_col = 0
					if one_grid_row == GridDia-1:
						one_grid_row = 0
						if now_grid_row == GridHeight-1:
							now_grid_row = 0
						else:
							now_grid_row += 1
					else:
						one_grid_row += 1
				else:
					now_grid_col += 1
			else:
				one_grid_col += 1

			if pix == color:
				res_grids[now_grid_row][now_grid_col] += 1

		if now_col == Width-1:
			now_col = 0
			if now_row == Height-1:
				now_row = 0
			else:
				now_row += 1
		else:
			now_col += 1

	res = ''
	for l in res_grids:
		for p in l:
			res += str(p)+' , '
		res = res[:-3]
		res += '\n'
	return res[:-1]

for root,f in FileAll:
	im = Image.open(root+f).getdata()
	fo = open('../SIM_CHECK/soft'+f+'.dat','w')
	if re.findall(r'black',f):
		fo.write(reco(im,0))
	else:
		fo.write(reco(im,255))
	fo.close()