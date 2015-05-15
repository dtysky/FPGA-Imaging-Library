## Design
FrameController


**Version**  
1.0  

***

**Modified**  
2015-05-12  

***

## Source
[FrameController](https://github.com/dtysky/FPGA-Imaging-Library/tree/master/Generator/FrameController)


***

## IP-GUI
![FrameController IP-GUI](https://src.dtysky.moe/image/f-i-l/3/2/7.png)


***

### Function
For controlling a block ram from xilinx.Give the first output after ram_read_latency cycles while the input enable.  

***

### Files

<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>FrameController.v</td>
<td>Main module</td>
</tr>
<tr>
<td>FrameController_TB.sv</td>
<td>Test bench</td>
</tr>
<tr>
<td>BRam8x512x512_funcsim.v</td>
<td>Model for functional simulation.</td>
</tr>
</table>

***

### Parameters

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
<td>wr_mode</td>
<td>unsigned</td>
<td>0 for Write, 1 for Read</td>
<td>0</td>
<td>This module's WR mode.</td>
</tr>
<tr>
<td>color_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit width.</td>
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
<td>addr_width</td>
<td>unsigned</td>
<td>Depend on im_width and im_height.</td>
<td>17</td>
<td>Address bit width of a ram for storing this image.</td>
</tr>
<tr>
<td>ram_read_latency</td>
<td>unsigned</td>
<td>0 - 15, Depend on your using ram.</td>
<td>2</td>
<td>RL of RAM, in xilinx 7-series device, it is 2.</td>
</tr>
<tr>
<td>row_init</td>
<td>unsigned</td>
<td>Depend on your input offset.</td>
<td>0</td>
<td>The first row you want to storing, used for eliminating offset.</td>
</tr>
</table>

***

### Ports

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
<td>color_width - 1 : 0</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.</td>
</tr>
<tr>
<td>ram_addr</td>
<td>output</td>
<td>unsigned</td>
<td>addr_width - 1 : 0</td>
<td>None</td>
<td>Address for ram.</td>
</tr>
</table>

***

## Simulations
Simulations for this module just support Gray-scale and 512x512 images !

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

