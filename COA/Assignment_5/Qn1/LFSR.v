// Assignment No.: 5
// Problem No.: 1 [LFSR]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
//LFSR
`include "mux.v"  //including the mux module
module LFSR(clk,seed,sel,rst,out);
	input clk,sel,rst;   //taking the input parameters
	input [3:0] seed;  //seed is a 4 bit binary number
	output reg [3:0] out;  //out is 4 bit binary number
	reg [3:0] state;  //state  is 4 bit binary number
	wire [3:0] w;  //w is 4 bit binary number

	always @(posedge clk) begin  //Synchronous reset
		if (rst) begin
		  state <= 4'b0000;
		  out <= 4'b0000;
		end
	end
	//Using 4 mux modules for storing the values of w's
	mux m1(state[1],seed[0],sel,w[0]);
	mux m2(state[2],seed[1],sel,w[1]);
	mux m3(state[3],seed[2],sel,w[2]);
	mux m4(state[0]^state[1],seed[3],sel,w[3]);

	always @(posedge clk) begin  //Synchronous circuit
		state[0] = w[0];   //Initializing the four bits of state[i] and out[i]
		state[1] = w[1];
		state[2] = w[2];
		state[3] = w[3];
		out[0] = state[0];
		out[1] = state[1];
		out[2] = state[2];
		out[3] = state[3];
	end

endmodule
