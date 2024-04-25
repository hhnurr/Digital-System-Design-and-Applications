(* DONT_TOUCH = "TRUE" *)
module shifter_rotator(
input [6:0] B,
input [31:0] A,
output carry,
output [31:0] C
);
//B[5] = a or l
//B[6] = rotate
wire s;
wire [31:0] in8, in4,in2,in1;
mux_2 muxxxx(.D1(A[31]), .D0(1'b0), .S(B[5]), .O(s));
op16bit op1 (
.a(A),
.out16(in8),
.sra(s),
.rotate(B[6]),
.op(B[4])
);
op8bit op2 (
.a(in8),
.out8(in4),
.sra(s),
.rotate(B[6]),
.op(B[3])
);
op4bit op3 (
.a(in4),
.out4(in2),
.sra(s),
.rotate(B[6]),
.op(B[2])
);
op2bit op4 (
.a(in2),
.out2(in1),
.sra(s),
.rotate(B[6]),
.op(B[1])
);
op1bit op5 (
.a(in1),
.out1(C),
.sra(s),
.rotate(B[6]),
.op(B[0])
);
wire [31:0] cw;
genvar i;
generate
for(i=0;i<32;i=i+1)begin
assign cw[i+1] = cw[i] | C[i];
end
endgenerate
assign carry= ~cw[31];

endmodule