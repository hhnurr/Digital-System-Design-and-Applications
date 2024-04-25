`timescale 1ns / 1ps
module D_FF_behav_tb;

reg CLK, D;
wire Q, Qn;

D_FF_behav myD_FF_behav (
    .CLK(CLK),
    .D(D),
    .Q(Q),
    .Qn(Qn)
);

initial begin
    CLK = 0;
    D = 0;

    #5 D = 1; 
    #5 CLK = 1; 
    #5 CLK = 0;
    #5 D = 0; 
    #43 D=1;
    #100 $finish;
end
always begin
    #2 CLK = ~CLK; 
end

endmodule
