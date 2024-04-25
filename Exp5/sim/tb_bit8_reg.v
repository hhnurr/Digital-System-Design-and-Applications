`timescale 1ns / 1ps

module tb_bit8_reg;

reg [7:0] IN;
reg CLK, CLR;
wire [7:0] OUT;
bit8_reg myBit8Reg (
    .IN(IN),
    .CLK(CLK),
    .CLR(CLR),
    .OUT(OUT)
);

initial begin
    IN = 8'b10101010;
    CLK = 0;
    CLR = 0;

    #5 CLR = 1; 
    #5 CLR = 0; 
    #10 IN = 8'b11001100; 
    #5 CLK = 1; 
    #5 CLK = 0;
    #100 $finish;
end

always begin
    #5 CLK = ~CLK; 
end

endmodule
