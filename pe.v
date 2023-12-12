module pe(clk,rst,left,up,down,right,sum_out);
input clk;
input rst;
input [3:0] left;
input [3:0] up;
output reg [3:0] down;
output reg [3:0] right;
output reg [7:0] sum_out;
wire [7:0] mult_out;
always@(posedge clk)begin
    if(rst) begin
        right<=0;
        down<=0;
        sum_out<=0;
        end
    else begin
        down<=up;
        right<=left;
        sum_out<=sum_out+mult_out;
    end
end
multiply u_mult(
    .a(left),
    .b(up),
    .out(mult_out)
);

endmodule
