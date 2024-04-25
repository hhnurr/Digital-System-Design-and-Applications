module fsm1(
    input x,clk,
    output reg z
);
     wire temp;
    wire [2:0]Q;
    reg [2:0]q;
    initial begin
        q=3'b110;
    end
    assign temp=(x & q[2] & q[0]) | (~x & ~q[0] & q[1] );
    always @(posedge clk)begin
        q[2]<=Q[2];
        q[1]<=Q[1];
        q[0]<=Q[0];
        z<=temp;
    end
    assign Q[0]=(~(q[2]) & ~(q[1]) & ~(q[0])) | (x & ~(q[1])) | (x & ~(q[0]));
    assign Q[1]=(~(q[2]) & ~(q[1]) & x) | (q[1] & ~q[0]) | (~(q[2]) & ~(q[1]) & (q[0]));
    assign Q[2]=(x & q[2]) | (x & q[1] & q[0]);
endmodule
