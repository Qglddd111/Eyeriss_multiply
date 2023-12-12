module multiply(a,b,out);
input [3:0]a;
input [3:0]b;
output wire [7:0] out;
assign out=a*b;
endmodule