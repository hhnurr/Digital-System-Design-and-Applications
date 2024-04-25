`timescale 1ns/1ps

module RCA_tb;
  reg [3:0] x, y;
  reg ci;
  wire co;
  wire [3:0] s;
  RCA uut (x, y, ci, co, s);
  initial begin
    for (integer i = 0; i < 511; i = i + 1) begin
      {x, y, ci} = i;
      #5;
    end
    #10 $finish;
  end

endmodule
