`timescale 1ns / 1ns
`include "Bit_Serial_Adder.v"
module Bit_Serial_Adder_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Bit_Serial_Adder uut (
		.A(a), 
		.B(b), 
		.clk(clk), 
		.reset(reset), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
        $dumpfile("Bit_Serial_Adder_tb.vcd");
        $dumpvars(0, Bit_Serial_Adder_tb);

		// Initialize Inputs
		a = 150;
		b = 170;
		clk = 1;
		reset = 1;
        toggle_clk;
        reset = 0;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;
        toggle_clk;


        $display("Test Complete");
        $finish;
	end
    task toggle_clk;
        begin
            #10 clk = ~clk;
            #10 clk = ~clk;
        end
    endtask
endmodule