`timescale 1ns/1ps

module CLA_tb;
  CLA uut (.x(x),.y(y), .c0(c0),.cout(cout),.sum(sum));

  reg [3:0] x;
  reg [3:0] y;
  reg c0;
  wire cout;
  wire [3:0] sum;

  initial begin
    for (integer i = 20; i < 511; i = i + 3) begin
      {x, c0, y} = i;
      #5;
    end
    #10 $finish;
  end
endmodule
