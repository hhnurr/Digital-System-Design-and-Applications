`timescale 1ns/1ps
module FA_tb;

  reg x, y, ci;
  wire cout, s;

  FA uut (x, y, ci, cout, s);

  initial begin
    for (integer i = 0; i < 8; i = i + 1) begin
      {x, y, ci} = i;
      #10;
    end
    #10 $finish;
  end

endmodule