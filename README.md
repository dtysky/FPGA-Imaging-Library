# IMAGE_PROCESS_SUB_MODULE
**All sub modules for image processing project on FPGA.  
Each module has its software and hdl simulation, and will be packaged to vivado IPcore.  
All software projects are depent on python 2.7.8 and PIL module, and hdl projects are built on xilinx vivado.  
You can also use these in quartus, just get hdl files**  

***
# Introduction：

## Dirs Struct:

This project will content many moudles, which are useful in image processing.  
Each module will have its directory, and this directories will have the same struct as follows:  

**1.IMAGE_FOR_TEST:**  
A directory for storing images, you can put your '.jpg' images for testing here.  

**2.SOFT_SIM:**  
Files for software simulation will be here, those can show you this module's function by software method.  
The result will be placed in SIM_CHECK directory.

**3.DATA_CREATE:**  
Files for creating a mif and a dat file, mif file can be a init file for rom, and dat file can be used for hdl function simulation.  
Mif file will be placed in this directory, and the dat file will in HDL_SIM.

**4. HDL_SIM:**  
Hdl function simulation will be done here, please use Modelsim to open XXX.mpc file.

**5. SIM_CHECK:**  
Creating a image from the result of hdl function simulation, software simulation's result also will be here.  

**6. HDL:**  
FPGA project will be here, built on xilinx vivado.  
The function simulation's result will be placed in SIM_CHECK directory.

***

## Testing process:
--------------
1. Put your image files in  IMAGE_FOR_TEST.  
2. Run software simulation in SOFT_SIM.  
3. Creat files used for function simulation and testing on board in DATA_CREAT.  
4. Run fpga function simulation in HDL_SIM, please using Modelsim, until the vivado can support a complete systemverilog.  
5. Convent function simulation's results to image in SIM_CHECK.  
6. If you want to do testing on board, you can open the project "TEST_ON_BOARD", the replace the moudle in .bd file, help yourself.

***

## Modules:

### Special:
 
#### 1.TEST_ON_BOARD:

**Function:**  
This is a special project for all sub modules' testing on board.

### Point:

#### 1.RGB2GRAY:

**Progress:**  
100%.  
**Function:**  
Graying, transforming a 24bits(rgb) image to a 8bits(gray) image.  
**HDL Files:**  
1. RGB2GRAY.v: Main function.  
2. RGB2GRAY_TB.sv: TestBench.

#### 2.GRAY2BIN:

**Progress:**  
100%.  
**Function:**  
Binorization, transforming a 8bits(gray) image to a 1bit(bin) image.  
**HDL Files:**  
1. GARY2BIN.v: Main function.  
2. GARY2BIN_TB.sv: TestBench.

#### 3.LM_CT_TRANS:

**Progress:**  
100%.  
**Function:**  
CT and luminance transition, changing a 8bits(a channel of rgb image) color's CT and luminance.  
**HDL Files:**  
1. LM_CT_TRANS.v: Main function.  
2. LM_CT_TRANS_TB.sv: TestBench.  
3. MUL_FOR_SIM.sv: A multiplier for testing.

### Window:

#### 1.RowsCreator:
**Progress:**  
100%.    
**Function:**  
Create and maintain some rows cache, preparing for creating window.  
**HDL Files:**  
1. Rows8x512/Rows8x512.v: A module for creating some rows by an image which max width is 512bits and color is 8bits.  
2. Rows8x512/Rows8x512_TB.sv: Testbench for Rows8x512.  

#### 2.WindowCreator:
**Progress:**  
100%.    
**Function:**  
Create a window from image by your definitions.  
It will use some fifos which deepth is image's width and the amount of them are your window size.   
**HDL Files:**  
1. Window.v: A module for creating a window from rows cache.  
2. Window_TB.sv: Testbench for Window.  

#### 3.MeanFitter:
**Progress:**  
100%.    
**Function:**  
Get the mean value form a window which created by WindowCreat.  
**HDL Files:**  
1. MeanFitter.v: Main module.  
2. MeanFitter_TB.sv: Testbench.  

#### 4.ErosionDilation:
**Progress:**  
20%.    
**Function:**  
Binary Morphology : erosion and dilation.  
**HDL Files:**  

#### 5.MatchTemplate:
**Progress:**  
40%.    
**Function:**  
Binary Morphology : using a template window to match your image.  
**HDL Files:**  

### Recognition:

#### 1.Harris:
**Progress:**  
40%.    
**Function:**  
Get all  corners from input images by harris method.  
**HDL Files:**  

### Character:

#### 1.CHR_ASCII_8X8：

**Progress:**  
20%.    
Suspended development.  
**Function:**  
ASCII Characters Output, output characters to a frame buffer in specified position by index and offset.  
**HDL Files:**  
1. FONT_CREAT\: Create font source by FONT.tff.    
2. FONT_SOURCE.v: font source.  

### OTHER_IP:

**Function:**  
Some Special IPs, for connecting and some hardware's controlling.  

***

Others
======
Thanks
---
**All images for testing are from [LM7](http://lm7.xxxxxxxx.jp/).**

Author
---
**Dai Tianyu(dtysky)**   
[http://dtysky.github.io](http://dtysky.github.io)  
[dtysky@outlook.com](dtysky@outlook.com)  
[http://github.com/dtysky](http://github.com/dtysky)

Copyright
---
**Copyright © 2015, Dai Tianyu(dtysky). All Rights Reserved.  
This project is free software and released under the** [MIT License (MIT)](http://mit-license.org/).