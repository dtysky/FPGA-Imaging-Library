## Design
Crop  



**Version**  
1.0  
  

***

**Modified**  
2015-05-25  
  

***

## Source
[Crop](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/LocalFilter/Crop)


***

## IP-GUI
![Crop IP-GUI](http://src.dtysky.moe/image/f-i-l/3/16/3.png)


***

### Function
Cropping images, depending on your top, bottom, left and right coordinate.  
Give the first output after 1 cycle1 while the input enable.  
  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>Crop.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>Crop_TB.sv</td>
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
<td>data_width</td>
<td>unsigned</td>
<td>None</td>
<td>8</td>
<td>Data bit width.</td>
</tr>
<tr>
<td>im_width</td>
<td>unsigned</td>
<td>1 - 4096</td>
<td>320</td>
<td>Width of image.</td>
</tr>
<tr>
<td>im_height</td>
<td>unsigned</td>
<td>1 - 4096</td>
<td>240</td>
<td>Height of image.</td>
</tr>
<tr>
<td>im_width_bits</td>
<td>unsigned</td>
<td>Depend on width of image</td>
<td>9</td>
<td>The bits of width of image.</td>
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
<td>top</td>
<td>input</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Top of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.</td>
</tr>
<tr>
<td>bottom</td>
<td>input</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Bottom of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.</td>
</tr>
<tr>
<td>left</td>
<td>input</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Left of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.</td>
</tr>
<tr>
<td>right</td>
<td>input</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Right of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.</td>
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
<td>data_width - 1 : 0</td>
<td>None</td>
<td>Input data, it must be synchronous with in_enable.</td>
</tr>
<tr>
<td>in_count_x</td>
<td>input</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Input pixel count for width.</td>
</tr>
<tr>
<td>in_count_y</td>
<td>input</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Input pixel count for height.</td>
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
<td>data_width - 1 : 0</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.</td>
</tr>
<tr>
<td>out_count_x</td>
<td>output</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Output pixel count for height.</td>
</tr>
<tr>
<td>out_count_y</td>
<td>output</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Output pixel count for height.</td>
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

