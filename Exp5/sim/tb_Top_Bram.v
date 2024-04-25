`timescale 1ns / 1ps

module top_bram_TB( );
wire [7:0] DOUT;
reg [7:0] DIN;
reg [3:0] ADDR;
reg CLK;
reg WE=0;

integer count=0;
Top_BRAM uut(CLK, WE, ADDR, DOUT);
initial 
begin 
CLK=0;
forever #5 CLK=~CLK;
end
initial 
begin
while (count<8)
begin
ADDR=count;
#20 count=count+1;
end
#20 
$finish;
end
endmodule