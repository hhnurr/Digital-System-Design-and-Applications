`timescale 1ns / 1ps

module with_SSI(
input a,b,c,d, 
output f3,f2,f1,f0
    );
    wire [5:0] fort;
    
    AND a1(a, c, fort[0]);
    NOT n1(b, fort[1]);
    NOT n2(d, fort[2]);
    OR o1(fort[1], fort[2], fort[3]);
    AND a2(fort[3], fort[0], f2);
    AND a3(b, d, f0);   
    AND a6(fort[0], f0, f3);   
    AND a4(a, d, fort[4]);
    AND a5(b, c, fort[5]);  
    XOR x1(fort[4], fort[5], f1); 
       
endmodule


module with_decoder(
input a,b,c,d,
output f3,f2,f1,f0
);
wire [15:0] m;
wire fort0,fort1,fort2,fort3,fort4,fort5,fort6,fort7;

DECODER decoder1(.IN({a,b,c,d}), .OUT(m));

assign f3=m[15];
OR o1(m[5], m[7], fort0);
OR o2(m[13], m[15], fort1);
OR o3(fort0, fort1, f0);
OR o4(m[6], m[7], fort3);
OR o5(m[9], m[11], fort4);
OR o6(m[13], m[14], fort5);
OR o7(fort3, fort4, fort6);
OR o8(fort6, fort5, f1);
OR o9(m[10], m[11], fort7);
OR o10(m[14], fort7, f2);

endmodule

module with_MUX(
input a,b,c,d,
output f3,f2,f1,f0
);

wire fort1,fort2,fort3;

AND a1(b, d, fort1);
XOR x1(b, d, fort2);
NAND na1(b, d, fort3);
MUX m1(.D({fort1,fort1,fort1,fort1}), .S({a,c}), .O(f0));
MUX m2(.D({fort2,d,b,1'b0}), .S({a,c}), .O(f1));
MUX m3(.D({fort3,1'b0,1'b0,1'b0}), .S({a,c}), .O(f2));
MUX m4(.D({fort1,1'b0,1'b0,1'b0}), .S({a,c}), .O(f3));

endmodule

