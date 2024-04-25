module ENCODER_tb;
reg [3:0] in;
wire [7:0] out;
Top_Module dut(.sw(in), .led(out));
always
begin
#5 in[0]=~in[0];
end
always
begin
#10 in[1]=~in[1];
end
always
begin
#20 in[2]=~in[2];
end
always
begin
#40 in[3]=~in[3];
end
initial
begin
in=0;
#80
$finish;