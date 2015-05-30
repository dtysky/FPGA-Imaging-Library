
#ifndef BOARDINIT_AXI_H
#define BOARDINIT_AXI_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define BOARDINIT_AXI_S00_AXI_SLV_REG0_OFFSET 0
#define BOARDINIT_AXI_S00_AXI_SLV_REG1_OFFSET 4
#define BOARDINIT_AXI_S00_AXI_SLV_REG2_OFFSET 8
#define BOARDINIT_AXI_S00_AXI_SLV_REG3_OFFSET 12
#define BOARDINIT_AXI_S00_AXI_SLV_REG4_OFFSET 16
#define BOARDINIT_AXI_S00_AXI_SLV_REG5_OFFSET 20
#define BOARDINIT_AXI_S00_AXI_SLV_REG6_OFFSET 24
#define BOARDINIT_AXI_S00_AXI_SLV_REG7_OFFSET 28
#define BOARDINIT_AXI_S00_AXI_SLV_REG8_OFFSET 32
#define BOARDINIT_AXI_S00_AXI_SLV_REG9_OFFSET 36
#define BOARDINIT_AXI_S00_AXI_SLV_REG10_OFFSET 40
#define BOARDINIT_AXI_S00_AXI_SLV_REG11_OFFSET 44
#define BOARDINIT_AXI_S00_AXI_SLV_REG12_OFFSET 48
#define BOARDINIT_AXI_S00_AXI_SLV_REG13_OFFSET 52
#define BOARDINIT_AXI_S00_AXI_SLV_REG14_OFFSET 56
#define BOARDINIT_AXI_S00_AXI_SLV_REG15_OFFSET 60
#define BOARDINIT_AXI_S00_AXI_SLV_REG16_OFFSET 64
#define BOARDINIT_AXI_S00_AXI_SLV_REG17_OFFSET 68
#define BOARDINIT_AXI_S00_AXI_SLV_REG18_OFFSET 72
#define BOARDINIT_AXI_S00_AXI_SLV_REG19_OFFSET 76
#define BOARDINIT_AXI_S00_AXI_SLV_REG20_OFFSET 80
#define BOARDINIT_AXI_S00_AXI_SLV_REG21_OFFSET 84
#define BOARDINIT_AXI_S00_AXI_SLV_REG22_OFFSET 88
#define BOARDINIT_AXI_S00_AXI_SLV_REG23_OFFSET 92
#define BOARDINIT_AXI_S00_AXI_SLV_REG24_OFFSET 96
#define BOARDINIT_AXI_S00_AXI_SLV_REG25_OFFSET 100
#define BOARDINIT_AXI_S00_AXI_SLV_REG26_OFFSET 104
#define BOARDINIT_AXI_S00_AXI_SLV_REG27_OFFSET 108
#define BOARDINIT_AXI_S00_AXI_SLV_REG28_OFFSET 112
#define BOARDINIT_AXI_S00_AXI_SLV_REG29_OFFSET 116
#define BOARDINIT_AXI_S00_AXI_SLV_REG30_OFFSET 120
#define BOARDINIT_AXI_S00_AXI_SLV_REG31_OFFSET 124

#define BOARDINIT_RstN BOARDINIT_AXI_S00_AXI_SLV_REG0_OFFSET
#define BOARDINIT_ThMode BOARDINIT_AXI_S00_AXI_SLV_REG1_OFFSET
#define BOARDINIT_Th1 BOARDINIT_AXI_S00_AXI_SLV_REG2_OFFSET
#define BOARDINIT_Th2 BOARDINIT_AXI_S00_AXI_SLV_REG3_OFFSET
#define BOARDINIT_CtScale BOARDINIT_AXI_S00_AXI_SLV_REG4_OFFSET
#define BOARDINIT_LmGain BOARDINIT_AXI_S00_AXI_SLV_REG5_OFFSET
#define BOARDINIT_Rank BOARDINIT_AXI_S00_AXI_SLV_REG6_OFFSET
#define BOARDINIT_EdMode BOARDINIT_AXI_S00_AXI_SLV_REG7_OFFSET
#define BOARDINIT_EdTemplate BOARDINIT_AXI_S00_AXI_SLV_REG8_OFFSET
#define BOARDINIT_MtTemplate BOARDINIT_AXI_S00_AXI_SLV_REG9_OFFSET
#define BOARDINIT_CropTop BOARDINIT_AXI_S00_AXI_SLV_REG10_OFFSET
#define BOARDINIT_CropBottom BOARDINIT_AXI_S00_AXI_SLV_REG11_OFFSET
#define BOARDINIT_CropLeft BOARDINIT_AXI_S00_AXI_SLV_REG12_OFFSET
#define BOARDINIT_CropRight BOARDINIT_AXI_S00_AXI_SLV_REG13_OFFSET
#define BOARDINIT_MirrorMode BOARDINIT_AXI_S00_AXI_SLV_REG14_OFFSET
#define BOARDINIT_OffsetX BOARDINIT_AXI_S00_AXI_SLV_REG15_OFFSET
#define BOARDINIT_OffsetY BOARDINIT_AXI_S00_AXI_SLV_REG16_OFFSET
#define BOARDINIT_ScaleX BOARDINIT_AXI_S00_AXI_SLV_REG17_OFFSET
#define BOARDINIT_ScaleY BOARDINIT_AXI_S00_AXI_SLV_REG18_OFFSET
#define BOARDINIT_ShU BOARDINIT_AXI_S00_AXI_SLV_REG19_OFFSET
#define BOARDINIT_ShV BOARDINIT_AXI_S00_AXI_SLV_REG20_OFFSET
#define BOARDINIT_Angle BOARDINIT_AXI_S00_AXI_SLV_REG21_OFFSET
#define BOARDINIT_Sels BOARDINIT_AXI_S00_AXI_SLV_REG31_OFFSET




/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a BOARDINIT_AXI register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the BOARDINIT_AXIdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void BOARDINIT_AXI_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */



typedef struct
{
	u32 BaseAddress;
	u32 RstN;
	u32 ThMode;
	u32 Th1;
	u32 Th2;
	u32 CtScale;
	u32 LmGain;
	u32 Rank;
	u32 EdMode;
	u32 EdTemplate;
	u32 MtTemplate;
	u32 CropTop;
	u32 CropBottom;
	u32 CropLeft;
	u32 CropRight;
	u32 MirrorMode;
	u32 OffsetX;
	u32 OffsetY;
	u32 ScaleX;
	u32 ScaleY;
	u32 ShU;
	u32 ShV;
	u32 Angle;
	u32 Sels;
} BOARDINIT;

void BOARDINIT_Init(BOARDINIT *bdit, u32 BaseAddress);
void BOARDINIT_SetWithCheck(u32 address, u32 data);
void BOARDINIT_Reset(BOARDINIT *bdit);
u32 Format2Fixed(float num, int rel_width, int dec_width);
void BOARDINIT_SetFixed(u32 Address, float num, int rel_width, int dec_width);

#define BOARDINIT_Set(address, data) \
  	Xil_Out32(address, data)

#define BOARDINIT_Get(address) \
  	Xil_In32(address)

#define BOARDINIT_AXI_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a BOARDINIT_AXI register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the BOARDINIT_AXI device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 BOARDINIT_AXI_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define BOARDINIT_AXI_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the BOARDINIT_AXI instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus BOARDINIT_AXI_Reg_SelfTest(void * baseaddr_p);

#endif // BOARDINIT_AXI_H
