`timescale 1ns / 1ps

module register (
    input clk, reset, En,
    input [7:0] Rin,
    output reg [7:0] Rout
);

    always @(posedge clk or posedge reset) begin
        if (reset) 
            Rout <= 0;
        else if (En) 
            Rout <= Rin;
    end

endmodule


module decoder_4to16 (
  input [3:0] address,
  input write_enable,
  output reg [15:0] select_output
);

always @(address or write_enable) begin
  if (write_enable) begin
    case (address)
      4'b0000: select_output = 16'b0000000000000001;
      4'b0001: select_output = 16'b0000000000000010;
      4'b0010: select_output = 16'b0000000000000100;
      4'b0011: select_output = 16'b0000000000001000;
      4'b0100: select_output = 16'b0000000000010000;
      4'b0101: select_output = 16'b0000000000100000;
      4'b0110: select_output = 16'b0000000001000000;
      4'b0111: select_output = 16'b0000000010000000;
      4'b1000: select_output = 16'b0000000100000000;
      4'b1001: select_output = 16'b0000001000000000;
      4'b1010: select_output = 16'b0000010000000000;
      4'b1011: select_output = 16'b0000100000000000;
      4'b1100: select_output = 16'b0001000000000000;
      4'b1101: select_output = 16'b0010000000000000;
      4'b1110: select_output = 16'b0100000000000000;
      4'b1111: select_output = 16'b1000000000000000;
      default: select_output = 16'b0000000000000000;
    endcase
  end else begin
    select_output = 16'b0000000000000000;
  end
end

endmodule


module multiplexer_16to1 (
  input [3:0] select,
  input [7:0] data_in0, data_in1, data_in2, data_in3, data_in4, data_in5, data_in6, data_in7, data_in8, data_in9, data_in10, data_in11,data_in12,data_in13,data_in14,data_in15,
  output reg [7:0] out
);

always @(*) begin
  case (select)
    4'b0000: out = data_in0;
    4'b0001: out = data_in1;
    4'b0010: out = data_in2;
    4'b0011: out = data_in3;
    4'b0100: out = data_in4;
    4'b0101: out = data_in5;
    4'b0110: out = data_in6;
    4'b0111: out = data_in7;
    4'b1000: out = data_in8;
    4'b1001: out = data_in9;
    4'b1010: out = data_in10;
    4'b1011: out = data_in11;
    4'b1100: out = data_in12;
    4'b1101: out = data_in13;
    4'b1110: out = data_in14;
    4'b1111: out = data_in15;
    default: out = 8'b00000000; // Varsayýlan durum
  endcase
end

endmodule



module RB(
input [7:0] InA, InB,CUconst, ALUout,
input  [2:0] InMuxAdd,
input WE,clk,rst,
input [3:0] RegAdd,OutMuxAdd,
output [7:0] Out,ALUinA, ALUinB
);
wire [7:0] regout,regin;
wire [15:0] dec_out;
wire [7:0] register [15:0];
wire data;

MUX_2 mux2(.select(InMuxAdd), .A(InA), .B(InB), .C(CUconst), .D(ALUout), .E(regout), .F(regout),.G(regout),.H(regout), .out(regin));
decoder_4to16 dec1(.address(RegAdd), .write_enable(WE), .select_output(dec_out));

generate
genvar i;

for(i=0;i<15;i=i+1) begin

register reg1(.clk(clk), .reset(rst), .En(dec_out[i]), .Rin(regin), .Rout(register[i]));

end 
endgenerate

assign Out=register[0] ;
assign  ALUinA= register[1];
assign ALUinB= register[2];

multiplexer_16to1 mux16(.data_in0(register[0]),
                        .data_in1(register[1]),
                        .data_in2(register[2]),
                        .data_in3(register[3]),
                        .data_in4(register[4]),
                        .data_in5(register[5]),
                        .data_in6(register[6]),
                        .data_in7(register[7]),
                        .data_in8(register[8]),
                        .data_in9(register[9]),
                        .data_in10(register[10]),
                        .data_in11(register[11]),
                        .data_in12(register[12]),
                        .data_in13(register[13]),
                        .data_in14(register[14]),
                        .data_in15(register[15]),
 
.select(OutMuxAdd), .out(regout));

endmodule




