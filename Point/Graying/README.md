# Simulations
**Simulations for this module just support RGB images !**  

## Steps for simulations
**Warning: procedures for simulation depend on python 2.x and PIL(Python Imaging Library), please get them by your self.**  

### Preparing
Open "ImageForTest".  
Put images which you want to use for simulations.  
Edit the "conf.json" for setting the configuration for simulations.  

### Software simulation
Open "SoftwareSim".  
Run "sim.py".  
Open "SimResCheck", check your results.  

### Creat preparing data for functional simulation
Open "HDLSimDataGen".  
Run "creat.py".  

### Functional simulation
Functional simulation just support for modelsim 10.1 up.   
Above all, you must compile all xilinx vivado library to modelsim.  

Open "FunSimForHDL".  
Open "ContrastTranslate.mpf" with modelsim.  

#### Do these:

Run this commond at first time:

    vlib work  

Then, compile all your source file:  

    modelsim gui -> Compile -> Compile all  

Then, run this:

    do Run.do

If you just want to the finally result, and don't want to watch the waveform, run this:  

    do RunOver.do

## Comparing
Open "SimResCheck".  
Run "covert.py", then you can get the results form functional simulation.  
Run "compare.py" for creating a report for software simulation and functional simulation.  

