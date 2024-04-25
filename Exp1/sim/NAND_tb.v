`timescale 1ns / 1ps

module NAND_tb;

reg inp1,inp2;
wire out;

NAND uut(.O(out), .I1(inp1), .I2(inp2));

initial 
begin


inp1=0; inp2=0;
#10

inp1=1; inp2=0;
#10

inp1=1; inp2=1;
#10

inp1=0; inp2=1;
#10
$finish;

end
endmodule
