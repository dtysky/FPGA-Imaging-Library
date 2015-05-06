## FPGA-Imaging-Library


## LuminanceTransform


**Version**  
1.0  

***

**Modified**  
2015-05-06  

***

### Function
Change the luminance of an image.Give the first output after 2 cycles while the input enable.  

***

### Files

<table board = "3", width="100%">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>LuminanceTransform.v</td>
<td>Main module</td>
</tr>
<tr>
<td>LuminanceTransform_TB.sv</td>
<td>Testbench</td>
</tr>
<tr>
<td>True2Comp</td>
<td>Convert true code to complemental code. Just for simulation</td>
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
<td>color\_mode</td>
<td>unsigned</td>
<td>1 - Inf</td>
<td>3</td>
<td>Channels for color, 1 for gray, 3 for rgb, etc.</td>
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
<td>lm\_gain</td>
<td>input</td>
<td>signed</td>
<td>12 : 0</td>
<td>None</td>
<td>Gain for luminance, signed.If positive must be true code, if negative, must be complemental code.</td>
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
<td>color\_mode * color\_width - 1 : 0</td>
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
<td>color\_mode * color\_width - 1 : 0</td>
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
<td>Adder</td>
<td>AddSub13Sx13S</td>
<td>Adder for Signed 12bits + Signed 12bits.The pipline stages is 2.</td>
</tr>
</table>

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

