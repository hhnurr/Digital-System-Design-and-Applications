module fsm2(
    input x,clk,
    output reg z
);
    wire temp;
    wire [2:0]Q;
    reg [2:0] q;
    wire a;
    initial begin
    q=3'b110;
    end
    assign a=x ^ q[2];
    assign Q[2]=~x;
    assign Q[1] = (q[0] & a) | (a & q[1]);
    assign Q[0] = a & (~q[1]) & (~q[0]);
    assign temp= a & q[1];
    always @(posedge clk)begin
        q[2]=Q[2];
        q[1]=Q[1];
        q[0]=Q[0];
        z<=temp;
    end
endmodule