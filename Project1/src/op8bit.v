`timescale 1ns / 1ps


module op8bit(
    input sra,
    input rotate,
    input [31:0]a,
    input op,
    output [31:0]out8
    
);
wire [7:0] rotate3;
wire [31:0] out4;
genvar i,m;
generate
    for(i=0;i<8;i=i+1)begin
    mux2to1 m1(.D0(sra), .D1(a[i]), .S(rotate), .O(rotate3[i]));
    mux2to1 m2(.D0(a[i+24]), .D1(rotate3[i]), .S(op), .O(out8[i+24]));
    end
    
    for (m=0;m<24;m=m+1)begin
    mux2to1 m2(.D0(a[m]), .D1(a[m+8]), .S(op), .O(out8[m]));
   end
endgenerate
endmodule