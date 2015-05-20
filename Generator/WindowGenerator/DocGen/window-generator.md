## Project
FPGA-Imaging-Library  



## Design
WindowGenerator  



**Version**  
1.0  
  

***

**Modified**  
2015-05-19  
  

***

## Source
[WindowGenerator](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/Generator/WindowGenerator)


***

## IP-GUI
![WindowGenerator IP-GUI](http://src.dtysky.moe/image/f-i-l/3/9/3.png)


***

### Function
Generate window.  
The lowest "color_width" bits of "out_data" is the top left corner pixel of the window!  
In pipeline mode, it will give the first output after window_width / 2 + 1 cycles while the input enable.  
In req-ack mode, before the first window can be output, it will give a input ack for every req, then you can give the next input data.  
  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>WindowGenerator.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>WindowGenerator_TB.sv</td>
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
<td>window_width</td>
<td>unsigned</td>
<td>2 - 15</td>
<td>3</td>
<td>The width(and height) of window.</td>
</tr>
<tr>
<td>color_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit wide.</td>
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
<td>Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.</td>
</tr>
<tr>
<td>in_data</td>
<td>input</td>
<td>unsigned</td>
<td>color_width * window_width - 1 : 0</td>
<td>None</td>
<td>Input data, it must be synchronous with in_enable.</td>
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
<td>color_width * window_width * window_width - 1 : 0</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.</td>
</tr>
<tr>
<td>input_ack</td>
<td>output</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Input ack, only used for req-ack mode, this port will give a ack while the input_data received.</td>
</tr>
</table>
</center>

***

## Simulations
Simulations for this module just support 500xN, Gray-scale and binary images ! And module just supports conf 'width' 3 and 5 !

### Waves


### Original


### Results


### PSNR





***

## Utilization



***

## Timing



***

## Power



***

