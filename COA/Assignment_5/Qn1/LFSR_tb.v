`timescale 1ns / 1ns
`include "LFSR.v"

module LFSR_tb;
    reg clk, rst, sel;
    reg[3:0] seed;
    wire[3:0] out;
    integer i;
    LFSR test(.clk(clk), .seed(seed), .sel(sel), .rst(rst), .out(out));

    initial begin

        $dumpfile("LFSR_tb.vcd");
        $dumpvars(0, LFSR_tb);
     
        rst = 1;
        sel = 1;
        seed = 4'b1111;
        clk = 1;
        toggle_clk;
        sel = 0;
        rst = 0;
        for (i=0;i<16;i=i+1) begin
          toggle_clk;
        end
        
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