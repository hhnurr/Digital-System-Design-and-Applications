`timescale 1ns / 1ps
module MUX_tb;
reg [3:0] in1;
reg [1:0] in2;
wire out;
Top_Module dut(.sw(in1), .btn(in2), .led(out));
always
begin
#10 in1[0]=~in1[0];
end
always
begin
#20 in1[1]=~in1[1];
end
always
begin
#40 in1[2]=~in1[2];
end
always
begin
#80 in1[3]=~in1[3];
end
always
begin
#160 in2[0]=~in2[0];
end
always
begin
#320 in2[1]=~in2[1];
end
initial
begin
in1=0;
in2=0;
#700
$finish;
end
endmodule