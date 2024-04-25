`timescale 1ns/1ps

module parametric_RCA_tb; 
  reg [7:0] x, y;
  reg ci;
  wire cout;
  wire [7:0] s;

  parametric_RCA #(.SIZE(8)) uut ( .x(x),.y(y),.ci(ci),.cout(cout),.s(s));

  initial begin
    for (integer i = 0; i < 65000; i = i + 16) begin
      {x, ci, y} = i;
      #5;
    end
    #10 $finish;
  end

endmodule
