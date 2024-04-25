`timescale 1ns / 1ps

module real_TB();
reg [31:0] data;
reg [6:0] b;
wire [31:0] shifted;

reg [31:0] i; // Reg tipinde sayac? tan?mla
  reg [31:0] a1 [0:99];
  reg [6:0] b1 [0:99];
  reg [31:0] y1 [0:99];
 genvar k;
  generate
    for (k = 0; k < 100; k = k + 1) begin : gen_block

realvalue xx(.data(data), .b(b), .shifted(shifted));
end endgenerate

initial begin
    $readmemb("C:/SSTU_project_1/random_values.txt", a1); // Assumes input_a_data.txt contains 32-bit hexadecimal values
    $readmemb("C:/SSTU_project_1/random_values_7.txt", b1); // Assumes input_b_data.txt contains 7-bit binary values

    // Run simulations for 100 test cases
    #10;
    for (i = 0; i < 100; i = i + 1) begin
     data = a1[i];
     b = b1[i];
      #10; // Add any necessary delay between test cases
     y1[i] = shifted;
     $writememb("C:/SSTU_project_1/real_results.txt", y1);
     end
   $finish;
  end
endmodule