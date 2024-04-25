`timescale 1ns / 1ps
module TRI_tb;

reg i,e;
wire out;

TRI uut(.O(out), .I(i), .E(e));

initial
begin
i=0; e=0;
#10

i=1; e=0;
#10

i=1; e=1;
#10

i=0; e=1;
#10

$finish;

end
endmodule
