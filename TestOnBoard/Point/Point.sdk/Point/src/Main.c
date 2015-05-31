/*
 * Main.c
 *
 *  Created on: 2015Äê5ÔÂ30ÈÕ
 *      Author: sky
 */

#include "xparameters.h"
#include "BoardInit_AXI.h"

#define SelColorReversal 0
#define SelThreshold 1
#define SelLightnessTransform 2
#define SelContrastTransform 3

BOARDINIT bdit;

int main(){
	BOARDINIT_Init(&bdit, XPAR_BOARDINIT_AXI_0_S00_AXI_BASEADDR);
	BOARDINIT_SetWithCheck(bdit.ThMode, 1);
	BOARDINIT_SetWithCheck(bdit.Th1, 130);
	BOARDINIT_SetWithCheck(bdit.Th2, 170);
	BOARDINIT_SetFixed(bdit.CtScale, 0.3, 12, 12);
	BOARDINIT_SetFixed(bdit.LmGain, -50, 8, 0);
	BOARDINIT_SetWithCheck(bdit.Sels, SelLightnessTransform);
	BOARDINIT_Reset(&bdit);
	return 0;
}
