module ENCODER(
    input [3:0] IN,
    output [1:0] OUT,
    output V
    );
    wire fo1, fo2, fo3;
    assign V = IN[0] | IN[1] | IN[2] | IN[3];
    assign OUT[1] = IN[2] | IN[3];
    assign OUT[0] = (~IN[2] & IN[1]) | IN[3];
endmodule