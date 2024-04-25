`timescale 1ns / 1ps
module TRI(
input I,E,
output O
    );
    
assign O = E ? I :1'bZ;
    
endmodule
