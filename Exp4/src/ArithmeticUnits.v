`timescale 1ns / 1ps

module HA(
input x,
input y,
output cout,
output s
);
assign cout = x && y;
assign s = x ^ y;
endmodule

module FA(
    input x,
    input y,
    input ci,
    output cout,
    output s
);
    (*DONT_TOUCH = "TRUE"*) wire sum0, cout0, cout1;
    HA ha0(x, y, cout0, sum0);
    HA ha1(sum0, ci, cout1, s);
    assign cout = cout0 || cout1;
endmodule

module RCA(
    input [3:0] x,
    input [3:0] y,
    input ci,
    output cout,
    output [3:0] s
);
    (*DONT_TOUCH = "TRUE"*) wire [2:0] faout;
    FA fa0(x[0],y[0],ci,faout[0],s[0]);
    FA fa1(x[1],y[1],faout[0],faout[1],s[1]);
    FA fa2(x[2],y[2],faout[1],faout[2],s[2]);
    FA fa3(x[3],y[3],faout[2],cout,s[3]);
endmodule

module parametric_RCA #(parameter SIZE = 4)(x, y, ci, cout, s);
    input [SIZE-1:0] x;
    input [SIZE-1:0] y;
    input ci;
    output cout;
    output [SIZE-1:0] s;
    (*DONT_TOUCH = "TRUE"*) wire [SIZE:0] faout;
    assign faout[0] = ci;
    assign cout = faout[SIZE];
    genvar i;
    generate
        for(i=0;i<SIZE;i=i+1)begin
            FA fax(x[i],y[i],faout[i],faout[i+1],s[i]);
        end
    endgenerate
endmodule

module CLA(
    input [3:0] x,y,
    input c0,
    output cout,
    output [3:0] sum
);
    (*DONT_TOUCH = "TRUE"*) wire [4:0] c;
    (*DONT_TOUCH = "TRUE"*) wire [3:0] p,g;
    assign c[0]=c0;
    assign cout = c[4];
    genvar i;
    generate
        for(i=0; i<4; i=i+1)begin
            assign p[i]= x[i] ^ y[i];
            assign g[i] = x[i] && y[i];
            assign sum[i] = p[i] ^c[i];
            assign c[i+1] = g[i] || (p[i] && c[i]);
        end
    endgenerate
endmodule

module Add_Sub(
    input [3:0] A, B,
    input ci,
    output [3:0] SUM,
    output cout,
    output V
);
    (* dont_touch="true" *) wire [3:0] xxor ;
    (* dont_touch="true" *) wire [4:0] c ;
    assign c[0] = ci;
    assign cout = c[4];
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : add_sub_loop
            assign xxor[i] = ci^B[i];
            FA fai (A[i], xxor[i], c[i], c[i + 1], SUM[i]);
        end
    endgenerate
    assign V = c[3] ^ c[4];
endmodule