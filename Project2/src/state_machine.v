`timescale 1ns / 1ps

module state_machine(
input X,
input CLK,
input RST,
output Y
);

reg [3:0] state;
reg [1:0] counterA=2'b00, counterB=2'b00;
reg flaga=0, flagb=0;
parameter 

A= 4'b0000,
B= 4'b0001,
C= 4'b0011,
D= 4'b0010,
E= 4'b0110,
F= 4'b0111,
G= 4'b0101,
S= 4'b1111;

       
       
always @(posedge RST or posedge CLK)

begin

if  (RST) begin
    state<=A;
    counterA<=0;
    counterB<=0;
    end

else begin

case (state) 

    A: if (X) state <=A;
    else state <=B;
    
    
    B: if (X) state <=A;
    else state <=C;
    
    
    C: if (X) state <=F;
    else state <=D;
    
    D: if (X) state <=F;
    else begin
    state <=E;
    end
    
     E: begin 
       if (counterA < 2'b10) counterA <= counterA+1;
        if (counterA==2'b01) begin
            if (X==0)begin 
        state <=S;      
        end
       end
        else begin
         state <=F;
        end
        
      end
 
   
    
  F: begin  
        if (counterB==2'b01) begin
            if (X==1) state<=S;
            else state<=B;
        end
        
        else if(X) state <=G;
        else begin state <=B;
       end
        end
    
     G: begin
     if (counterB < 2'b10) counterB<= counterB+1;
     if (X) state <=A;
    else begin
    state <=B;
    end
    end  
    
      S: state <=S;
  
     default state <= A ;
   
 endcase
 
    if (counterB==2'b10 || counterA==2'b10) begin
        state<=S;
    end
 end 
 end

 assign Y = (state==S) | (state==E) | (state==G);

endmodule
