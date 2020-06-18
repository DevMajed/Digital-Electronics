# CMOS Latch "The building block of memory"
Note: This is coppied as is from my lab report as a junior student for ECE.

# intro
Flip flops and laches are forms of sequential circuits, which are circuits  that has a memory to store certain values. A latch is a circus that has a stored value that can not be change. Which means it is designed to have a value of 1 or a value of 0. When adding a triggering circuit to a latch, a flip flop is formed. Which is a latch with an input terminal to choose a value to be stored.  \
The purpose these experiments is to understand the working principles of the Latch and flip flops. Flip flops and laches are the basic elements of the memories used in digital electronics. Since a flip flop is a triggered  input latch, both flip flips and laches will be clearly investigated in this lab. \

# Theory 
Latches are sequential circuits that considered to be the basic memory elements. There are many types of laches, however in this lab the focus was in cross-coupled inverter. In laches, there should be two stable states, and one unstable state. The two stable states are when the circuit is storing 1 and when the circuit is storing 0. The unstable state is when the circuit is at Vm trying to reach either VDD or 0. During the Vm transition state, When  the input voltage is sent to the first inverter it will be incrementing in order to reach VDD. the output of the first inverter will be the input voltage times the gain that is occurring in the Vm line, or the final output over the first input of the circuit. This output of the first inverter will then be sent as an input to the second inverter, which also will have an incremental gain, so its output will be even larger. Then, this voltage will be sent back at a first input, and it will get larger until it reaches the stable state of high, or VDD. The same but opposite process occur when the latch goes from Vdd to zero. For all practical purposes, in laches and flip flops we only consider the two stable states, which are when a high or low voltage  is stored in the circuit. The basic working principle of latches and flip flips in general is to have a starting voltage that gets maintained and stored in the circuit by sending it to inverters or NOR gates until it comes to its starting point as is without a change. when the voltage stored in a circuit is forced only one time and them it can be change, the circuit called a static variety latch. In order to make the latch triggered, or to write any needed value by a user, a triggering circuit should be added to form a flip flop. The circuit in figure 1, can be used to explain how a latch and a flip flop work. To understand its working principle and predict a result, the input voltage will be assumed to be 5V initially. After disconnecting the voltage supply, the 5 volts is already an input voltage to the first inverter. The inverter will invert it to 0V and this 0V will be the value of Q`. the voltage at Q` will then be an input to the second inverter, which means the 0V will be inverted to 5V, so Q will get a voltage of 5V. this voltage will be sent again as an input voltage to the first inverter and the process will be repeated until the input voltage forced to change through  R1 by connecting it to ground. 

# Methods
To build the circuit, pin 2 was connected to VDD, from pin 14, and pin 4 was connected to ground. This was done to form the first inviter, which its output is taken from pin 1 and pin 5 after they are connected, and its input is from pin 3. This output  of the first inverter will be donated as Q`, and it will be sent as an input of the second inviter, to pin 6. Pin 14 and 7 are already connected to Vdd and ground so they will be used as the second inverter. The output of this second inviter is taken from pins 13 and 8 by connecting them together. This output voltage will be donated as Q, and it will be connected by a wire to pin 3, to form a positive feedback loop to the first inverter. To build the trigging circuit, a voltage source was connected to a wire in the breadboard, and it was used as a switch. The switch open when the wire is not connected, and it is closed when the wire is connected. This switch was connected to a 100 Ω resistor and the other side of the resistor was connected to pin 3. To test the storage ability of the circuit, the wire was connected to form a closed switch, and  a high voltage applied. The wire then was removed, and the measurements were taken and reported as in the result section of this report. Then, the resistor was connected to ground in order to give a path to the charge to leave. The measurements were taken again to see whether the circuit is re acting to the triggering zero input. Lastly, to study the VTC of the latch, the function generator was set to 0 to 5V sine wave  at 200Hz and it was connected as the input through R1. After setting the oscilloscope to x-y mode, the first probe was used as for the X value, it was connected at the resistor, and the second prob was connected to the interconnection of pin 5 and 1, which is the output Q`. \

<img width="165" alt="image" src="https://user-images.githubusercontent.com/66625688/84991406-76deda00-b114-11ea-8f24-74c9197f9ce5.png">

# Results

Figure 2: connecting triggering input to Vdd.


<img width="214" alt="image" src="https://user-images.githubusercontent.com/66625688/84991448-86f6b980-b114-11ea-9ea8-04d5b9c8e4ae.png">

Figure 2: connecting triggering input to ground.


<img width="219" alt="image" src="https://user-images.githubusercontent.com/66625688/84991456-88c07d00-b114-11ea-963a-e13f75c59005.png">

Figure 3:VTC using the X-Y mode


<img width="217" alt="image" src="https://user-images.githubusercontent.com/66625688/84991465-8c540400-b114-11ea-8cc2-3e7860b22700.png">

Figure 4: The Normal Mode while applying  an AC


<img width="220" alt="image" src="https://user-images.githubusercontent.com/66625688/84991471-8e1dc780-b114-11ea-9594-89dcf6b87f80.png">




