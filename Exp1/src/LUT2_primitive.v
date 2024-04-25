`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2023 11:12:29
// Design Name: 
// Module Name: LUT2_primitive
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


module LUT2_primitive(
input I1,I2,
output O
    );
   
   wire a,b; 

   LUT2 #(
      .INIT(4'h1)  // Specify LUT Contents
   ) ab (
      .O(a),   // LUT general output
      .I0(I1), // LUT input
      .I1(~I2)  // LUT input
   );
   
   
   LUT2 #(
      .INIT(4'h1)  // Specify LUT Contents
   ) ba (
      .O(b),   // LUT general output
      .I0(I2), // LUT input
      .I1(~I1)  // LUT input
   );

assign O=a||b;
					
					   
endmodule

