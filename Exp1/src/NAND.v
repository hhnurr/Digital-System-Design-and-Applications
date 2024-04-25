`timescale 1ns / 1ps

module NAND(
input I1,I2,
output reg O
    );
    
always @ (I1 or I2)
  begin
     O =~(I1&I2);
  end    
endmodule
