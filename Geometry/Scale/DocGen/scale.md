## Design
Scale  



**Version**  
1.0  
  

***

**Modified**  
2015-05-28  
  

***

## Source
[Scale](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/LocalFilter/Scale)


***

## IP-GUI
![Scale IP-GUI](http://src.dtysky.moe/image/f-i-l/3/18/3.png)


***

### Function
Scaling an image by your given scale.  
Give the first output after 1 cycle while the frame input ready.  
  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>Scale.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>FrameController2.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>FrameController.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>Scale_TB.sv</td>
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
<td>wr_mode</td>
<td>unsigned</td>
<td>0 for Write, 1 for Read</td>
<td>0</td>
<td>This module's WR mode.</td>
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
<td>mul_delay</td>
<td>unsigned</td>
<td>Depend on your multilpliers' configurations</td>
<td>3</td>
<td>Delay for multiplier.</td>
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
<tr>
<td>mul_delay</td>
<td>unsigned</td>
<td>Depend on your multilpliers' configurations, 1 - 14</td>
<td>3</td>
<td>Delay for multiplier.</td>
</tr>
<tr>
<td>ram_RL</td>
<td>unsigned</td>
<td>Depend on your FrameController</td>
<td>7</td>
<td>Delay for FrameController.</td>
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
<td>data_width - 1 : 0</td>
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
<td>data_width - 1 : 0</td>
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
<td>ram_addr</td>
<td>output</td>
<td>unsigned</td>
<td>addr_width - 1 : 0</td>
<td>None</td>
<td>Address for ram.</td>
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
<td>scale_x</td>
<td>input</td>
<td>unsigned</td>
<td>Fixed number, 6bits.18bits</td>
<td>None</td>
<td>Scale for horizontal, must be reciprocal of real scale.</td>
</tr>
<tr>
<td>scale_y</td>
<td>input</td>
<td>unsigned</td>
<td>Fixed number, 4bits.20bits</td>
<td>None</td>
<td>Scale for vertical, must be reciprocal of real scale.</td>
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
<td>frame_in_ready</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Connect to out_ready in FrameController.</td>
</tr>
<tr>
<td>frame_in_data</td>
<td>input</td>
<td>unsigned</td>
<td>data_width - 1 : 0</td>
<td>None</td>
<td>Connect to out_data in FrameController.</td>
</tr>
<tr>
<td>frame_enable</td>
<td>output</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Connect to in_enable in FrameController.</td>
</tr>
<tr>
<td>frame_out_count_x</td>
<td>output</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Connect to in_count_x in FrameController.</td>
</tr>
<tr>
<td>frame_out_count_y</td>
<td>output</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Connect to in_count_y in FrameController.</td>
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
</table>
</center>

***

### Instances

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
<tr>
<td>Mul</td>
<td>Multiplier12x12FR2</td>
<td>Multiplier for Unsigned 12bits x Unsigned 12bits, used for creating address for frame.You can configure the multiplier by yourself, then change the "mul_delay".You can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulX</td>
<td>Multiplier12x24SCL</td>
<td>Multiplier for Unsigned 12bits x Unsigned 24bits, used for fixed multiplication.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulY</td>
<td>Multiplier12x24SCL</td>
<td>Multiplier for Unsigned 12bits x Unsigned 24bits, used for fixed multiplication.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>FRUX</td>
<td>FixedRoundUnsigned</td>
<td>For rounding fixed number.</td>
</tr>
<tr>
<td>FRUY</td>
<td>FixedRoundUnsigned</td>
<td>For rounding fixed number.</td>
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

