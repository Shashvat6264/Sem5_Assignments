`timescale 1ns/1ns
`include "mux2to1.v"

 module barrel_shifter(input[7:0] in,input[2:0] shamt,input dir,output[7:0]out);

        reg [7:0] w1;
        wire [7:0] out1;
        always @(in or dir) begin
            
           if(dir==1'b1) begin
             w1={in[3:0],4'b0};
        end
        else begin
             w1={4'b0,in[7:4]};
        end 
        end
        
        mux2to1 m1(in,w1,shamt[2],out1);

        reg [7:0] w2;
        wire [7:0] out2;
        always @(out1 or dir) begin
        if(dir==1'b1) begin
             w2={out1[5:0],2'b0};
        end
        else begin
             w2={2'b0,out1[7:2]};
        end    
        end
        
        mux2to1 m2(out1,w2,shamt[1],out2);

        reg[7:0] w3;
        wire[7:0] out3;
        always @(out2 or dir) begin
         if(dir==1'b1) begin
             w3={out2[6:0],1'b0};
        end
        else begin
             w3={1'b0,out2[7:1]};
        end   
        end
        
        mux2to1 m3(out2,w3,shamt[0],out3);

        assign out=out3;
endmodule
