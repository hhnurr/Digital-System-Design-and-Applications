`timescale 1ns / 1ps


module TB_FSM();
  reg clk,x;
  reg [41:0] in;
  wire z;
  reg reset;
  
  fsm3 uut(.x(x), .clk(clk), .z(z), .reset(reset));
  
  integer i;
  initial begin
  reset=1'b0;
  clk=1'b0;
  in=42'b 01001000011101100001111000001111100000011;
  i=41;
  while(i>=0)
  begin
  clk<=~clk;
  x=in[i];
  #5
  clk<=~clk;
  i=i-1;
  #5;
  end
  $finish;
 
  end
endmodule