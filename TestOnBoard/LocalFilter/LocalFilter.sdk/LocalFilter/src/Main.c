/*
 * Main.c
 *
 *  Created on: 2015Äê5ÔÂ30ÈÕ
 *      Author: Tianyu Dai <dtysky@outlook.com>
 */

#include "xparameters.h"
#include "BoardInit_AXI.h"

#define ActMeanFilter 0
#define ActRankFilter 1
#define ViewMeanFilter 0b000
#define ViewRankFilter 0b010
#define ViewThresholdLocal 0b100
#define ViewErosionDilationBin 0b110

BOARDINIT bdit;

int main(){
	BOARDINIT_Init(&bdit, XPAR_BOARDINIT_AXI_0_S00_AXI_BASEADDR);
	BOARDINIT_SetWithCheck(bdit.Rank, 4);
	BOARDINIT_SetWithCheck(bdit.EdMode, 0);
	BOARDINIT_SetWithCheck(bdit.EdTemplate, 0b011011000);
	BOARDINIT_SetWithCheck(bdit.Sels, ActMeanFilter + ViewRankFilter);
	BOARDINIT_Reset(&bdit);
	return 0;
}
