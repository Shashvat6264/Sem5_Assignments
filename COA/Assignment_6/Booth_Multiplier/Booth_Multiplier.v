`timescale 1ns / 1ns
module Booth_Multiplier(a, b, clk, reset, load, product);
    input [7:0] a, b;
    input clk, reset, load;
    output [15:0] product;

    reg signed [16:0] P, N, T;  // T=temporary product, P=positive multiplicand, N=negative multiplicand
	reg [7:0] store_a, store_b; // Registers for parallel load of input
	reg [3:0] counter; // cntr keeping track of number of loops
	
	assign product = T[16:1];
	always @(posedge clk or posedge reset) begin // When clk or reset rises up
		if(reset) begin  // If reset is pressed, reset everything to 0
			P <= 0;
			N <= 0;
			T = 0;
			store_a <= 0;
			store_b <= 0;
			counter = 0;
		end
		else if(load) begin // If load is pressed, load data and reset everything else
			store_a <= a;
			store_b <= b;
			counter = 0;
			P <= 0;
			N <= 0;
			T = 0;
		end
		else if(!counter) begin // If first run, assign values to A, S, P
			P <= store_a << 9;
			N <= -store_a << 9;
			T = store_b << 1;
			counter = counter + 1;
		end
		else if(counter <= 8) begin // Run the loop for 6 times
			if(T[0] ^ T[1] == 0) // If last two significants are the same
				T = T >> 1;
			else if(T[0]) // If least 2 significant numbers is 01
				T = (T + P) >> 1;
			else // If least 2 significant numbers is 10
				T = (T + N) >> 1;
			T[16] = T[15];
			counter = counter + 1; // Increasing counter
		end
	end
	
endmodule