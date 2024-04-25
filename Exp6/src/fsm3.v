module fsm3(
input reset,
input x,clk,
output z
);
reg [3:0] state;
parameter 
    A = 4'b0000,
    B = 4'b0001,
    C = 4'b0011,
    D = 4'b0010,
    E = 4'b0110,
    F = 4'b0111,
    G = 4'b0101,
    H = 4'b0100,
    I = 4'b1100,
    S = 4'b1000;

    always@(posedge reset  or posedge clk)
    begin
    if(reset==1) state <= A;
    else begin
        case (state)
            A:if(x) state <= B;
              else state <= A;
              
            B:if(x) state <= B;
              else state <= C;
              
            C:if(x) state <= D;
              else state <= G;
              
            D:if(x) state <= E;
              else state <= C;

            E: if(x) state<= B;
               else state <= F;
            
            F: if(x) state<= S;
               else state <= G;
            
            G: if(x) state<= H;
               else state <= A;
            
            H: if(x) state<= B;
               else state <= I;
            
            I: if(x) state<= D;
               else state <= S;
            
            S: if(x) state<= S;
               else state <= S;
            
            default : state<= A; 
            
            endcase
            end 
            end
            assign z = (state == S)|(~(x)&(state==G)) | (x&(state==D));
endmodule
