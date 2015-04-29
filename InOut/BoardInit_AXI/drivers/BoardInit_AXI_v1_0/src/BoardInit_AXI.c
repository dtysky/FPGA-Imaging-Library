

/***************************** Include Files *******************************/
#include "BoardInit_AXI.h"

/************************** Function Definitions ***************************/
void BOARDINIT_Init(BOARDINIT *bdit, u32 BaseAddress){
	bdit->BaseAddress = BaseAddress;
	bdit->RstN = BaseAddress + BOARDINIT_RstN;
	bdit->Dilation0 = BaseAddress + BOARDINIT_Dilation0;
	bdit->Erosion0 = BaseAddress + BOARDINIT_Erosion0;
	bdit->Erosion1 = BaseAddress + BOARDINIT_Erosion1;
	bdit->Erosion2 = BaseAddress + BOARDINIT_Erosion2;
	bdit->Erosion3 = BaseAddress + BOARDINIT_Erosion3;
	bdit->Erosion4 = BaseAddress + BOARDINIT_Erosion4;
	bdit->Erosion5 = BaseAddress + BOARDINIT_Erosion5;
	bdit->Match0 = BaseAddress + BOARDINIT_Match0;
	bdit->HarrisTh = BaseAddress + BOARDINIT_HarrisTh;
	bdit->Top = BaseAddress + BOARDINIT_Top;
	bdit->Bottom = BaseAddress + BOARDINIT_Bottom;
	bdit->Left = BaseAddress + BOARDINIT_Left;
	bdit->Right = BaseAddress + BOARDINIT_Right;
	bdit->BlackTh = BaseAddress + BOARDINIT_BlackTh;
	bdit->WhiteTh = BaseAddress + BOARDINIT_WhiteTh;
	bdit->Sels = BaseAddress + BOARDINIT_Sels;
}

void BOARDINIT_SetWithCheck(u32 Address, u32 data){
	while(BOARDINIT_Get(Address) != data){
		BOARDINIT_Set(Address, data);
	}
	return;
}
