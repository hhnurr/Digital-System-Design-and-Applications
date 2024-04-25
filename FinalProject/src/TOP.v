`timescale 1ns / 1ps

module TOP(
input clk,reset,start,
input [7:0] InA,InB,
output  busy,
output [7:0] Out
    );
wire [1:0] InsSel;
wire CO,Z,WE;
wire [7:0] CUconst;
wire [2:0] InMuxAdd;  
wire [3:0] OutMuxAdd, RegAdd;

    CU cu1(.clk(clk), .reset(reset), .start(start), .busy(busy), .InsSel(InsSel), .CO(CO),
    .Z(Z), .CUconst(CUconst), .InMuxAdd(InMuxAdd), .OutMuxAdd(OutMuxAdd), .RegAdd(RegAdd),
    .WE(WE));
    
wire [7:0] ALUinA, ALUinB, ALUout;
    
    ALU alu1(.InsSel(InsSel), .CO(CO), .Z(Z), .ALUinA(ALUinA), .ALUinB(ALUinB),
    .ALUout(ALUout));
    
    RB rb1(.clk(clk), .rst(reset), .InA(InA), .InB(InB), .CUconst(CUconst),
    .InMuxAdd(InMuxAdd), .OutMuxAdd(OutMuxAdd), .RegAdd(RegAdd), .WE(WE),
    .ALUinA(ALUinA), .ALUinB(ALUinB), .ALUout(ALUout), .Out(Out));
    
endmodule
