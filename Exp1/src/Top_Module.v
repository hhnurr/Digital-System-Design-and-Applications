`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2023 21:28:00
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(

input [14:0] IN,
output [7:0] OUT

    );
    
AND aGATE(.O(OUT[0]), .I1(IN[0]), .I2(IN[1]));

OR oGATE(.O(OUT[1]), .I1(IN[2]), .I2(IN[3]));

NOT nGATE(.O(OUT[2]), .I(IN[4]));

NAND naGATE(.O(OUT[3]), .I1(IN[5]), .I2(IN[6]));

NOR noGATE(.O(OUT[4]), .I1(IN[7]), .I2(IN[8]));

XOR xGATE(.O(OUT[5]), .I1(IN[9]), .I2(IN[10]));

XNOR xnGATE(.O(OUT[6]), .I1(IN[11]), .I2(IN[12]));

TRI tGATE(.O(OUT[7]), .I(IN[13]), .E(IN[14]));

endmodule
