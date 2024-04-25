`timescale 1ns / 1ps

module TB();
  reg clk,x;
  reg [41:0] in;
  wire z;
  reg reset;
  
  state_machine uut(.X(x), .CLK(clk), .Y(z), .RST(reset));
  
  integer i;
  initial begin
  reset=1'b0;
  clk=1'b0;
  in=42'b001001000011101100001111000001111100000011;
  i=41;
  while(i>=0)
  begin
  
  if (i==1) begin
    reset<=1;
    #2
    reset<=0;
    end
    
  
  clk<=~clk;
  #2
  x=in[i];
  #5
  clk<=~clk;
  i=i-1;
  #5;
  
  end
  $finish;
 
  end
endmodule