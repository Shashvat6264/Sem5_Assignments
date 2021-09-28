// Assignment No.: 5
// Problem No.: 3 [Multiple-of-three Detector FSM]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
// Mealy machine for Multiple-of-three Detector
`timescale 1ns / 1ps

module three_multiple_detector(
    input inp_bit,rst,clk,                      // input but; arrives from LSB ,reset,clock
    output reg out                            // output bit
    
);

reg [1:0] PS, NS;                               // present state (PS) and next state (NS)
parameter S0 = 0, S1 = 1, S2 = 2;               // states                                   
    always @(posedge clk) begin                 //Synchronous preset and clear
        PS = NS;                                // transfer the NS to PS
        if (rst)
         begin                        // if reset is true, reset the mealy machine
            NS = S0;                            // assign 0 to new state
            PS=S0;
            out = 0;                            // assign 0 to out
        end 
        else begin
            case (PS)                           // transfer control with respect to Present State
                S0: begin                       // if present state is 0
                    case (inp_bit)               // move to certain NS depending on input
                        0: begin                // if input is 0           
                            NS = S0;            // next state is S0
                            out = 1;            // output is 1 as that range of bits will be divisble by 3
                            end
                        1: begin                // if input is 1           
                            NS = S1;            // next state is S1
                            out = 0;            // output is 0
                            end  
                    endcase 
                end 
                S1: begin                       // if present state is 1
                    case (inp_bit)                                            
                        0: begin                // if input is 0
                            NS = S2;            // next state is S2
                            out = 0;            // output is 0
                            end
                        1: begin                // if input is 1
                            NS = S0;            // next state is S0
                            out = 1;            // output is 0
                            end  
                    endcase 
                end 
                S2: begin                       // if present state is 2
                    case (inp_bit)                  
                        0: begin                // if input is 0
                            NS = S1;            // next state is S1 
                            out = 0;            // output is 0
                            end
                        1: begin                // if input is 1      
                            NS = S2;            // next state is S2
                            out = 0;            // output is 0    
                            end  
                    endcase 
                end 
            endcase
        end
    end
endmodule