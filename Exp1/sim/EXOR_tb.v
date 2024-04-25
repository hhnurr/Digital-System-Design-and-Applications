`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 23:26:41
// Design Name: 
// Module Name: EXOR_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EXOR_tb;

reg inp1,inp2;
wire out;

EXOR uut(.O(out), .I1(inp1), .I2(inp2));

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
