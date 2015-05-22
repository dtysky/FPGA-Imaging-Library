## Design
ThresholdLocal  



**Version**  
1.0  
  

***

**Modified**  
2015-05-22  
  

***

## Source
[ThresholdLocal](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/LocalFilter/ThresholdLocal)


***

## IP-GUI
![ThresholdLocal IP-GUI](http://src.dtysky.moe/image/f-i-l/3/12/4.png)


***

### Function
Local thresholding by Threshold from filters.  
It will give the first output after 1 cycle while the tow input both enable.  
ref_enable must enable after in_enable !  
  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>ThresholdLocal.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>ThresholdLocal_TB.sv</td>
<td>Test bench  
</td>
</tr>
</table>
</center>

***

### Parameters

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Type</th>
<th>Range</th>
<th>Default</th>
<th>Description</th>
</tr>
<tr>
<td>work_mode</td>
<td>unsigned</td>
<td>0 for Pipline, 1 for Req-ack</td>
<td>0</td>
<td>This module's working mode.</td>
</tr>
<tr>
<td>in_window_width</td>
<td>unsigned</td>
<td>1 - 15</td>
<td>1</td>
<td>The width(and height) of input window, if input is not a window, set it to 1.</td>
</tr>
<tr>
<td>color_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit width.</td>
</tr>
<tr>
<td>max_delay</td>
<td>unsigned</td>
<td>None</td>
<td>8</td>
<td>The possible max cycles from in_enable to ref_enable.</td>
</tr>
<tr>
<td>max_delay_bits</td>
<td>unsigned</td>
<td>Depend on max delay</td>
<td>4</td>
<td>Width bits of max delay.</td>
</tr>
</table>
</center>

***

### Ports

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Port</th>
<th>Type</th>
<th>Range</th>
<th>Default</th>
<th>Description</th>
</tr>
<tr>
<td>clk</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Clock.</td>
</tr>
<tr>
<td>rst_n</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Reset, active low.</td>
</tr>
<tr>
<td>in_enable</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Filter's rank, if half of full size of window, this module working as median filter, etc.</td>
</tr>
<tr>
<td>in_data</td>
<td>input</td>
<td>unsigned</td>
<td>color_width * in_window_width * in_window_width - 1 : 0</td>
<td>None</td>
<td>Input data, it must be synchronous with in_enable.</td>
</tr>
<tr>
<td>ref_enable</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Threshold enable.</td>
</tr>
<tr>
<td>ref_data</td>
<td>input</td>
<td>unsigned</td>
<td>color_width - 1 : 0</td>
<td>None</td>
<td>Threshold, used as threshold for thresholding, it must be synchronous with ref_enable.</td>
</tr>
<tr>
<td>out_ready</td>
<td>output</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Output data ready, in both two mode, it will be high while the out_data can be read.</td>
</tr>
<tr>
<td>out_data</td>
<td>output</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.</td>
</tr>
</table>
</center>

***

## Simulations
Simulations for this module just support Gray-scale images !

### Waves


### Original


### Results


### PSNR





***

## Utilization



***

## Timing



***

## Thanks
**The sources of images for simulations:**  



***

