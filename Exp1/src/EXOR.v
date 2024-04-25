`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 23:11:54
// Design Name: 
// Module Name: EXOR
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


module EXOR(
input I1,I2,
output O
    );
    
 
wire fromlut2;

   LUT2 #(
      .INIT(4'h1)  // Specify LUT Contents
   ) LUT2_inst (
      .O(fromlut2),   // LUT general output
      .I0(I1), // LUT input
      .I1(I2)  // LUT input
   );
   
O=(

					
					   
endmodule
