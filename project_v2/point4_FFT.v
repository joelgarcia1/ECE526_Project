/*************************************************************************** 
 ***                                                                     *** 
 *** ECE 526 Final Project            Joel Garcia Valencia, Fall, 2022   *** 
 ***                                                                     *** 
 *** Final Project Fast Fourier Transform		                         *** 
 ***                                                                     *** 
 *************************************************************************** 
 *** Filename: point4_FFT.v   Created by Joel Garcia Valencia, 12/03/22  *** 
 *** --- Calulations are shown in report, that how each points are being ***
 *** outputted correctly through assign statements ---                   *** 
 ***************************************************************************/ 



module point4_FFT(f_0,f_1,f_2,f_3, F_0r, F_1r, F_2r, F_3r, F_0i, F_1i, F_2i, F_3i);

parameter N = 8;

input signed [N-1:0] f_0,f_1,f_2,f_3; //inputs
output signed [N:0]  F_0r, F_1r, F_2r, F_3r; // output real numbers
output signed [N:0]  F_0i, F_1i, F_2i, F_3i; //output imaginary numbers

	assign F_0r = f_0 + f_1 + f_2 + f_3;
	assign F_0i = 0;

	assign F_1r = f_0 - f_2;
	assign F_1i = - f_1 + f_3;

	assign F_2r = f_0 + f_2 - f_1 - f_3;
	assign F_2i = 0;

	assign F_3r = f_0 - f_2;
	assign F_3i = f_1 - f_3;
	
endmodule
