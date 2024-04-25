`timescale 1ns/1ps

module add_sub_tb();
reg [3:0] A,B;
reg ci;
wire [3:0] SUM;
wire cout;
wire V;

Add_Sub add_subx(A, B, ci, SUM, cout, V);

initial
begin

for(integer i=0;i<512;i=i+1)
        begin
        {ci,A,B}=i; 
        #2;
        end
        $finish();
end     
endmodule
