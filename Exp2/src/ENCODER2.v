module ENCODER2(
    input [3:0] IN,
    output reg [1:0] OUT,
    output reg V );
    always @(IN) begin
        casex(IN)
            4'b0000 : begin OUT=2'bXX; V=1'b0; end
            4'b0001 : begin OUT=2'b00; V=1'b1; end
            4'b001x : begin OUT=2'b01; V=1'b1; end
            4'b01xx : begin OUT=2'b10; V=1'b1; end
            4'b1xxx : begin OUT=2'b11; V=1'b1; end
            default : OUT=2'd0;
        endcase
    end
endmodule