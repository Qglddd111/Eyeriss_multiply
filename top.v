module top(clk,rst,en,in1,in2,out);
input clk;
input rst;
input en;
input [4*9-1:0] in1;
input [4*9-1:0] in2;
output reg [9*9-1:0] out;
reg [3:0] hang1 [0:4];
reg [3:0] hang2 [0:4];
reg [3:0] hang3 [0:4];
reg [3:0] lie1 [0:4];
reg [3:0] lie2 [0:4];
reg [3:0] lie3 [0:4];
reg [3:0] flag;
wire [3:0] down00,down01,down02,down10,down11,down12,down20,down21,down22;
wire [3:0] right00,right01,right02,right10,right11,right12,right20,right21,right22;
wire [7:0] sum00,sum01,sum02,sum10,sum11,sum12,sum20,sum21,sum22;
reg [3:0] left00;
reg [3:0] left10;
reg [3:0] left20;
reg [3:0] up00;
reg [3:0] up01;
reg [3:0] up02;
always@(posedge clk)begin
    if(rst)begin
        out<=0;
    end
    else begin
        hang1[0]<=in1[3-:4];
        hang1[1]<=in1[7-:4];
        hang1[2]<=in1[11-:4];
        hang1[3]<=4'b0000;
        hang1[4]<=4'b0000;
        hang2[0]<=4'b0000;
        hang2[1]<=in1[15-:4];
        hang2[2]<=in1[19-:4];
        hang2[3]<=in1[23-:4];
        hang2[4]<=4'b0000;
        hang3[0]<=4'b0000;
        hang3[1]<=4'b0000;
        hang3[2]<=in1[27-:4];
        hang3[3]<=in1[31-:4];
        hang3[4]<=in1[35-:4];
        lie1[0]<=in2[3-:4];
        lie1[1]<=in2[15-:4];
        lie1[2]<=in2[27-:4];
        lie1[3]<=4'b0000;
        lie1[4]<=4'b0000;
        lie2[0]<=4'b0000;
        lie2[1]<=in2[7-:4];
        lie2[2]<=in2[19-:4];
        lie2[3]<=in2[31-:4];
        lie2[4]<=4'b0000;
        lie3[0]<=4'b0000;
        lie3[1]<=4'b0000;
        lie3[2]<=in2[11-:4];
        lie3[3]<=in2[23-:4];
        lie3[4]<=in2[35-:4];
    end
end
always@(posedge clk)
    if(rst)begin
        flag<=0;
        end
    else if(en) begin
        //if(flag==4'd5)
            //flag<=0;
            //else
            flag<=flag+1;
    end
always@(posedge clk)begin
    case(flag)
        0 : begin
            left00<=hang1[0];
            left10<=hang2[0];
            left20<=hang3[0];
            up00<=lie1[0];
            up01<=lie2[0];
            up02<=lie3[0];
            end
        1 : begin
            left00<=hang1[1];
            left10<=hang2[1];
            left20<=hang3[1];
            up00<=lie1[1];
            up01<=lie2[1];
            up02<=lie3[1];
            end
        2 : begin
            left00<=hang1[2];
            left10<=hang2[2];
            left20<=hang3[2];
            up00<=lie1[2];
            up01<=lie2[2];
            up02<=lie3[2];
            end
        3 : begin
            left00<=hang1[3];
            left10<=hang2[3];
            left20<=hang3[3];
            up00<=lie1[3];
            up01<=lie2[3];
            up02<=lie3[3];
            end
        4 : begin
            left00<=hang1[4];
            left10<=hang2[4];
            left20<=hang3[4];
            up00<=lie1[4];
            up01<=lie2[4];
            up02<=lie3[4];
            end
        default : begin
            left00<=0;
            left10<=0;
            left20<=0;
            up00<=0;
            up01<=0;
            up02<=0;
            end
    endcase
    
    end
    
pe pe00(
    .clk(clk),.rst(rst),.left(left00),.up(up00),.down(down00),.right(right00),.sum_out(sum00)
);
pe pe01(
    .clk(clk),.rst(rst),.left(right00),.up(up01),.down(down01),.right(right01),.sum_out(sum01)
);
pe pe02(
    .clk(clk),.rst(rst),.left(right01),.up(up02),.down(down02),.right(right02),.sum_out(sum02)
);
pe pe10(
    .clk(clk),.rst(rst),.left(left10),.up(down00),.down(down10),.right(right10),.sum_out(sum10)
);
pe pe11(
    .clk(clk),.rst(rst),.left(right10),.up(down01),.down(down11),.right(right11),.sum_out(sum11)
);
pe pe12(
    .clk(clk),.rst(rst),.left(right11),.up(down02),.down(down12),.right(right12),.sum_out(sum12)
);
pe pe20(
    .clk(clk),.rst(rst),.left(left20),.up(down10),.down(down20),.right(right20),.sum_out(sum20)
);
pe pe21(
    .clk(clk),.rst(rst),.left(right20),.up(down11),.down(down21),.right(right21),.sum_out(sum21)
);
pe pe22(
    .clk(clk),.rst(rst),.left(right21),.up(down12),.down(down22),.right(right22),.sum_out(sum22)
);

endmodule