`timescale 1ns / 1ps


module TOP_tb;

  reg clk, reset, start;
  reg [7:0] InA, InB;
  wire busy;
  wire [7:0] Out;

  // Instantiate the TOP module
  TOP top_inst(
    .clk(clk),
    .reset(reset),
    .start(start),
    .InA(InA),
    .InB(InB),
    .busy(busy),
    .Out(Out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial block
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 0;
    start = 0;
    InA = 8'b00000000;
    InB = 8'b00000000;

    // Apply reset
    reset = 1;
    #10 reset = 0;

    // Apply start
    start = 1;
    #10 start = 0;

    // Test case 1
    InA = 8'b00101010;
    InB = 8'b00001111;
    #100;


    // Test case 2
    InA = 8'b00001100;
    InB = 8'b00101010;
    start=1'b1;
    #10 start=1'b0;
    #100;
    

    // Add more test cases as needed

    // End simulation
    $stop;
  end

endmodule
