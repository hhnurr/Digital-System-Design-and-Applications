`timescale 1ns / 1ps
module op1bit(
    input sra,
    input rotate,
    input [31:0]a,
    input op,
    output [31:0]out1

);
wire rotate0;

genvar m;
generate
    mux2to1 m1(.D0(sra), .D1(a[0]), .S(rotate), .O(rotate0));
    mux2to1 m2(.D0(a[31]), .D1(rotate0), .S(op), .O(out1[31]));
    
    for (m=0;m<31;m=m+1)begin
    mux2to1 m2(.D0(a[m]), .D1(a[m+1]), .S(op), .O(out1[m]));
   end
endgenerate
endmodule
