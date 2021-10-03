`timescale 1ns / 1ns
`include "Booth_Multiplier.v"
module Booth_Multiplier_tb;

	// Inputs
	reg clk, rst, load;
	reg signed [7:0] a, b;

	// Outputs
	wire signed [15:0] product;

	// Instantiate the Unit Under Test (UUT)
	Booth_Multiplier uut (
		.a(a), 
		.b(b), 
        .clk(clk), 
		.reset(rst), 
		.load(load), 
		.product(product)
	);

	initial begin

        $dumpfile("Booth_Multiplier_tb.vcd");
        $dumpvars(0, Booth_Multiplier_tb);

        clk = 1;
        rst = 1;
        load = 0;
        a = 0;
        b = 0;
        toggle_clk;
        rst = 0;
        load = 1;
        a = 50;
        b = 34;
        toggle_clk;
        load = 0;
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