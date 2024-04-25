`timescale 1ns / 1ps

module D_FF_tb;
reg CLK, D;
wire Q, Qn;
D_FF myD_FF (
    .CLK(CLK),
    .D(D),
    .Q(Q),
    .Qn(Qn)
);
initial begin
    CLK = 0;
    D = 0;
    #13 D = 1;
    #13 D = 0;
    #13 D = 1; 
    #100 $finish;
end

always begin
    #5 CLK = ~CLK; 
end
endmodule


