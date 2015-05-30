

/***************************** Include Files *******************************/
#include "BoardInit_AXI.h"

/************************** Function Definitions ***************************/
void BOARDINIT_Init(BOARDINIT *bdit, u32 BaseAddress){
	bdit->BaseAddress = BaseAddress;
	bdit->RstN = BaseAddress + BOARDINIT_RstN;
	bdit->ThMode = BaseAddress + BOARDINIT_ThMode;
	bdit->Th1 = BaseAddress + BOARDINIT_Th1;
	bdit->Th2 = BaseAddress + BOARDINIT_Th2;
	bdit->CtScale = BaseAddress + BOARDINIT_CtScale;
	bdit->LmGain = BaseAddress + BOARDINIT_LmGain;
	bdit->Rank = BaseAddress + BOARDINIT_Rank;
	bdit->EdMode = BaseAddress + BOARDINIT_EdMode;
	bdit->EdTemplate = BaseAddress + BOARDINIT_EdTemplate;
	bdit->MtTemplate = BaseAddress + BOARDINIT_MtTemplate;
	bdit->CropTop = BaseAddress + BOARDINIT_CropTop;
	bdit->CropBottom = BaseAddress + BOARDINIT_CropBottom;
	bdit->CropLeft = BaseAddress + BOARDINIT_CropLeft;
	bdit->CropRight = BaseAddress + BOARDINIT_CropRight;
	bdit->MirrorMode = BaseAddress + BOARDINIT_MirrorMode;
	bdit->OffsetX = BaseAddress + BOARDINIT_OffsetX;
	bdit->OffsetY = BaseAddress + BOARDINIT_OffsetY;
	bdit->ScaleX = BaseAddress + BOARDINIT_ScaleX;
	bdit->ScaleY = BaseAddress + BOARDINIT_ScaleY;
	bdit->ShU = BaseAddress + BOARDINIT_ShU;
	bdit->ShV = BaseAddress + BOARDINIT_ShV;
	bdit->Angle = BaseAddress + BOARDINIT_Angle;
	bdit->Sels = BaseAddress + BOARDINIT_Sels;
}

void BOARDINIT_SetWithCheck(u32 Address, u32 data){
	while(BOARDINIT_Get(Address) != data){
		BOARDINIT_Set(Address, data);
	}
	return;
}

void BOARDINIT_Reset(BOARDINIT *bdit){
	BOARDINIT_SetWithCheck(bdit -> RstN, 0);
	BOARDINIT_SetWithCheck(bdit -> RstN, 1);
	return;
}

u32 Format2Fixed(float num, int rel_width, int dec_width){
	u32 s = 0;
	u32 r = 0;
	float dtmp = 0;
	if (num < 0)
	{
		s = 1 << (rel_width + dec_width);
		r = (int)(-num);
		dtmp = (int)num - num;
	}
	else
	{
		r = (int)num;
		dtmp = num - r;
	}
	r = r << dec_width;
	u32 d = 0;
	int i =0;
	for (i = 0; i < dec_width; i++)
	{
		dtmp = dtmp * 2;
		if (dtmp >= 1)
		{
			d += 1 << (dec_width - 1 - i);
			dtmp--;
		}
	}
	if (s)
	{
		return s + s - (r + d);
	}
	return s + r + d;
}


void BOARDINIT_SetFixed(u32 Address, float num, int rel_width, int dec_width){
	u32 f = Format2Fixed(num, rel_width, dec_width);
	BOARDINIT_SetWithCheck(Address, f);
	return;
}
