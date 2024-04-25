module tb_shifer_rotator;
reg [31:0] a1;
reg [6:0] b1;
wire [31:0] y1 ;
reg [31:0] reals;
reg [31:0] i,j; // Reg tipinde sayac? tan?mla
reg [31:0] a [0:99];
reg [31:0] r [0:99];
reg [6:0] b [0:99];
reg [31:0] y [0:99];
// Instantiate the shifter_rotator module 100 times for different test cases
genvar k;
generate
for (k = 0; k < 100; k = k + 1) begin : gen_block
Top_Module uut (
.A(a1),
.B(b1),
.C(y1),
.carry(carry)
);
end
endgenerate
// Initial block to read input from files
initial begin
$readmemb("C:/SSTU_project_1/random_values.txt", a); 
$readmemb("C:/SSTU_project_1/random_values_7.txt", b); 
$readmemb("C:/SSTU_project_1/real_results.txt", r);
// Run simulations for 100 test cases
#10;
for (i = 0; i < 100; i = i + 1) begin
a1 = a[i];
b1 = b[i];
reals = r[i];
#10; // Add any necessary delay between test cases
y[i] = y1;
$writememb("C:/SSTU_project_1/results.txt", y);
// Display inputs in binary and decimal
$write("A=\"bin=%b,dec=%0d\"; B=\"bin=%b,dec=%0d\"; ", a1, a1, b1, b1);
// Display expected result in binary and decimal
$write("C=\"bin=%b,dec=%0d\"; ", reals, reals);
// Display circuit result in binary and decimal
$write("C_circ=\"bin=%b,dec=%0d\"; ", y1, y1);
// Compare expected result with circuit result
$write("status=%s\n", (y1 == reals) ? "TRUE" : "FALSE");
end
// End simulation
$finish;
end
endmodule