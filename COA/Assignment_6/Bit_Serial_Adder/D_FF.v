`timescale 1ns/1ns
module D_FF(input clk, input reset, input cout, input [3:0] count, input cin, output q);
    reg d;
    assign q = d;
    initial			// initial cin_bit i.e. q = 0
        begin
            d = 0;
        end
    always @(posedge clk)
    begin
		  if(reset == 1)		// reset condition 
				d <= 0;
        else if(count == 0)	// initail start consition
            d <= cin;
        else if(count <= 8)
            d <= cout;
    end
endmodule 