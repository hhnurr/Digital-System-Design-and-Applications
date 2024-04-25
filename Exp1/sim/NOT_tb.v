`timescale 1ns / 1ps

module NOT_tb;
reg inp;
wire out;

NOT uut(.I(inp), .O(out));

initial
begin

inp=0;
#10
inp=1;
#10
$finish;

end
endmodule
