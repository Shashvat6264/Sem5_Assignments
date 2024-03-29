// Assignment No.: 5
// Problem No.: 3 [Multiple-of-three Detector FSM]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
`timescale 1ns / 1ns
`include "Compliment_2_FSM.v"

module Compliment_2_FSM_tb;
    reg in, clk, rst;
    wire out;
    Compliment_2_FSM uut(out, clk, rst, in);

    initial begin
        $dumpfile("Compliment_2_FSM_tb.vcd");
        $dumpvars(0, Compliment_2_FSM_tb);

        rst = 1;
        in = 0;
        clk = 1;
        toggle_clk;
        rst = 0;
        toggle_clk;
        in = 0;
        toggle_clk;
        in = 0;
        toggle_clk;
        in = 1;
        toggle_clk;
        in = 1;
        toggle_clk;
        in = 0;
        toggle_clk;
        in = 0;
        toggle_clk;
        in = 1;
    
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