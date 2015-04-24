# Image-processing-on-FPGA
**All sub modules for image processing project on FPGA.  
Each module has its software and hdl simulation, and will be packaged to vivado IPcore.  
All software projects are depent on python 2.7.8 and PIL module, and hdl projects are built on xilinx vivado.  
You can also use these in quartus, just get hdl files**.  

***
# Introduction：

## Dirs Structure:

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

### SPECIAL:
 
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

#### 2.Threshold:

**Progress:**  
100%.  
**Function:**  
Thresholding depend on two threshold, convert the grayscale image to ternary or binary image.  
**HDL Files:**  
1. Threshold.v: Main function.  
2. Threshold_TB.sv: TestBench.

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

#### 1.FrameController:
**Progress:**  
100%.    
**Function:**  
For writing or reading data to a block ram, this IP can be usefull to store your image.  
**HDL Files:**  
1. Frame.v: Main module.  
2. Frame_TB.sv: Testbench for Frame. 

#### 2.RowsCreator:
**Progress:**  
100%.    
**Function:**  
Create and maintain some rows cache, preparing for creating window.  
**HDL Files:**  
1. Rows8x512/Rows8x512.v: A module for creating some rows by an image which max width is 512bits and color is 8bits.  
2. Rows8x512/Rows8x512_TB.sv: Testbench for Rows8x512.  
3. Rows1x512/Rows8x512.v: A module for creating some rows by an image which max width is 512bits and color is 1bit.  

#### 3.WindowCreator:
**Progress:**  
100%.    
**Function:**  
Create a window from image by your definitions.  
It will use some fifos which deepth is image's width and the amount of them are your window size.   
**HDL Files:**  
1. Window.v: A module for creating a window from rows cache.  
2. Window_TB.sv: Testbench for Window.  

#### 4.MeanFitter:
**Progress:**  
100%.    
**Function:**  
Get the mean value form a window which created by WindowCreat.  
**HDL Files:**  
1. MeanFitter.v: Main module.  
2. MeanFitter_TB.sv: Testbench.  

#### 5.ErosionDilationBin:
**Progress:**  
100%.    
**Function:**  
Binary Morphology : erosion and dilation.  
**HDL Files:**  
1. ErosionDilationBin.v: Main module.  
2. ErosionDilationBin_TB.sv: Testbench for ErosionDilationBin.  

#### 6.ErosionDilationGray:
**Progress:**  
100%.    
**Function:**  
Gray Morphology : erosion and dilation.  
**HDL Files:**  
1. ErosionDilationGray.v: Main module.  
2. ErosionDilationGray_TB.sv: Testbench for ErosionDilationBin.  

#### 7.MatchTemplateBin:
**Progress:**  
100%.    
**Function:**  
Binary Morphology : using a template window to match your image.  
**HDL Files:**  
1. MatchTemplateBin.v: Main module.  
2. MatchTemplateBin_TB.sv: Testbench for MatchTemplateBin.   

#### 8.RankFitter:
**Progress:**  
100%.    
**Function:**  
Sort all data from a window, then output the result by your giving ordinal.  
**HDL Files:**  
1. RankFitter.v: Main module.  
2. RankFitter_TB.sv: Testbench for RankFitter.  

#### 9.RankFitterFast:
**Progress:**  
100%.    
**Function:**  
Sort all data from a window, then output the result by your giving ordinal.  
This module is faster than "RankFitter", only spending 2 cycles it can give the first output, but it just support window size 1, 2, 3 and 4.  
**HDL Files:**  
1. CountEncoder.v: An encoder for getting the count of '1' from input data.  
2. Encoder.v: An normal encoder.  
3. RankFitterFast.v: Main module.  
4. RankFitterFast_TB.sv: Testbench for RankFitterFast.  

#### 10.Gary2BinAuto:
**Progress:**  
100%.    
**Function:**  
Auto binorization from original pixel and a pixel for referencing, the original pixel will be given by a window, and ref pixel may from some fitters.  
**HDL Files:**  
1. Gary2BinAuto.v: Main module.  
2. Gary2BinAuto_TB.sv: Testbench for Gary2BinAuto, this simulation use "MeanFitter" as default.  

### Recognition:

#### 1.Harris:
**Progress:**  
100%.    
**Function:**  
Get all  corners from input images by harris method.  
**HDL Files:**  
1. Harris.v: Main module.  
2. Harris_TB.sv: Testbench for Harris.  

### GEOMETRIC

#### 1. FrameController2:

**Progress:**  
100%.  
**Function:**  
Controlling a frame(block ram etc.), writing or reading with counts.  
**HDL Files:**  
1. Frame2.v: Main module.    
2. Frame2_TB.sv: Testbench for Frame2.  

#### 2. Crop:

**Progress:**  
100%.  
**Function:**  
Cropping a image, depending on your top, bottom, left and right coordinate.  
**HDL Files:**  
1. Crop.v: Main module.    
2. Crop_TB.sv: Testbench for Crop.  

#### 3. Pan:

**Progress:**  
100%.  
**Function:**  
Panning a image from your given offset.  
**HDL Files:**  
1. Pan.v: Main module.    
2. Pan_TB.sv: Testbench for Pan.  

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

### CONNECT:

**Function:**  
Some Special IPs, for connecting.  

#### Color16to24:
Convert 16bits color to 24bits color.  

#### ColorBin2Rgb:
Convert 1bit color to 24bits color.  

#### ColorGray2Rgb:
Convert 8bits color to 24bits color.  

#### ColorRgb2Vga:
Convert 24bits color to vga color.  

#### ColorRgbMux:
A multiplexer for rbg color.   

#### DataDelay:
Create pipelines between input and output.  

#### Mux2:
As its name.  

#### Or8:
As its name. 

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
This project is free software and released under the** [GNU Lesser General Public License (LGPL)](https://www.gnu.org/licenses/lgpl-2.1.html).