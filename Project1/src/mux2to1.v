module mux2to1(   
    input D0,D1,
    input  S,
    output O
    );
    wire w0,w1;
    assign w0=D0&~S;
    assign w1=D1&S;
    assign O= w0|w1;
endmodule