`timescale 1ns / 1ps

module Top_BRAM(
    input CLK, WE,
    input [3:0] addr,
    output [7:0] dout
    
    );
     wire [7:0] din;
    
    BRAM brami (.clka_0(CLK), .wea_0(WE), .addra_0(addr), .douta_0(dout));
endmodule
