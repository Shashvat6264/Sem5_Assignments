// Assignment No.: 5
// Problem No.: 1 [LFSR]
// Semester No.: 5
// Group No.: G036
// Group Members: Yashica Patodia(19CS10067) and Shashvat Gupta(19CS30042)
//LFSR
//Mux module 
module mux(in0, in1, sel, out);
input in0, in1, sel;
output out;
assign out = sel ? in1 : in0;
endmodule