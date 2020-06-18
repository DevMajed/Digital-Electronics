# CMOS Logic 


# Abstract

In this lab, a CMOS logic gate that realizes a Boolean function will be designed using a signal CD 4007 chip. In order to obtain the PUN and The PDN of circuit, De-morgan should be applied to the function. The second part of the lab is testing the switching speed. In this part the delay caused by the capacitance of the circuit  will be measured using the oscilloscope. 
 
# Introduction

The purpose these experiments is to understand how to design and test a circuit for a given Boolean function both theoretical and physically. In order to design the CMOS circuit theoretically, digital logic skills such as De-Morgan theorem and  truth tables will be used. To build the circuit physically, the basic knowledge of how NMOS and PMOS will be used in order to create PUN and PDN circuits that both go to one output. Lastly, to test the circuit, the results will be compared to the truth table, and the propagation delay will be measured. 

# Theory
Combinational logic circuits are logic circuits that have an output at anytime depends only on the inputs at that time. In order to design a combinational circuit, a Boolean function is used to represent the output in terms of inputs and logic gates. To build these logic gates NMOS and PMOS transistors are used as switches that will give the desired output and its compliment. A network of NMOS transistors is called PDN, and network of PMOS transistors is called PUN. Before building a network NMOS or PMOS transistor, the Boolean function should be manipulated In order to give the output and its compliment. The complimented output then will be built by the PDN transistors and the uncomplimented output will be built using PUN. After designing a combinational circuit, the circuit can be tested by finding the output of each combinations of inputs and comparing it to the results obtained in the truth table. The output of a combinational logic circuit ideally happens at the same time as the inputs. However, that is not the case in real life. Since CMOS circuits have side effect capacitances, the discharging and charring of these capacitances cause a propagation delay. In order to find the propagation delay and the switching speeds of a circuit one can use pen and paper analyses, Multisem, or by using an oscilloscope. These values are important to find in order to improve the circuit operation by the designers. 

# Methods

The first step was to find the correct expressions for PDN and PUN. In order to find that the function \
F=  ( A + BC )` changed to be F` = A + BC, which will be the function for PUN. \
Then, to find the function for PDN De-Morgan was used as follows \
F =  ( A + BC )` \
F =  ( (A)` . ( B` + C` ) \
Figure 1 shows the Circuit diagram that was obtained by connected two networks of PUN and PDN. \

figure 1:

<img width="257" alt="image" src="https://user-images.githubusercontent.com/66625688/84992108-7561e180-b115-11ea-9f24-76c7d0f8c063.png">

Then, in order to build the circuit physically, a CD4007 chip was used. Pin 14 was supplied with +5 V as a VDD for all the transistors, and pin 7 was grounded. For the top circuit, The gates were used as follows : M1 for B`, M2 for C`, and M3 for A`. pin 14, which is the source terminal for the transistor was already connected to VDD, pin 2 was also connected to VDD. The drain pins 13 and 1 were connected together and they both were connected to the source of A` at pin 11. Pin 12, or the drain of A`, was then used as the output signal. For the Bottom circuit, pin 7 and pin 4 were placed in common ground. Pin 5, which represent the drain terminal of M4, was connected to the source terminal of M5 at pin 9. Lastly, pin 8 which is the drain for the M6, was connected to pin 12. Figure 2 and 3 show the obtained results from the oscilloscope for each combination.  \
Figure 2 shows the output waveform for the first combinations 

<img width="350" alt="image" src="https://user-images.githubusercontent.com/66625688/84992259-ab06ca80-b115-11ea-8df6-a69fa37ef12a.png">

Figure 3 shows the output waveform for the next combinations 

<img width="422" alt="image" src="https://user-images.githubusercontent.com/66625688/84992389-d1c50100-b115-11ea-80c7-50d66d69b44e.png">


In order to verify all the input output combinations at one time, an Analog discovery device was used, and the results were as shown in figure 4. \

Figure 4:

<img width="468" alt="image" src="https://user-images.githubusercontent.com/66625688/84992447-e5706780-b115-11ea-93e5-04eed165989c.png">

For the second part of the lab, the function generator was set to produce 0 to 5 V square wave. After clocking the inputs at pins 6, 3, and 10 together, the input – output waveform was found and the delay was found. Figure 5 and 6 shows the result. 

<img width="314" alt="image" src="https://user-images.githubusercontent.com/66625688/84992541-0b960780-b116-11ea-992f-4ddb1760d609.png">



# Results
<img width="452" alt="image" src="https://user-images.githubusercontent.com/66625688/84992642-2d8f8a00-b116-11ea-930c-b5e49916eac8.png">

# Discussion

In the first part of the lab the Boolean function was used to generate two separate circuits that both combine in the final output. This was done because the NMOS transistor operate as switch on when it has a high input voltage, and it acts as open when low input voltage applied. The PMOS transistor acts exactly the opposite. Combating the two circuits will insure that all input combinations will provide the desired output in the truth table shown in table 1. In the top circuit of figure 1, A was set in series with the parallel B and C. this was done to represent the AND gate, which produce 1 when both transistors are ON. The B and C were set in parallel to represent the OR gate, which produce and output of 1 when either transistors is ON. The result was obtained for all input combinations as expected after building the circuit. For the second part of the lab, it was expected to find a propagation delay since six transistors were used and each transistor has multiple capacitances. After a transistor turn ON, the gate can be replaced with a small transistor and the transistor capacitor start charging and then it starts to discharge its voltage to the output. These charging and discharging case the propagations delays in the transistors. Using the oscilloscope, the raise and fall times and the probations delays. The propagation delay of the CMOS circuit was ten found as the average of the Tphl Tplh that was found in table 2. \

Tp = ½ ( Tplh + Tphl ) \
Tp = ½ ( 47.90 ns + 21.60 ns  ) \
Tp = 0.00000003 seconds.


