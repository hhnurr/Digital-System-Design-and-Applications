module realvalue (
    input [31:0] data,
    input [6:0] b,
    output reg [31:0] shifted
);
    wire [4:0] shift_amount;
    wire [1:0] select;
    assign select = b[6:5];
    assign shift_amount = b[4:0];
    always@* begin
        casex (select)
        // Logical right shift
        2'b00 : assign shifted = data >> shift_amount;
        // Arithmetic right shift
        2'b01 : assign shifted = (data[31] == 0) ? (data >> shift_amount) :
        {32{data[31]}};
        // Rotate right
        2'b1x :assign shifted = (data >> shift_amount) | (data << (32 -
        shift_amount));
    endcase
    end
endmodule