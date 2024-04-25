`timescale 1ns / 1ps

module SR_Latch(
input S,R,
output Q, Qn
    );

    NAND nand1(.I1(~S), .I2(Qn), .O(Q));
    NAND nand2(.I1(~R), .I2(Q), .O(Qn));
 
endmodule

module D_FF (
    input CLK, D,
    output Q, Qn
    );

wire setnot, resetnot, dnot;

NOT not1 (D,dnot);
NAND nand1 (D, CLK, setnot);
NAND nand2 (dnot, CLK, resetnot);
NAND nand3 (setnot, Qn, Q);
NAND nand4 (resetnot, Q, Qn); 
endmodule


 module Master_Slave_D_FF(
    input D,CLK,
    output Q, Qn
    );
    
    wire Qm, Qmnot;
    
    D_FF master(CLK, D, Qm, Qmnot);
    D_FF slave(!CLK, Qm, Q, Qn); 
    
endmodule   

module D_FF_behav (
    input CLK, D,
    output Q, Qn
    );

wire setnot, resetnot, dnot;
reg ff;

    always@ (posedge CLK) begin
        ff <= D;
    end
    assign Q = ff;
    assign Qn = !ff; 

endmodule 


module bit8_reg(
    input [7:0] IN,
    input CLK,
    input CLR,
    output reg [7:0] OUT
    );
    
    always @(posedge CLK or posedge CLR) begin
        if (CLR==1'b1) 
            OUT = 8'b0000_0000;
        else OUT=IN;
    end
endmodule