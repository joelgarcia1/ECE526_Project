module point8_FFT(f_0,f_1,f_2,f_3,f_4,f_5,f_6,f_7, F_0r, F_1r, F_2r, F_3r, F_4r, F_5r, F_6r, F_7r, F_0i, F_1i, F_2i, F_3i, F_4i, F_5i, F_6i, F_7i);

parameter N = 8;

input signed [N-1:0] f_0,f_1,f_2,f_3,f_4,f_5,f_6,f_7; //inputs
output signed [N:0]  F_0r, F_1r, F_2r, F_3r,F_4r, F_5r, F_6r, F_7r; // output real numbers
output signed [N:0]  F_0i, F_1i, F_2i, F_3i, F_4i, F_5i, F_6i, F_7i; //output imaginary numbers

//even function
wire signed [N:0] Xe_0r,Xe_1r,Xe_2r,Xe_3r, Xe_4r,Xe_5r,Xe_6r,Xe_7r; 
wire signed [N:0] Xe_0i,Xe_1i,Xe_2i,Xe_3i, Xe_4i,Xe_5i,Xe_6i,Xe_7i; 

//odd function
wire signed [N:0] Xo_0r,Xo_1r,Xo_2r,Xo_3r, Xo_4r,Xo_5r,Xo_6r,Xo_7r; 
wire signed [N:0] Xo_0i,Xo_1i,Xo_2i,Xo_3i, Xo_4i,Xo_5i,Xo_6i,Xo_7i;

//(W_N)^k is implemented in 8 point
wire signed [N:0]
/* 1st stage */
//instantiate two 4_FFT in even and odd function
point4_FFT FFT_even(.f_0(f_0),.f_1(f_2),.f_2(f_4),.f_3(f_6),
			  .F_0r(Xe_0r), .F_1r(Xe_1r), .F_2r(Xe_2r), .F_3r(Xe_3r),
			  .F_0i(Xe_0i), .F_1i(Xe_1i), .F_2i(Xe_2i), .F_3i(Xe_3i));

point4_FFT FFT_odd(.f_0(f_1),.f_1(f_3),.f_2(f_5),.f_3(f_6), 
			 .F_0r(Xo_0r), .F_1r(Xo_1r), .F_2r(Xo_2r), .F_3r(Xo_3r),
			 .F_0i(Xo_0i), .F_1i(Xo_1i), .F_2i(Xo_2i), .F_3i(Xo_3i));

/* 2nd stage */

/* the imaginary numbers will take affect so figure out how to extract without affecting the diagram?
asssign F_0r =  Xe_0r + (Xo_0r);
assign F_0i = Xe_0i + Xo_0i;

asssign F_1r = Xe_1r + W_2*(Xo_1r)
assign F_1i = Xe_1i + Xo_1i;

asssign F_2r = Xe_2r + W_3*(Xo_2r)
assign F_2i = Xe_2i + Xo_2i;

asssign F_3r = Xe_3r + W_4*(Xo_3r)
assign F_3i = Xe_3i + Xo_3i;

asssign F_4r = Xe_4r + W_5*(Xo_4r)
assign F_4i = Xe_4i + Xo_4i;

asssign F_5r = Xe_5r + W_6*(Xo_5r)
assign F_5i = Xe_5i + Xo_5i;

asssign F_6r = Xe_6r + W_7*(Xo_6r)
assign F_6i = Xe_6i + Xo_6i;

asssign F_7r = Xe_7r + W_8*(Xo_7r)
assign F_7i = Xe_7i + Xo_7i;

*/
endmodule
