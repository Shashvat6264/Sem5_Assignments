`timescale 1ns/1ns
`include "barrel_shifter.v"
module barrel_shifter_tb;

reg[7:0] in;
reg [2:0] shamt;
reg dir;
wire [7:0] out;

barrel_shifter uut(.in(in),.shamt(shamt),.dir(dir),.out(out));
initial begin
    $dumpfile("barrel_shifter_tb.vcd");
    $dumpvars(0,barrel_shifter_tb);
    in=0;
    shamt=0;
    dir=0;
    #50
    in=8'b10010111;
    shamt=3'b101;
    dir=1;
    #50
    in=8'b10110101;
    shamt=3'b110;
    dir=0;
    #50
    $display("Test complete");
    $finish ;
end
endmodule
