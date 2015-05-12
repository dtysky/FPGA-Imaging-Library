## Graying


**Version**  
1.0  

***

**Modified**  
2015-05-12  

***

## Source
![Graying](https://github.com/dtysky/FPGA-Imaging-Library/tree/master/Point/Graying)


***

### IP-GUI

![Graying-GUI](/theme/image/graying/gui.png)


***

### Function
Covert RGB images to gray-scale images.Give the first output after 2 cycles while the input enable.  

***

### Files

<table board = "3", width="100%">
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

### Parameters

<table board = "3", width="100%">
<tr>
<th>Name</th>
<th>Type</th>
<th>Range</th>
<th>Default</th>
<th>Description</th>
</tr>
<tr>
<td>work\_mode</td>
<td>unsigned</td>
<td>0 for Piplines, 1 for Req-ack</td>
<td>0</td>
<td>This module's working mode.</td>
</tr>
<tr>
<td>color\_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit wide</td>
</tr>
</table>

***

### Ports

<table board = "3", width="100%">
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
<td>rst\_n</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Reset, active low.</td>
</tr>
<tr>
<td>in\_enable</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Input data enable, in pipelines mode, it works as another rst\_n, in req-ack mode, only it is high will in\_data can be changes.</td>
</tr>
<tr>
<td>in\_data</td>
<td>input</td>
<td>unsigned</td>
<td>3 * color\_width - 1 : 0</td>
<td>None</td>
<td>Input data, it must be synchronous with in\_enable.</td>
</tr>
<tr>
<td>out\_ready</td>
<td>output</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Output data ready, in both two mode, it will be high while the out\_data can be read.</td>
</tr>
<tr>
<td>out\_data</td>
<td>output</td>
<td>unsigned</td>
<td>color\_width - 1 : 0</td>
<td>None</td>
<td>Output data, it will be synchronous with out\_ready.</td>
</tr>
</table>

***

### Instances

<table board = "3", width="100%">
<tr>
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
<tr>
<td>MulRed</td>
<td>MultiplierRedx0d299</td>
<td>Multiplier for Unsigned 12bits x 0.299, used for Red channel.The pipline stages is 2.</td>
</tr>
<tr>
<td>MulGreen</td>
<td>MultiplierGreenx0d587</td>
<td>Multiplier for Unsigned 12bits x 0.587, used for Red channel.The pipline stages is 2.</td>
</tr>
<tr>
<td>MulBlue</td>
<td>MultiplierBluex0d114</td>
<td>Multiplier for Unsigned 12bits x 0.114, used for Red channel.The pipline stages is 2.</td>
</tr>
</table>

***

## Simulations
Simulations for this module just support RGB images !

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

