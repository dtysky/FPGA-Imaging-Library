## Design
Threshold


**Version**  
1.0  

***

**Modified**  
2015-05-15  

***

## Source
[Threshold](https://github.com/dtysky/FPGA-Imaging-Library/tree/master/Point/Threshold)


***

## IP-GUI
![Threshold IP-GUI](http://src.dtysky.moe/image/f-i-l/3/4/.png)


***

### Function
Convert gray-scales image to binary images.Give the first output after 1 cycles while the input enable.  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>Threshold.v</td>
<td>Main module</td>
</tr>
<tr>
<td>Threshold_TB.sv</td>
<td>Test bench</td>
</tr>
</table>

***

</center>
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
<td>0 for Pipeline, 1 for Req-ack</td>
<td>0</td>
<td>This module's working mode.</td>
</tr>
<tr>
<td>color_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit width.</td>
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
<td>th_mode</td>
<td>input</td>
<td>unsigned</td>
<td>0 for Base, 1 for Contour</td>
<td>None</td>
<td>The method to processing.</td>
</tr>
<tr>
<td>th1</td>
<td>input</td>
<td>unsigned</td>
<td>color_width - 1 : 0</td>
<td>None</td>
<td>First thorshold, used for all methods.</td>
</tr>
<tr>
<td>th2</td>
<td>input</td>
<td>unsigned</td>
<td>color_width - 1 : 0</td>
<td>None</td>
<td>First thorshold, only used for "Contour" method.</td>
</tr>
<tr>
<td>in_enable</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.</td>
</tr>
<tr>
<td>in_data</td>
<td>input</td>
<td>unsigned</td>
<td>color_width - 1 : 0</td>
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
<td>None</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.</td>
</tr>
</table>
</center>

***

## Simulations
Simulations for this module just support Gray-scale !

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

