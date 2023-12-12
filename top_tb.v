`timescale 1ns / 1ps
module top_tb();
reg clk;
reg rst;
reg en;
reg [4*9-1:0] in1;
reg [4*9-1:0] in2;
wire [9*9-1:0] out;
initial begin
    clk=0;
    rst=0;
    in1=0;
    in2=0;
    en=0;
    #10
    rst=1;
    #10
    rst=0;
    in1=36'b0101_0010_0011_0011_0101_0010_0010_0100_0011;
    in2=36'b0101_0010_0011_0011_0101_0010_0010_0100_0011;
    #10
    en=1;
    #100
    $finish;
    
    end
always
    #5
    clk=~clk;
top u_top(
    .clk(clk),
    .rst(rst),
    .in1(in1),
    .in2(in2),
    .out(out),
    .en(en)
    );

endmodule