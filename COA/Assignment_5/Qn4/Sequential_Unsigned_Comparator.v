// Assignment No.: 5
// Problem No.: 4 [Sequential_Unsigned_Comparator]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
module Sequential_Unsigned_Comparator(a, b, ip, op, clk, reset, l, e, g);
    input [31:0] a, b;                                              //32 bit inputs a and b
    input ip, op, clk, reset;                                       //input in,op,clk,reset
    output reg l, e, g;                                             //Output of l,e,g
    reg [31:0] A, B;                                                //32 bit register of A,B

    parameter L = 3'b100, E = 3'b010, G = 3'b001;                   //initializing L=100,E=010,G=001 in binary
    reg [2:0] state, next;                                          //state and next are 3 bits
    always @(posedge clk, posedge reset) begin                      //Asynchronous reset
        if (reset) begin                                            //if reset is 1 and set state=E
          state <= E;
        end
        else begin   
          state <= next;                                            //if reset is 0 and set state=next
        end
    end
    

    always @(posedge clk) begin                                     //Left shifting A and B
        A <= (A << 1);
        B <= (B << 1);
    end

    always @(posedge clk) begin   
        next = state;                                               //Initialize next to state
        case (state)   
            L : begin                                               //if state is L then next = L
                next = L;
            end
            E : begin                                               //if state is E 
                if (A[31] && B[31]) next = E;                       //If the MSB in A and B is 1 then next=E
                else if (!A[31] && !B[31]) next = E;                //If the MSB in A and B is 0 then next=E
                else if (A[31] && !B[31]) next = G;                 //If the MSB in A is 1 and B is 0 then next=G
                else if (!A[31] && B[31]) next = L;                 //if the MSB in A is 0 and B is 1 then next=L
            end
            G : begin
                next = G;                                           //if state is G then next state will be G
            end
        endcase
    end

    // loads the input a and b in our shift regs A and B
    //ip is the input control signal
    always @(posedge ip) begin
        if (ip) begin
            A <= a;
            B <= b;
        end
    end
  //To provide output only when it is asked this always block is used 
  //whenever the op is 1 it gives the correct output otherwise it is 0
    always @(op) begin
        if (op) begin  //if op is 1
          case (state)
            L : begin  //if state is L l,e,g are 1,0,0 respectively in the non-blocking fashion
              l <= 1;
              e <= 0;
              g <= 0;
            end
            E : begin  //if state is E l,e,g are 0,1,0 respectively in the non-blocking fashion
              l <= 0;
              e <= 1;
              g <= 0;
            end
            G : begin //if state is G l,e,g are 0,0,1 respectively in the non-blocking fashion
              l <= 0;
              e <= 0;
              g <= 1;
            end
          endcase
        end
        else begin  //if op is 0 l,e,g are 0,0,0 respectively in the non-blocking fashion
          l <= 0;
          e <= 0;
          g <= 0;
        end
    end

endmodule