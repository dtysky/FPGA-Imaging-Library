## Design
Rotate  



**Version**  
1.0  
  

***

**Modified**  
2015-05-28  
  

***

## Source
[Rotate](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/LocalFilter/Rotate)


***

## IP-GUI
![Rotate IP-GUI](http://src.dtysky.moe/image/f-i-l/3/21/3.png)


***

### Function
  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>Rotate.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>Rotate_TB.sv</td>
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
<td>signed</td>
<td>1 - 4096</td>
<td>320</td>
<td>Width of image.</td>
</tr>
<tr>
<td>im_height</td>
<td>signed</td>
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
<td>angle</td>
<td>input</td>
<td>unsigned</td>
<td>0 - 359</td>
<td>None</td>
<td>Angle.</td>
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
<td>Connect to in_count_u in FrameController.</td>
</tr>
<tr>
<td>frame_out_count_y</td>
<td>output</td>
<td>unsigned</td>
<td>im_width_bits - 1 : 0</td>
<td>None</td>
<td>Connect to in_count_v in FrameController.</td>
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
<td>sina)</td>
<td>SinLUT</td>
<td>Getting sine of angle.</td>
</tr>
<tr>
<td>cosa)</td>
<td>CosLUT</td>
<td>Getting cosine of angle.</td>
</tr>
<tr>
<td>MulX1</td>
<td>Multiplier13Sx20SRTT</td>
<td>Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulX2</td>
<td>Multiplier13Sx20SRTT</td>
<td>Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulY1</td>
<td>Multiplier13Sx20SRTT</td>
<td>Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulY2</td>
<td>Multiplier13Sx20SRTT</td>
<td>Multiplier for Unsigned 12bits x Signed 25bits, used for fixed multiplication.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>FRSX1</td>
<td>FixedRoundSigned</td>
<td>For rounding signed fixed number.</td>
</tr>
<tr>
<td>FRSX2</td>
<td>FixedRoundSigned</td>
<td>For rounding signed fixed number.</td>
</tr>
<tr>
<td>FRSY1</td>
<td>FixedRoundSigned</td>
<td>For rounding signed fixed number.</td>
</tr>
<tr>
<td>FRSY2</td>
<td>FixedRoundSigned</td>
<td>For rounding signed fixed number.</td>
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

