`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2023 14:51:45
// Design Name: 
// Module Name: HA_tb
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


module HA_tb;

reg x;
reg y;
wire s;
wire cout;

HA uut(x, y, cout, s);
  initial begin
    for (integer i = 0; i < 4; i = i + 1) begin
      case (i)
        0: {x, y} = 2'b00;
        1: {x, y} = 2'b01;
        2: {x, y} = 2'b10;
        3: {x, y} = 2'b11;
      endcase
      #10;
    end
    #10 $finish;
  end
endmodule
