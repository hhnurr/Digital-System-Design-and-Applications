module op16bit(
    input sra,
    input rotate,
    input [31:0] a,
    input op,
    output [31:0] out4
    );
    
    wire [15:0] rotate4;
//4. katman    
    genvar i;
    generate
        for(i = 0; i<16; i=i+1)begin
            mux2to1 m1(sra , a[i] , rotate, rotate4[i]);
            mux2to1 m2 (a[i+16], rotate4[i], op, out4[i+16]);
            mux2to1 m3 (a[i], a[i+16], op, out4[i]);     
        end        
    endgenerate
    
    endmodule