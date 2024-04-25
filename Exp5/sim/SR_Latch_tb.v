`timescale 1ns / 1ps

module SR_Latch_tb();
reg S,R;
wire Q,Qn;

SR_Latch srlatch1(S, R, Q,Qn);
initial
begin

S=0; R=0;
#10
S=0; R=1;
#10
S=1; R=0;
#10
S=0; R=0;
#10
S=0; R=1;
#10
S=0; R=1;
#10
$finish();
end
endmodule