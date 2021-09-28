module Compliment_2_FSM(out, clk, reset, in);
    input clk, reset, in;
    output reg out;

    parameter A = 1'b0,
              B = 1'b1;
    
    reg state, next;
    always @(posedge clk, posedge reset) begin
        if (reset) begin
          state <= A;
        end
        else begin
          state <= next;
        end
    end

    always @(state, in) begin
        next = state;
        out = 1'b1;
        case (state)
            A : begin
                if (in) begin
                    next <= B;
                    out = 1'b1;
                end
                else begin
                    next <= A;
                    out = 1'b0;
                end
            end
            B : begin
                if (in) begin
                    next <= B;
                    out = 1'b0;
                end
                else begin
                    next <= B;
                    out = 1'b1;
                end
            end 
        endcase
    end
endmodule