// Assignment No.: 5
// Problem No.: 3 [Multiple-of-three Detector FSM]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
// Test bench for Mealy machine for Multiple-of-three Detector
`timescale 1ns / 1ps
`include "three_multiple_detector.v"
module three_multiple_detector_tb;
reg inp_bit;
reg clk = 1, rst = 0;
wire out;

always #5 clk = ~clk;

three_multiple_detector c (inp_bit, rst, clk,out);
initial
begin
    //input is 11101011
    $dumpfile("three_multiple_detector_tb.vcd");
    $dumpvars(0, three_multiple_detector_tb);

   $monitor("out = %b\t time=%0d",out,$time);
   rst = 1;
   inp_bit = 0; 
   #10 rst = 0; 
   inp_bit = 1;
   #10 inp_bit = 1;
   #10 inp_bit = 0;
   #10 inp_bit = 1;
   #10 inp_bit = 0;
   #10 inp_bit = 1;
   #10 inp_bit = 1;
   #10 inp_bit = 1; 
   #10
   
    $display("Test Complete");
    $finish;
end
always #5
    $monitor("out = %b\t time=%0d",out,$time);
endmodule