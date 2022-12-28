# ECE526_Project
## DIT 8-point FFT

# Report

### Introduction
The purpose of my final project is to understand Fast Fourier Transform operation and implement it in Verilog. The Fast Fourier Transform (FFT) is a faster and more efficient algorithmic operation than Discrete Fourier Transform (DFT), even though their outputs are similar. There are multiple applications to use DFT/ FFT, they are mainly used in Digital Signal Processing (DSP) or Image Processing. As shown in figure 1.1, there is a time domain signal that is being inputted, and we can gain clear information about the input by using fast fourier transform on the input, which gives us the output in frequency domain. In the frequency domain, we use an operation filter to reduce the noise of the given signal, then use the inverse fast fourier transform to give a clearer signal or proper information for engineers to read in the time domain. As mentioned before, FFT is faster than DFT where the time complexity of Discrete Fourier Transform is O(N^2) and the time complexity for Fast Fourier Transform is O(NLOG_2(N)) which is almost half the time. For example, given one hundred for N, then DFT will result in ten thousand seconds and FFT is six hundred and sixty-four seconds. Of course if there is a higher number input you can see a major difference.


Figure 1.1: Time domain to Frequency domain
I will be designing a 2^r point FFT by using a radix 2 butterfly design to produce the Fast Fourier Transform, which will be explained in the procedure. If using a radix 4, instead of a radix 2 the time performance will be faster in the FFT, but it was complicated to operate the radix 4 in Verilog. As shown in figure 1.2, is a complicated 8 point DFT which takes time calculating by hand. As shown in figure 1.3, is the 8 point FFT which has a fast prompt to calculate the 8 point. As mentioned before they are the same output but the FFT is much faster than the other.


Figure 1.2: DFT 8-point


Figure 1.3: FFT 8-point


### Procedure
As the first step I must understand the butterfly design to calculate the 2^r point Fast Fourier Transform, in my case its 2,4 and 8 point FFT. As shown in figure 1.4, is a butterfly diagram of radix 2 in 4 point FFT, on the left side is stage 1 calculation of radix 2, the outputs then be calculated again in radix 2 which is shown on the right side. The reason it is called a butterfly diagram is because it looks like the shape of a butterfly and it is very useful for calculating the Fourier transform as shown. This was then implemented in Verilog of 4 point FFT, to the nbe utilized in the future. 


Figure 1.4: 2 point and 4 point FFT.

Now for the next step I must implement the 8 point FFT in verilog, as shown in figure 1.5, following the previous step is needed to create an 8 point DIT (Decimation In Time) block. Mainly the 2 point and 4 point DIT FFT, then implement an 8 point DIT at the end. All calculations to implement the 8 points will be shown in the calculation section. I must consider each block section a stage, where 2 points are stage 1, then 4 points are stage 2, and 8 points are stage 3, therefore each stage is 2^r points and r is the number of stages. From the calculations, I have utilized signed components in order to do the algorithmic operations in the module. The only main issue was trying to extract the complex numbers in the Fast Fourier Transform, for that reason I separately assigned the complex number to a different variable then the real numbers. The verilog code “point8FFT_without_4point.v” is just following figure 1.5, but only using the pure calculation to assign each variable to the correct position.

Figure 1.5: 8 point FFT

The third step, I wanted to create high points by instantiating the previous points, therefore I have realized if it was possible. As shown in figure 1.6, it is a 2^r point FFT, so I tried an 8 point and the “N/2 DIT FFT” is a 4 point in this case. Doing this operation will benefit with understanding higher points of FFT, these points are mainly the signals at (x,y) coordinates in the time domain. Unfortunately I came across errors in verilog code “point8_FFT.v” on extracting the imaginary numbers from the outputs, as a result more research is needed to solve this problem. Once each module is complete I must compile with vcs, under the command “vcs file_name.v -full64” until there are no errors to then work on simulation.

Figure 1.6: 2^r point FFT  

### Testing Strategy
In order to test the modulation I have created two test benches for 4 point and 8 point FFT. Once the test benches are in place, I must create a “.f ” file that only has the test bench on top and then the module name on the bottom, because it compiles the top hierarchy first. This allows both verilog code to compile and create a simulation when no errors are given.  
As shown in figure 1.7, the simulation shows the input and output of the FFT, which is set on the test bench. To understand this, the input is just 4 points on the signal that is converted into frequency domain and that is outputted on the test bench. To check if the results are correct I input the same numbers of points in the matlab terminal and convert the points into FFT. 

 Now in figure 1.8, is the input and output simulation of the 8 point FFT as mentioned before, assuming the decimal numbers are rounding up in some cases. 


Figure 1.7: 4 point input (left) and output (right)


Figure 1.8: 8 point input (left) and output (right)
### Conclusion
In this project, I have learned how to design an 8 point Fast Fourier Transform, which is utilized for fast convolution in continuous signal processing or in the frequency domain it is just multiplying. There are benefits to using FFT in signal processing, if there is time and cost in a system architecture. 

Future Plans: Continue working on the FFT to extract the imaginary numbers on each output of the “N/2” block. Research more on the issue of the output being rounded or not outputting the decimal place values. Once I am able to solve the output of N/2 to a large number point, then implement a signal noise to convert into the Fast Fourier Transform and have it outputted as a graph.

### Appendix
[1] Orad Haghighiara ECE 526 Lecture
[2]https://www.cs.cmu.edu/afs/andrew/scs/cs/15-463/2001/pub/www/notes/fourier/fourier.pdf 
[3] https://www.youtube.com/watch?v=spUNpyF58BY 
[4] https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=5491775 

