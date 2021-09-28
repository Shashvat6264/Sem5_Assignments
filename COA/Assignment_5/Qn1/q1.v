`include "mux.v" 
module LFSR(clk,seed,sel,rst,out);
input clk,sel,rst;
input[3:0] seed;
output reg[3:0] out;
wire state[3:0];
reg w;
mux m1(state[1],seed[0],sel,state[0]);
mux m2(state[2],seed[1],sel,state[1]);
mux m3(state[3],seed[2],sel,state[2]);
mux m4(state[0]^state[1],seed[3],sel,state[3]);
	


always @ (posedge clk) begin
	if(sel)begin
	state[0]=seed[0];
	state[1]=seed[1];
	state[2]=seed[2];
	state[3]=seed[3];
	end
	else begin
	state[0]=state[1];
	state[1]=state[2];
	state[2]=state[3];
	state[3]=state[0]^state[1];
	end
	out[0] = state[0];
	out[1] = state[1];
	out[2] = state[2];
	out[3] = state[3];
end
endmodule
