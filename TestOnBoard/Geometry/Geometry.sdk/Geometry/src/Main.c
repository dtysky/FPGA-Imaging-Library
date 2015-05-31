/*
 * Main.c
 *
 *  Created on: 2015Äê5ÔÂ31ÈÕ
 *      Author: sky
 */



#include "xparameters.h"
#include "BoardInit_AXI.h"

#define ViewFore 000
#define ViewReverse 100
#define ViewCrop 0b00
#define ViewPan 0b01
#define ViewMirror 0b10
#define ViewScale 0b00
#define ViewShear 0b01
#define ViewRotate 0b10

BOARDINIT bdit;

int main(){
	BOARDINIT_Init(&bdit, XPAR_BOARDINIT_AXI_0_S00_AXI_BASEADDR);
	BOARDINIT_SetWithCheck(bdit.CropTop, 40);
	BOARDINIT_SetWithCheck(bdit.CropBottom, 320);
	BOARDINIT_SetWithCheck(bdit.CropLeft, 0);
	BOARDINIT_SetWithCheck(bdit.CropRight, 200);
	BOARDINIT_SetWithCheck(bdit.MirrorMode, 2);
	BOARDINIT_SetFixed(bdit.OffsetX, -100, 9, 0);
	BOARDINIT_SetFixed(bdit.OffsetY, -100, 9, 0);
	BOARDINIT_SetFixed(bdit.ScaleX, 1 / 0.6, 6, 18);
	BOARDINIT_SetFixed(bdit.ScaleY, 1 / 1.3, 6, 18);
	BOARDINIT_SetFixed(bdit.ShU, -1.671, 6, 18);
	BOARDINIT_SetFixed(bdit.ShV, 0.539, 6, 18);
	BOARDINIT_SetWithCheck(bdit.Angle, 225);
	BOARDINIT_SetWithCheck(bdit.Sels, ViewReverse + ViewShear);
	BOARDINIT_Reset(&bdit);
	return 0;
}
