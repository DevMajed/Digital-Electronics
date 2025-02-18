# CMOS Latch "The building block of memory"
Note: This is coppied as is from my lab report as a junior student for ECE.

# intro
Flip flops and laches are forms of sequential circuits, which are circuits  that has a memory to store certain values. A latch is a circus that has a stored value that can not be change. Which means it is designed to have a value of 1 or a value of 0. When adding a triggering circuit to a latch, a flip flop is formed. Which is a latch with an input terminal to choose a value to be stored.  \
The purpose these experiments is to understand the working principles of the Latch and flip flops. Flip flops and laches are the basic elements of the memories used in digital electronics. Since a flip flop is a triggered  input latch, both flip flips and laches will be clearly investigated in this lab. \

# Theory 
Latches are sequential circuits that considered to be the basic memory elements. There are many types of laches, however in this lab the focus was in cross-coupled inverter. In laches, there should be two stable states, and one unstable state. The two stable states are when the circuit is storing 1 and when the circuit is storing 0. The unstable state is when the circuit is at Vm trying to reach either VDD or 0. During the Vm transition state, When  the input voltage is sent to the first inverter it will be incrementing in order to reach VDD. the output of the first inverter will be the input voltage times the gain that is occurring in the Vm line, or the final output over the first input of the circuit. This output of the first inverter will then be sent as an input to the second inverter, which also will have an incremental gain, so its output will be even larger. Then, this voltage will be sent back at a first input, and it will get larger until it reaches the stable state of high, or VDD. The same but opposite process occur when the latch goes from Vdd to zero. For all practical purposes, in laches and flip flops we only consider the two stable states, which are when a high or low voltage  is stored in the circuit. The basic working principle of latches and flip flips in general is to have a starting voltage that gets maintained and stored in the circuit by sending it to inverters or NOR gates until it comes to its starting point as is without a change. when the voltage stored in a circuit is forced only one time and them it can be change, the circuit called a static variety latch. In order to make the latch triggered, or to write any needed value by a user, a triggering circuit should be added to form a flip flop. The circuit in figure 1, can be used to explain how a latch and a flip flop work. To understand its working principle and predict a result, the input voltage will be assumed to be 5V initially. After disconnecting the voltage supply, the 5 volts is already an input voltage to the first inverter. The inverter will invert it to 0V and this 0V will be the value of Q`. the voltage at Q` will then be an input to the second inverter, which means the 0V will be inverted to 5V, so Q will get a voltage of 5V. this voltage will be sent again as an input voltage to the first inverter and the process will be repeated until the input voltage forced to change through  R1 by connecting it to ground. 

# Methods
To build the circuit, pin 2 was connected to VDD, from pin 14, and pin 4 was connected to ground. This was done to form the first inviter, which its output is taken from pin 1 and pin 5 after they are connected, and its input is from pin 3. This output  of the first inverter will be donated as Q`, and it will be sent as an input of the second inviter, to pin 6. Pin 14 and 7 are already connected to Vdd and ground so they will be used as the second inverter. The output of this second inviter is taken from pins 13 and 8 by connecting them together. This output voltage will be donated as Q, and it will be connected by a wire to pin 3, to form a positive feedback loop to the first inverter. To build the trigging circuit, a voltage source was connected to a wire in the breadboard, and it was used as a switch. The switch open when the wire is not connected, and it is closed when the wire is connected. This switch was connected to a 100 Ω resistor and the other side of the resistor was connected to pin 3. To test the storage ability of the circuit, the wire was connected to form a closed switch, and  a high voltage applied. The wire then was removed, and the measurements were taken and reported as in the result section of this report. Then, the resistor was connected to ground in order to give a path to the charge to leave. The measurements were taken again to see whether the circuit is re acting to the triggering zero input. Lastly, to study the VTC of the latch, the function generator was set to 0 to 5V sine wave  at 200Hz and it was connected as the input through R1. After setting the oscilloscope to x-y mode, the first probe was used as for the X value, it was connected at the resistor, and the second prob was connected to the interconnection of pin 5 and 1, which is the output Q`. \

<img width="425" alt="image" src="https://user-images.githubusercontent.com/66625688/84991605-c2918380-b114-11ea-94fa-478145e9c03d.png">

# Results

Figure 2: connecting triggering input to Vdd.


<img width="445" alt="image" src="https://user-images.githubusercontent.com/66625688/84991679-dd63f800-b114-11ea-9f26-36f3d268e4c2.png">

Figure 3: connecting triggering input to ground.

<img width="439" alt="image" src="https://user-images.githubusercontent.com/66625688/84991698-e2c14280-b114-11ea-9084-f26ad69b9ae7.png">


Figure 3:VTC using the X-Y mode

<img width="425" alt="image" src="https://user-images.githubusercontent.com/66625688/84991706-e5239c80-b114-11ea-8481-48316c9bc661.png">


Figure 4: The Normal Mode while applying  an AC

<img width="427" alt="image" src="https://user-images.githubusercontent.com/66625688/84991715-e785f680-b114-11ea-87ea-d0f410f9d12e.png">


# Discussion

As predicted in theory part of the lab,  after sending a trier voltage through R1, and after closing the switch, the voltage was inverted in the first inviter, given low output to Q` which then was sent as an input to the second inverter. The second inverter as expected, outputted 1 at Q, and this voltage of 1 was stored in the circuit as shown in fire 2. When the resistor was connected to ground, the circuit voltage became low, and after opening the which, the voltage was found to be as expected, storing 0V as shown in figure 2. For the last part, figure 4 shows that when the input voltage is at the low cycle, Q` is high, and it stays high until the input voltage is close Vm. The reason for that is when Vg, the sine wave, going from 0 to 1, the output of the first inverter is 0. Since it is zero, the PMOS of the second inverter will be conducting while the NMOS is  creating a high impedance of RN. The current can be found by Vin/Rn, which is equal to the sine voltage of Vg/Rn+100. This means that VG= Vin*  ((Rn+100)/Rn). When Vg = Vm1 and Vin=Vm, Vm1=Vm*((Rn+100)/Rn), so VM1 > Vm. When the sine wave Vg is going from high to low, the output of the first inverter is high, which means the PMOS will be off creating a high impedance Rp. Solving for the current in a similar manner, it can be found that if VG= Vm2, and Vin=Vm, Vm2<Vm. This can be seen clearly in figure 3. In the low to high cycle of the sine voltage Vg, yellow in the figure, Vm1 which is the region where the sine wave crosses the Vin square voltage, is larger than Vm, while during the high to low Cycle, Vm is larger than Vm2. In other words, this shows what was indicated in the theory part of this lab, explaining the Vm as the effect of the incrementing voltage and the gain over time. 
