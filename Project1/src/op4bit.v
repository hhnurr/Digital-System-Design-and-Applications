`timescale 1ns / 1ps

module op4bit(
    input sra,
    input rotate,
    input [31:0] a,
    input op,
    output [31:0] out2

    );
    
    wire [3:0] rotate2;
//4. katman    
    genvar i,j,k;
    generate
        for(i = 0; i<4; i=i+1)begin
            mux2to1 m1(sra , a[i] , rotate, rotate2[i]);
        end    

        for(j = 28; j<32; j=j+1)begin
            mux2to1 m1(a[j] , rotate2[j-28] , op, out2[j]);
        end          
       
        for(k = 0; k<28; k=k+1)begin
            mux2to1 m1(a[k] , a[k+4] , op, out2[k]);
        end        
       
    endgenerate
        
    
    
endmodule
