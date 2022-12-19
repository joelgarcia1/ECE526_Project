 /***                                                                     	*** 
 *** ECE 526 Final Project            Joel Garcia Valencia, Fall, 2022 		*** 
 ***                                                                     	*** 
 *** Final Project Fast Fourier Transform 	                        	*** 
 ***                                                                     	*** 
 ******************************************************************************** 
 *** Filename:point8FFT_ver2_tb.v Created by Joel Garcia Valencia, 12/03/22  	*** 
 *** --- Calulations are shown in report, that how each points are being 	***
 *** outputted correctly through assign statements ---                        *** 
 ********************************************************************************/ 


`timescale 1ns/1ps //ns
module point8FFT_ver2_tb();
parameter N = 32;

reg clk; 
reg signed [N-1:0]  f_0, f_1, f_2, f_3, f_4, f_5, f_6, f_7; //input
wire signed [N-1:0] F_0r, F_1r, F_2r, F_3r, F_4r, F_5r, F_6r, F_7r; //output real number
wire signed [N-1:0] F_0i, F_1i, F_2i, F_3i, F_4i, F_5i, F_6i, F_7i; //output imaginary number


point8FFT_without_4point eight_pointFFT( .f_0(f_0), .f_1(f_1), .f_2(f_2), .f_3(f_3), .f_4(f_4), .f_5(f_5), .f_6(f_6), .f_7(f_7), 
					   .F_0r(F_0r), .F_1r(F_1r), .F_2r(F_2r), .F_3r(F_3r), .F_4r(F_4r), .F_5r(F_5r), .F_6r(F_6r), .F_7r(F_7r),
					   .F_0i(F_0i), .F_1i(F_1i), .F_2i(F_2i), .F_3i(F_3i), .F_4i(F_4i), .F_5i(F_5i), .F_6i(F_6i), .F_7i(F_7i));

initial begin clk = 1; end

always begin #5 clk = ~clk; end

initial 
	begin
$vcdpluson;

    
	f_0 = 1'd1;
	f_1 = 1'd0;
	f_2 = 1'd1;
	f_3 = 1'd1;
	f_4 = 1'd1;
	f_5 = 1'd1;
	f_6 = 1'd0;
	f_7 = 1'd1;

   #100 $finish;
   end

 initial
   $monitor("%g %gi\n%g %gi\n%g %gi\n%g %gi\n %g %gi\n %g %gi\n %g %gi\n %g %gi\n", F_0r, F_0i, F_1r, F_1i, F_2r, F_2i, F_3r, F_3i,  F_4r, F_4i, F_5r, F_5i, F_6r, F_6i, F_7r, F_7i);
endmodule