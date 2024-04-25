`timescale 1ns / 1ps

module CU(
input clk,reset,start,CO,Z,
output reg busy,WE,
output reg [1:0] InsSel,
output reg [2:0] InMuxAdd,
output reg [3:0] RegAdd, OutMuxAdd,
output reg [7:0] CUconst
    );
reg [3:0] state;   
 
always @(posedge clk or posedge reset) begin
    if (reset) begin 
        state<=4'b0;
        busy<=1'b0;
        end
    else begin 
    case (state)
    
         4'b0000: begin
                 if (start) begin 
                 state <= 4'b0001; 
                 InMuxAdd <= 3'b1;
                 WE<=1;
                 RegAdd<=4'b1;
                 CUconst <= 0;
                 busy<=1'b1;
                 end
                 else state<=4'b0000;
                 end
         
         4'b0001: begin
                 state <= 4'b0010; 
                 InMuxAdd <= 3'b1;
                 WE<=1;
                 RegAdd<=4'b0010;
                 CUconst <= 0; 
                 busy<=1'b1;    
                 end 
                 
         4'b0010: begin
                 state <= 4'b0011; 
                 InsSel<=2'b10;
                 InMuxAdd <= 3'b011;
                 WE<=1;
                 RegAdd<=4'b0010;
                 CUconst <= 0;
                 busy<=1'b1;     
                 end 
                 
         4'b0011: begin
                 state <= 4'b0100; 
                 InsSel<=2'b10;
                 InMuxAdd <= 3'b011;
                 WE<=1;
                 RegAdd<=4'b0010;
                 CUconst <= 0;
                 busy<=1'b1;     
                 end 
                 
         4'b0100: begin
                 state <= 4'b0101;
                 CUconst <=8'b1111_1111;  
                 WE<=1; 
                 RegAdd<=4'b0001;
                 InMuxAdd <= 3'b010;
                 busy<=1'b1;
                 end
          
         4'b0101: begin
                 state <= 4'b0110; 
                 WE<=1;                 
                 RegAdd<=4'b0001;
                 InsSel<=2'b01;
                 InMuxAdd <= 3'b011;
                 busy<=1'b1;
                 end
                 
         4'b0110: begin
                 state <= 4'b0111; 
                 WE<=1;                 
                 RegAdd<=4'b0010;
                 CUconst<=8'b0000_0001;
                 InMuxAdd <= 3'b010;
                 busy<=1'b1;
                 end
                 
         4'b0111: begin
                 state <= 4'b1000; 
                 WE<=1;                 
                 RegAdd<=4'b0001;
                 InMuxAdd <= 3'b011;
                 InsSel<=2'b10;
                 busy<=1'b1;
                 end
                 
         4'b1000: begin
                 state <= 4'b1001; 
                 WE<=1;                 
                 RegAdd<=4'b0010;
                 InMuxAdd <= 3'b000;
                 busy<=1'b1;
                 end
          
          4'b1001: begin
                 state <= 4'b0000; 
                 WE<=1;                 
                 RegAdd<=4'b0000;
                 InMuxAdd <= 3'b011;
                 InsSel<= 2'b10;
                 busy<=1'b0;
                 end   
             
                    
endcase
end
 end  
endmodule
