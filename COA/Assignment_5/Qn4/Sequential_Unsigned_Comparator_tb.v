`timescale 1ns / 1ns
`include "Sequential_Unsigned_Comparator.v"

module Sequential_Unsigned_Comparator_tb;
    reg [31:0] a, b; 
    reg clk, rst, ip, op;
    wire l, e, g;
    integer i;
    Sequential_Unsigned_Comparator uut(a, b, ip, op, clk, rst, l, e, g);

    initial begin
        $dumpfile("Sequential_Unsigned_Comparator_tb.vcd");
        $dumpvars(0, Sequential_Unsigned_Comparator_tb);

        a = 32'd50;
        b = 32'd50;
        rst = 1;
        clk = 0;
        ip = 1;
        op = 0;

        toggle_clk;
        rst = 0;
        ip = 0;
        for (i=0;i<32;i=i+1) begin
            toggle_clk;
        end
        op = 1;
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