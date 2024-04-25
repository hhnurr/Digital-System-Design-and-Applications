`timescale 1ns / 1ps

//module testbench;

//// Inputs
//reg [7:0] a, b;
//// Outputs
//wire [7:0] r;
//wire cout;

//// Instantiate the eight-bit adder module
//eight_bit_adder my_adder(
//    .a(a),
//    .b(b),
//    .r(r),
//    .cout(cout)
//);

//// Clock generation
//reg clk = 0;
//always #5 clk = ~clk;

//// Test stimulus
//initial begin
//    // Initialize inputs
//    a = 8'b10101010;
//    b = 8'b11001100;

//    // Apply inputs and observe outputs
//    #5 a = 8'b00110011;
//    #5 b = 8'b01010101;

//    // Add more test cases if needed

//    // Finish simulation after some time
//    #100 $finish;
//end

//// Display outputs
//always @(posedge clk) begin
//    $display("a = %b, b = %b, sum = %b, cout = %b", a, b, r, cout);
//end

//endmodule
//module testbench;

//// Inputs
//reg [7:0] ALUinA, ALUinB;
//reg [1:0] InsSel;
//// Outputs
//wire [7:0] ALUout;
//wire co, z;

//// Instantiate the ALU module
//ALU my_ALU(
//    .ALUinA(ALUinA),
//    .ALUinB(ALUinB),
//    .InsSel(InsSel),
//    .ALUout(ALUout),
//    .co(co),
//    .z(z)
//);

//// Clock generation
//reg clk = 0;
//always #5 clk = ~clk;

//// Test stimulus
//initial begin
//    // Test case 1: AND operation
//    ALUinA = 8'b11001100;
//    ALUinB = 8'b10101010;
//    InsSel = 2'b00;
//    #5;

//    // Test case 2: XOR operation
//    ALUinA = 8'b11001100;
//    ALUinB = 8'b10101010;
//    InsSel = 2'b01;
//    #5;

//    // Test case 3: ADD operation
//    ALUinA = 8'b11001100;
//    ALUinB = 8'b10101010;
//    InsSel = 2'b10;
//    #5;

//    // Test case 4: CLS operation
//    ALUinA = 8'b11001100;
//    ALUinB = 3'b010;
//    InsSel = 2'b11;
//    #5;

//    // Add more test cases if needed

//    // Finish simulation after some time
//    #100 $finish;
//end

//// Display outputs
//always @(posedge clk) begin
//    $display("ALUinA = %b, ALUinB = %b, ALUout = %b, co = %b, z = %b", ALUinA, ALUinB, ALUout, co, z);
//end

//endmodule



`timescale 1ns / 1ps

module RB_tb;

reg [7:0] InA, InB, CUconst, ALUout;
reg [2:0] InMuxAdd;
reg WE, clk, rst;
reg [3:0] RegAdd, OutMuxAdd;
wire [7:0] Out, ALUinA, ALUinB;

RB dut (
  .InA(InA),
  .InB(InB),
  .CUconst(CUconst),
  .ALUout(ALUout),
  .InMuxAdd(InMuxAdd),
  .WE(WE),
  .clk(clk),
  .rst(rst),
  .RegAdd(RegAdd),
  .OutMuxAdd(OutMuxAdd),
  .Out(Out),
  .ALUinA(ALUinA),
  .ALUinB(ALUinB)
);
  reg clk = 0;
always #5 clk = ~clk;

initial begin
  // Initialize inputs
  InA = 8'b00000000;
  InB = 8'b00000000;
  CUconst = 8'b00000000;
  ALUout = 8'b00000000;
  InMuxAdd = 3'b000;
  clk=0;
  WE = 0;
  rst = 0;
  RegAdd = 4'b0000;
  OutMuxAdd = 4'b0000;


  // Apply stimulus
  #10 WE = 1;
  #10 InA = 8'b10101010;
  #10 InB = 8'b01010101;
  #10 CUconst = 8'b11001100;
  #10 ALUout = 8'b11110000;
  #10 InMuxAdd = 3'b000;
  #10 RegAdd = 4'b0000;
  #10 OutMuxAdd = 4'b0101;
  #10 WE = 0;
  #10 rst = 1;
  #10 rst = 0;

  // Add additional stimulus here if needed

  #100 $finish; // Terminate simulation
end
endmodule


