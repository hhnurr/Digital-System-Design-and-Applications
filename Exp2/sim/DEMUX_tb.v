`timescale 1ns / 1ps
module DEMUX_tb;
reg in1;
reg [1:0] in2;
wire [3:0] out;
Top_Module dut(.sw(in1), .btn(in2), .led(out));
always
begin
#5 in2[0]=~in2[0];
end
always
begin
#10 in2[1]=~in2[1];
end
always
begin
#20 in1=~in1;
end
initial
begin
in1=0;
in2=0;
#50
$finish;
end
endmodule