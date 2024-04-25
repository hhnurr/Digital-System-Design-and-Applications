`timescale 1ns / 1ps

module Master_Slave_D_FF_tb;
reg D, CLK;
wire Q, Qn;

Master_Slave_D_FF myD_FF (
    .D(D),
    .CLK(CLK),
    .Q(Q),
    .Qn(Qn)
);

initial begin
    D = 0;
    CLK = 0;
    #5 D = 1;
    #5 CLK = 1; 
    #5 CLK = 0;
    #5 D = 0; 
    #22 D=1;
    #100 $finish;
end
always begin
    #2 CLK = ~CLK;
end
endmodule

