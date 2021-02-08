module sum( a,b,
sum,clk);
input [7:0] a,b;
input clk;
output reg [8:0]sum;
reg [7:0]a_r,b_r;

always@(posedge clk)
begin
a_r <= a;
b_r <= b;
sum <= a_r + b_r;
end
endmodule

module sub(a,b,clk,cout);
input [7:0]a,b;
input clk;
output reg  [8:0]  cout;
reg [8:0] a_r, b_r;
always@(posedge clk)
begin
a_r <= a;
b_r <= b;
cout <= a_r - b_r;
end
endmodule

module gen(a,b,cout,clk);
input [7:0] a,b;
input clk;
output reg [8:0]cout;
wire [8:0]cout1;
parameter op = 1;
generate
	if(op)
		sum sum_i(.a(a),.b(b),.clk(clk),.sum(cout1));
	else
		sub sub_i(.a(a),.b(b), .clk(clk),.cout(cout1));
endgenerate

always@(posedge clk)
	cout <=cout1;
endmodule
