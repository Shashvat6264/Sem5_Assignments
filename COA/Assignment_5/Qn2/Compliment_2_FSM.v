// Assignment No.: 5
// Problem No.: 2 [2's complement FSM]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
module Compliment_2_FSM(out, clk, reset, in);
    input clk, reset, in;                       //input values
    output reg out;                             //output values

    parameter A = 1'b0,                         //Bit 0
              B = 1'b1;                         //Bit 1
    
    reg state, next;
    always @(posedge clk, posedge reset) begin  //Asynchronous reset
        if (reset) begin
          state <= A;
        end
        else begin
          state <= next;
        end
    end

    always @(state, in) begin   
        next = state;                           //initializing the next state
        out = 1'b1;                             //1 bit
        case (state)
            A : begin                           //if state is A
                if (in) begin                   //if in is 1
                    next <= B;                  //set next to state B and output as 1
                    out = 1'b1;
                end
                else begin                      //if in is not 1
                    next <= A;                  //set next to state A and output as 0 
                    out = 1'b0;
                end
            end
            B : begin                           //if state is B
                if (in) begin                   //if in is 1
                    next <= B;                  //set next to state B and output as 0
                    out = 1'b0;
                end
                else begin                      //if in is not 1
                    next <= B;                  //set next to state B and output as 1
                    out = 1'b1;
                end
            end 
        endcase
    end
endmodule