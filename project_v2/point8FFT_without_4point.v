/***************************************************************************************** 
 ***                                                                     		   *** 
 *** ECE 526 Final Project            Joel Garcia Valencia, Fall, 2022  	  	   *** 
 ***                                                                    		   *** 
 *** Final Project Fast Fourier Transform		                         		   *** 
 ***                                                                     		   *** 
 ***************************************************************************************** 
 *** Filename: point8FFT_without_4point.v  Created by Joel Garcia Valencia, 12/03/22   *** 
 ***    --- revision history, if any, goes here ---                      		   *** 
 *****************************************************************************************/ 

module point8FFT_without_4point( f_0, f_1, f_2, f_3, f_4, f_5, f_6, f_7, 
					   F_0r, F_1r, F_2r, F_3r, F_4r, F_5r, F_6r, F_7r,
					   F_0i, F_1i, F_2i, F_3i, F_4i, F_5i, F_6i, F_7i);

input signed [31:0] f_0, f_1, f_2, f_3, f_4, f_5, f_6, f_7; //this is the 8 point inputs
output signed [31:0] F_0r, F_1r, F_2r, F_3r, F_4r, F_5r, F_6r, F_7r, //output of real numbers
			   F_0i, F_1i, F_2i, F_3i, F_4i, F_5i, F_6i, F_7i; //output of imaginary numbers

real z = 0.70710; //this is 1 divided by sqrt(2) = 0.707106781
 

assign F_0r = f_0+f_1+f_2+f_3+f_4+f_5+f_6+f_7;
assign F_0i = 0;

assign F_1r = f_0 - f_4 + f_1*z - f_5*z + f_3*z + -f_7*z;
assign F_1i = f_2 - f_6 - f_1*z + f_5*z - f_3*z + f_7*z;

assign F_2r = f_0 + f_4 - f_2 - f_6;
assign F_2i = f_3 + f_7 - f_1 - f_5;

assign F_3r = f_0 - f_4 + f_1*z - f_5*z - f_3*z + f_7*z;
assign F_3i = f_2 - f_6 - f_1*z + f_5*z + f_3*z - f_7*z;

assign F_4r = f_0 + f_4 + f_2 + f_6 - f_1 - f_5;
assign F_4i = f_3 - f_7;

assign F_5r = f_0 - f_4 - f_1*z + f_5*z - f_3*z + f_7*z;
assign F_5i = f_6 - f_2 + f_1*z - f_5*z + f_3*z - f_7*z;

assign F_6r = f_0 + f_4 - f_2 - f_6;
assign F_6i = f_1 + f_5 - f_5 - f_7;

assign F_7r = f_0 - f_4 + f_1*z - f_5*z - f_3*z + f_7*z;
assign F_7i = f_2 + f_6 - f_1*z + f_5*z + f_3*z - f_7*z;

endmodule
