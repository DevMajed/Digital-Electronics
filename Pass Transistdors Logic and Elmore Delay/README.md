# Pass Transistor Logic and Elmore Delay
Note: This is coppied as is from my lab report as a junior student for ECE.



# Abstract
In this lab, the pass transistor logic will be tested using by building 2-1 Mux. The Mux will be tested using only N-channel transistor in order to see its ability to output 1 and 0. Then, the same Mux will be built using both P-channel and N-Channel transistors. Lastly, the switching speed of pass transistor speed will be tested.
 
# Introduction
The purpose these experiments is to understand how good the output will be when using only N-channel transistor and when using both P, and N channel transistors since each type of transistor is better at outputting different value.

# Theory
Pass transistor logic is a method that is used to build logic circuits with a smaller number of transistors, hence, smaller capacities and less delays. In pass transistor logic, the logic levels are supplied directly to the terminals, instead of supplying a VDD to the drain, hence, a transistor can be used instead of two transistors in CMOS complementary logic. Pass transistor logic  circuits can be implemented using either NMOS transistors only, or by using complementary MOS transistors, which is known as CMOS transmission gate configuration. Although pair of transistors will be use n CMOS transmission gate configuration, the number of transistors used will always be less than CMOS complementary logic circuits as each transistor will have two inputs instead of one. When using only NMOS in PTL, the result is smaller circuit and less capacities, which is an advantage, however there are some disadvantages. The most important disadvantage is that using NMOS transistors alone in PTL will always provide poor 1. The reason for that comes from the working principle of MOSFETS. When an input voltage applied to the gate terminal of an NMOS, after this input voltage overcome the threshold a depletion region will be formed, and the transistor will start conducting, hence, it will enter the triode region until this voltage get pinched off by the drain voltage, which allow the MOSFT to enter the saturation region. if the gate terminal has a voltage of VDD, and it needs a voltage drop of VT in the gate, the high output voltage will always be VDD-VT, which means it will be poor 1. Similarly, PMOS provide a good 1 and a poor 0, the reason for that is similar but complementary to the logic stated above. The PMOS will have its gate voltage conducting at logic 0, otherwise it will always provide a full VDD, or good 1 to the output. Ass seen here, using both transistors together will easily solve the problem, and will provide the circuit a good 0 and a good 1. These kinds of circuits will be a good option for a technology that needs an output of 1 most of the time. The reason for that is that the PMOS will always provide that logic 1 without having to drive a current from its gate, which means no power loss since power is the product of current times voltage. However, there will be some lose in power when the NMOS try to pull down the output to 0 since it needs to conduct.  

# Methods
In the beginig of the lab, the 2-1 Mux shown in figure 1 was built using only N Channel transostors.  In order to implment the circuit, pin 14 was connectet to VDD and pin 7 was conneced to ground. To invert C, M2 and M4 used as an inverter. Pin 3 was used as inpuut C, pin 2 was connected to VDD, and Pin 4 was connected to ground. The output of this inveter was taken by conecting pin 5 and 1, which results in a noted C. pin 12 was used as the A input while the input C from pin 3 was connected to 10. Then using another chip and folowing the same method, pin 12 as used as input B and the output of the C inveted was sent to pin 10, and pin 9 of boh chips were connected as the output. The logic table was verfied as shown in the results. Next, the full 2:1 Mux shown in fgiure 2 was built using both P-channel transostirs and N-Channel transostor folowing the same method.

<img width="345" alt="image" src="https://user-images.githubusercontent.com/66625688/84993960-fb7f2780-b117-11ea-9af4-6ed378c37ee0.png">



To build the full MUX, the input A was provided to both pin 9 and pin 2, which is the NMOS M5 and the PMOS M2. The input B was provided to both pin 4 and pin 11, which is respectively the NMOS M4 and the PMOS M4. Input C was applied to pin 10 to supply both the NMOS at pin 9 and the PMOS at pin 11 with the gate voltage that select the output. Pin 3 was provided the C inverted, which comes from the output at pin 12. The reason for connecting M5 to M2 and M3 to M4 is the location of C and its compliment, since the need to be delivered to the PMOS and the NMOS, at the same time, the same input should be applied to the NMOS and the other PMOS.  Doing so, a full 2-1 MUX was built and tested, and the results were provided at the results section of this report. Lastly, the pass transistor chain was built with increasing one NMOS transistor each time. As seen in figure 3, the drain of the PMOS is connected to the drain of the NMOS, and the output is taken as the resulting drain voltage. each time an NMOS transistor is added to the circuit by connecting its drain to the source of the previous NMOS. After building each chain, the delay, Tphl, of the Clk raising and the output falling was measured. Lastly, the results were put into a Matlab program that implement Elmore formula/ The results are shown in the results section of this lab, and they were discussed In the discussion.


<img width="526" alt="image" src="https://user-images.githubusercontent.com/66625688/84994006-0cc83400-b118-11ea-8216-d499be6ba5ce.png">


# Results

Figure 4: The output of the NMOS Mux


<img width="470" alt="image" src="https://user-images.githubusercontent.com/66625688/84994051-20739a80-b118-11ea-98d0-5c8c6ea45982.png">


<img width="373" alt="image" src="https://user-images.githubusercontent.com/66625688/84994162-41d48680-b118-11ea-83b5-9d7345f901b1.png">


<img width="373" alt="image" src="https://user-images.githubusercontent.com/66625688/84994184-4f8a0c00-b118-11ea-9a8c-22b8f28f3e31.png">


# Discussion
After building the first circuit, which the NMOS mux, an analog descover device was used to detect the output logic. As figure 4, the result was as expected, however, after forcing the output voltage to output 1, a multimeter was used to measure the output voltage. The measured voltage depicted was less than 5 volts. Then, the output was forced to output a zero, and the zero output was a perfect zero. The reason for that is stated in the theory part of this report, the output voltage gets reduced by the threshold voltage in order to the NMOS to conduct, which lead then to a poor 1. The full Mux then was built, and similarly the inputs were forced to output high. The high output was perfect 5 volts as shown in figure 5. Then, the out put was forced to be zero, and the zero was also perfect as in figure 6. The reason for that is taking both advents of the PMOS and the NMOS. When the inputs is 1, the PMOS will not be conducting and the NMOS will conduct, which means, the VDD from the PMOS will fully go to the output without any lose in static power from the PMOS. Similarly, the circuit will have a good 0 since the NMOS can provide a good 0 without losing in power. lastly, after building the first chained, with one NMOS transistor, the input raise to the output fall ratio delay was depicted to be 29.87ns. after adding one more Ckc transistor, which is also one more NMOS, the delay was tripled to be 75.80 ns. Adding one more delay, the results as shown in figure 9 and 10, 93.57 ns and 135.3ns. this show perfectly the Elmore method of calculating the delay in a chain of transistors. According to Elmore equation, the delay is proportional to the capacitance and the resistance that comes as  a side effect with each transistor. The Elmore equation was implemented using a Matlab program in order to drew the relationship between the number of NMOS in the circuit and the delay, and as expected, the result was a linear relationship as shown in figure 11.

<img width="376" alt="image" src="https://user-images.githubusercontent.com/66625688/84994252-6c264400-b118-11ea-8807-3d64c1cd2ade.png">



