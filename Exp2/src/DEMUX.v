`timescale 1ns / 1ps
module DEMUX(
    input D,
    input [1:0]S,
    output [3:0] O);
    wire [5:0]temp;
    NOT n0(S[0],temp[0]);
    NOT n1(S[1],temp[1]);
    AND a0(temp[0],temp[1],temp[2]);
    AND a1(S[0],temp[1],temp[3]);
    AND a2(temp[0],S[1],temp[4]);
    AND a3(S[0],S[1],temp[5]);
    TRI tr0(temp[2],D,O[0]);
    TRI tr1(temp[3],D,O[1]);
    TRI tr2(temp[4],D,O[2]);
    TRI tr3(temp[5],D,O[3]);
endmodule
