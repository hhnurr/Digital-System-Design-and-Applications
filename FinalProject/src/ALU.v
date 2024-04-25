module ADD_8bit(

    input [7:0] a, b,   
    output reg [7:0] r, 
    output reg cout
);

reg [8:0] result; 
reg carry_out;   

always @(a or b) begin
    result = a + b;
    carry_out = result[8];
end

always @(result or carry_out) begin
    r = result[7:0];
    cout = carry_out;
end

endmodule

module XOR_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] r
    );
    
    assign r = a ^ b;
    
endmodule

module CLS_8bit(
    input [7:0] a,
    input [2:0] b,  
    output reg [7:0] r,
    output Z
    );
    integer i;
    always@(*) begin
        for ( i = 0; i < 8; i = i + 1) begin
            if (i < b)
                r[i] = a[7 - (b - 1 - i)];
            else
                r[i] = a[i - b];
        end
    end
    
assign Z= r[0];

endmodule

module AND_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] r
    );
    
    assign r = a & b;
    
endmodule


module ZC_8bit(
input [7:0] a,
output Z
);

assign Z = (a ==8'b0 )? 1: 0;

endmodule


module ALU(
input [7:0] ALUinA, ALUinB,
input [1:0] InsSel,
output [7:0] ALUout,
output CO,Z
);
wire [7:0] r0,r1,r3;
wire [7:0] r2;
wire carry_out,zero;

AND_8bit and1(.a(ALUinA), .b(ALUinB), .r(r0));
XOR_8bit exor1(.a(ALUinA), .b(ALUinB), .r(r1));
ADD_8bit add1(.a(ALUinA), .b(ALUinB), .r(r2), .cout(carry_out));
CLS_8bit cls1(.a(ALUinA), .b(ALUinB), .r(r3), .Z(zero));

MUX mux1(.A(r0), .B(r1), .C(r2), .D(r3), .O(ALUout), .S(InsSel));
MUX_1 mux2(.A(0), .B(0), .C(carry_out), .D(zero), .O(CO), .S(InsSel));

ZC_8bit zc1(.a(ALUout), .Z(Z));

endmodule





