## Design
Graying


**Version**  
1.0  

***

**Modified**  
2015-05-12  

***

## Source
[Graying](https://github.com/dtysky/FPGA-Imaging-Library/tree/master/Point/Graying)


***

## IP-GUI
![Graying IP-GUI](http://src.dtysky.moe/image/f-i-l/3/2/7.png)


***

### Function
Covert RGB images to gray-scale images.Users can configure the multipliers by themselves.Give the first output after mul_delay + 2 cycles while the input enable.  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>Graying.v</td>
<td>Main module</td>
</tr>
<tr>
<td>Graying_TB.sv</td>
<td>Test bench</td>
</tr>
<tr>
<td>MultiplierRedx0d299.xci</td>
<td>Xilinx IPCore file.</td>
</tr>
<tr>
<td>MultiplierRedx0d299_funcsim.v</td>
<td>Model for functional simulation.</td>
</tr>
<tr>
<td>MultiplierGreenx0d587.xci</td>
<td>Xilinx IPCore file.</td>
</tr>
<tr>
<td>MultiplierGreenx0d587_funcsim.v</td>
<td>Model for functional simulation.</td>
</tr>
<tr>
<td>MultiplierBluex0d114.xci</td>
<td>Xilinx IPCore file.</td>
</tr>
<tr>
<td>MultiplierBluex0d114_funcsim.v</td>
<td>Model for functional simulation.</td>
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
<tr>
<td>mul_delay</td>
<td>unsigned</td>
<td>Depend your multilpliers' configurations</td>
<td>4</td>
<td>Delay for multiplier.</td>
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
<td>Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.</td>
</tr>
<tr>
<td>in_data</td>
<td>input</td>
<td>unsigned</td>
<td>3 * color_width - 1 : 0</td>
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
<td>MulRed</td>
<td>MultiplierRedx0d299</td>
<td>Multiplier for Unsigned 12bits x 0.299, used for red channel.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulGreen</td>
<td>MultiplierGreenx0d587</td>
<td>Multiplier for Unsigned 12bits x 0.587, used for green channel.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
<tr>
<td>MulBlue</td>
<td>MultiplierBluex0d114</td>
<td>Multiplier for Unsigned 12bits x 0.114, used for blue channel.You can configure the multiplier by yourself, then change the "mul_delay".All Multiplier's pipeline stage must be same, you can not change the ports' configurations!</td>
</tr>
</table>
</center>

***

## Simulations
Simulations for this module just support Gray-scale and 512x512 images !

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

