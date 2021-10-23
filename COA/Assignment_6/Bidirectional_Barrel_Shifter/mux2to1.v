module mux2to1( input[7:0] in1,input [7:0] in0,input sel,output [7:0] out);
assign out=sel?in0:in1;  //output for mux2to1
endmodule
