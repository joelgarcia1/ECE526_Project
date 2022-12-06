`timescale 1ns/1ps //ns
module point4_FFT_tb();
parameter N = 8;

reg clk; 
reg signed [N-1:0] f_0,f_1,f_2,f_3;
wire signed [N:0] F_0r, F_1r, F_2r, F_3r, F_0i, F_1i, F_2i, F_3i;

point4_FFT four_point(.f_0(f_0),.f_1(f_1),.f_2(f_0),.f_3(f_3), .F_0r(F_0r), .F_1r(F_1r), .F_2r(F_2r), .F_3r(F_3r), .F_0i(F_0i), .F_1i(F_1i), .F_2i(F_2i), .F_3i(F_3i));

initial begin clk = 1; end

always begin #5 clk = ~clk; end

initial 
	begin
   f_0 = 1'd1;
   f_1 = 2'd2;
   f_2 = 1'd1;
   f_3 = 1'd0;
   
   #100 $finish;
   end

 initial
   $monitor("%g %gi\n%g %gi\n%g %gi\n%g %gi\n", F_0r, F_0i, F_1r, F_1i, F_2r, F_2i, F_3r, F_3i);
endmodule

/* errors I have noticed that If I would like the proper output I must change the deimal bit to the respect input
If I input 11bit then the bit must be 4 but it gives me an incorrect answer because it is a signed value 
Therefore I must voncert it */