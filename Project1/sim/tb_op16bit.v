`timescale 1ns / 1ps

module tb_op16bit;

reg sra, rotate, op;
reg [31:0] a;
wire [31:0] out4;

op16bit uut(
    .sra(sra),
    .rotate(rotate),
    .a(a),
    .op(op),
    .out4(out4)
);

initial begin
    sra = 0; rotate = 0; op = 0; a = 32'h12345678;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 1; rotate = 0; op = 0; a = 32'h87654321;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 1; rotate = 1; op = 0; a = 32'hFEDCBA98;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 0; rotate = 0; op = 1; a = 32'h01234567;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 1; rotate = 1; op = 1; a = 32'hC0FFEE01;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);


    sra = 0; rotate = 1; op = 1; a = 32'hABCDEFFF;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 1; rotate = 0; op = 1; a = 32'h98765432;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 0; rotate = 0; op = 0; a = 32'hF0F0F0F0;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 0; rotate = 0; op = 1; a = 32'hABCDEF01;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    sra = 1; rotate = 0; op = 1; a = 32'h87654321;
    #10; $display("sra=%b, rotate=%b, op=%b, a=%h, out4=%h", sra, rotate, op, a, out4);

    $stop;
end

endmodule
