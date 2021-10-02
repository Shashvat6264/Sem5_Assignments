`timescale 1ns/1ns
`include "D_FF.v"
module Bit_Serial_Adder(A, B, clk, reset, sum, cout);
	input [7:0] A, B;
    input clk, reset;
    output [7:0] sum;
    output cout;
    wire cin, a_bit, b_bit, sum_bit, cout_bit, cin_bit;
    reg [3:0] state;					//register will go from state 0 to state 7 creating 8 bit counter
    wire [3:0] count = state;			//link count to state
	
    assign cin = 0; 						//store current bit of a under consideration in each clock
    assign cout = cout_bit;		//link cout to cout_bit

    initial								//state initialisation
        begin
            state <= 0;
        end

	always @(posedge clk)			//cycle to change state at every clock
    begin
		if(reset == 1)				//reset to go to start state i.e. state 0
			state = 0;
        else if(state <= 8) 
            state = state + 1; 
    end
	
    Parallel_input inputa(A, clk, count, a_bit);		//function to move a_bit to next bit of a in every cycle
    Parallel_input inputb(B, clk, count, b_bit);		//function to move b_bit to next bit of b in every cycle

	assign {cout_bit, sum_bit} = a_bit + b_bit + cin_bit;	//evaluate current cout_bit and sum_bit 

    D_FF dff(clk, reset, cout_bit, count, cin, cin_bit);	//make cout_bit as cin_bit for next calculation using d flipflop
    Handle_output output_sum(clk, reset, sum_bit, count, sum);	//store current result

endmodule 

module Handle_output(input clk, input reset, input a, input [3:0] count, output [7:0] final);
    reg [7:0] ans;				// store final answer
    assign final = ans;
    initial							// initialisation to 0
        begin 
            ans <= 8'b00000000;
        end
    always @(posedge clk)
        begin
			if(reset == 1)			// reset condition
				ans = 8'b00000000;
            else if (count <= 8 && count >= 1)
                ans = {a, ans[7:1]};
        end
endmodule


module Parallel_input(input [7:0] a, input clk, input [3:0] count, output bit);
    reg [7:0] a_store;			// store bits of a and b
    assign bit = a_store[0];  // bit is current bit in consideratin
    always @(posedge clk)
        begin
			if(count == 0)    // store all bits of a into a_store initially
                a_store <= a;
            else if (count <= 8)
                a_store <= {a_store[0], a_store[7:1]}; // right shify by 1 bit
			else
				a_store[0] <= a[7];
        end
endmodule 