module Sequential_Unsigned_Comparator(a, b, ip, op, clk, reset, l, e, g);
    input [31:0] a, b; 
    input ip, op, clk, reset;
    output reg l, e, g;
    reg [31:0] A, B;

    parameter L = 3'b100, E = 3'b010, G = 3'b001;
    reg [2:0] state, next;
    always @(posedge clk, posedge reset) begin
        if (reset) begin
          state <= E;
        end
        else begin
          state <= next;
        end
    end
    

    always @(posedge clk) begin
        A <= (A << 1);
        B <= (B << 1);
    end

    always @(posedge clk) begin
        next = state;
        case (state)
            L : begin
                next = L;
            end
            E : begin
                if (A[31] && B[31]) next = E;
                else if (!A[31] && !B[31]) next = E;
                else if (A[31] && !B[31]) next = G;
                else if (!A[31] && B[31]) next = L;
            end
            G : begin
                next = G;
            end
        endcase
    end

    always @(posedge ip) begin
        if (ip) begin
            A <= a;
            B <= b;
        end
    end

    always @(op) begin
        if (op) begin
          case (state)
            L : begin
              l <= 1;
              e <= 0;
              g <= 0;
            end
            E : begin
              l <= 0;
              e <= 1;
              g <= 0;
            end
            G : begin
              l <= 0;
              e <= 0;
              g <= 1;
            end
          endcase
        end
        else begin
          l <= 0;
          e <= 0;
          g <= 0;
        end
    end

endmodule