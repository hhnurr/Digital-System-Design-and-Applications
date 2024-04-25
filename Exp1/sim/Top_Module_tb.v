`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 21:15:53
// Design Name: 
// Module Name: Top_Module_tb
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


module Top_Module_tb;
reg [14:0] inp;
wire [7:0] out;

Top_Module uut(.OUT(out), .IN(inp));

initial 
begin

inp=16'b000000000000000;
#10

inp=16'b010101010100101;
#10

inp=16'b1111111111111111;
#10

inp=16'b101010101011010;
#10
$finish;
end



endmodule

