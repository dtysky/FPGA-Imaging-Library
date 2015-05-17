## Project
FPGA-Imaging-Library


## Design
ContrastTransform


**Version**  
1.0  

***

**Modified**  
2015-05-16  

***

## Source
[ColorReversal](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/Point/ColorReversal)


***

## IP-GUI
![ColorReversal IP-GUI](http://src.dtysky.moe/image/f-i-l/3/7/3.png)


***

### Function
Get a reversal all ponit's color.Give the first output after 1 cycle while the input enable.  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>ColorReversal.v</td>
<td>Main module</td>
</tr>
<tr>
<td>ColorReversal_TB.sv</td>
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
<td>0 for Pipelines, 1 for Req-ack</td>
<td>0</td>
<td>This module's working mode.</td>
</tr>
<tr>
<td>color_channels</td>
<td>unsigned</td>
<td>None</td>
<td>3</td>
<td>Channels for color, 1 for gray, 3 for rgb, etc.</td>
</tr>
<tr>
<td>color_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit wide</td>
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
<td>Input data enable, in pipelines mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.</td>
</tr>
<tr>
<td>in_data</td>
<td>input</td>
<td>unsigned</td>
<td>color_channels * color_width - 1 : 0</td>
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
<td>color_channels * color_width - 1 : 0</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.</td>
</tr>
</table>
</center>

***

## Simulations
Functional simulation is just supported for RGB and Gray-scale images !

### Software


### HDL


### Compare





***

## Utilization



***

## Timing



***

## Power



***

