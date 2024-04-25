`timescale 1ns / 1ps


module op2bit(
    input sra,
    input rotate,
    input [31:0] a,
    input op,
    output [31:0] out1

    );
    
    wire [1:0] rotate1; 
    genvar i,j,k;
    generate
        for(i = 0; i<2; i=i+1)begin
            mux2to1 m1(sra , a[i] , rotate, rotate1[i]);
        end   
         
         for(j = 30; j<32; j=j+1)begin
            mux2to1 m2(a[j] , rotate1[j-30] , op, out1[j]);
        end          
       
        for(k = 0; k<30; k=k+1)begin
            mux2to1 m3(a[k] , a[k+2] , op, out1[k]);
        end     
     
     endgenerate   
endmodule
