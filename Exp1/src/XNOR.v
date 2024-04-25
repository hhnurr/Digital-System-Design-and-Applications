`timescale 1ns / 1ps
module XNOR(
input I1,I2,
output O);

LUT2# (.INIT(4'b1001))lut(.O(O),.I0(I1),.I1(I2));
endmodule
