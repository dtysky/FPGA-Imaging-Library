## Project
FPGA-Imaging-Library  



## Design
RowsGenerator  



**Version**  
1.0  
  

***

**Modified**  
2015-05-18  
  

***

## Source
[RowsGenerator](https://github.com/dtysky/FPGA-Imaging-Library/tree/Publish/Generate/RowsGenerator)


***

## IP-GUI
![RowsGenerator IP-GUI](http://src.dtysky.moe/image/f-i-l/3/8/3.png)


***

### Function
Generate rows cache, **this module just support Pipeline mode now !!!**  
The lowest color_width-bits of out_data are the first row!  
You can configure all fifos by yourself, but fifos in one project whcih have same name must have same configurations.  
And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !  
Give the first output after rows_width * (rows_depth + 1) cycles while the input enable.  
  

***

### Files

<center>
<table border="1" cellspacing="0">
<tr>
<th>Name</th>
<th>Function</th>
</tr>
<tr>
<td>RowsGenerator.v</td>
<td>Main module  
</td>
</tr>
<tr>
<td>RowsGenerator_TB.sv</td>
<td>Test bench  
</td>
</tr>
<tr>
<td>Fifo1xWidthRows.xci</td>
<td></td>
</tr>
<tr>
<td>Fifo1xWidthRows_funcsim.v</td>
<td></td>
</tr>
<tr>
<td>Fifo4xWidthRows.xci</td>
<td></td>
</tr>
<tr>
<td>Fifo4xWidthRows_funcsim.v</td>
<td></td>
</tr>
<tr>
<td>Fifo8xWidthRows.xci</td>
<td></td>
</tr>
<tr>
<td>Fifo8xWidthRows_funcsim.v</td>
<td></td>
</tr>
<tr>
<td>Fifo12xWidthRows.xci</td>
<td></td>
</tr>
<tr>
<td>Fifo12xWidthRows_funcsim.v</td>
<td></td>
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
<td>rows_width</td>
<td>unsigned</td>
<td>2 - 15</td>
<td>3</td>
<td>The width of rows.</td>
</tr>
<tr>
<td>im_width</td>
<td>unsigned</td>
<td>1 - 4096</td>
<td>320</td>
<td>Thee width of image.</td>
</tr>
<tr>
<td>color_width</td>
<td>unsigned</td>
<td>1 - 12</td>
<td>8</td>
<td>Color's bit wide.</td>
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
<td>in_enable</td>
<td>input</td>
<td>unsigned</td>
<td>None</td>
<td>None</td>
<td>Input data enable, it works as fifo0's wr_en.</td>
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
<td>rows_width * color_width - 1 : 0</td>
<td>None</td>
<td>Output data, it will be synchronous with out_ready.The lowest color_width-bits of this are the first row!</td>
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
<td>Fifo</td>
<td>Fifo1xWidthRows</td>
<td>Fifo which has 1 width and N depth (0 < N < 4096), used for rows cache which width is 1.You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations.And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !</td>
</tr>
<tr>
<td>Fifo</td>
<td>Fifo4xWidthRows</td>
<td>Fifo which has 4 width and N depth (0 < N < 4096), used for rows cache which width is 2, 3 and 4.You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations.And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !</td>
</tr>
<tr>
<td>Fifo</td>
<td>Fifo8xWidthRows</td>
<td>Fifo which has 8 width and N depth (0 < N < 4096), used for rows cache which width is 5, 6, 7 and 8.You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations.And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !</td>
</tr>
<tr>
<td>Fifo</td>
<td>Fifo12xWidthRows</td>
<td>Fifo which has 12 width and N depth (0 < N < 4096), used for rows cache which width is 9, 10, 11 and 12.You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations.And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !</td>
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

