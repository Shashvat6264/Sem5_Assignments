`include "mux.v" 
module LFSR(clk,seed,sel,rst,out);
	input clk,sel,rst;
	input [3:0] seed;
	output reg [3:0] out;
	reg [3:0] state;
	wire [3:0] w;

	always @(posedge clk, posedge rst) begin
		if (rst) begin
		  state <= 4'b0000;
		  out <= 4'b0000;
		end
	end

	mux m1(state[1],seed[0],sel,w[0]);
	mux m2(state[2],seed[1],sel,w[1]);
	mux m3(state[3],seed[2],sel,w[2]);
	mux m4(state[0]^state[1],seed[3],sel,w[3]);

	always @(posedge clk) begin
		state[0] = w[0];
		state[1] = w[1];
		state[2] = w[2];
		state[3] = w[3];
		out[0] = state[0];
		out[1] = state[1];
		out[2] = state[2];
		out[3] = state[3];
	end

endmodule
