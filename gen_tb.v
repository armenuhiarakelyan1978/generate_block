`timescale 1ns/1ns
module gen_tb;
reg [7:0]a,b;
reg clk;
wire [8:0]cout;
integer i;
wire [8:0]cout1;
gen #(.op(1)) gen_1(.a(a),.b(b),.clk(clk),.cout(cout));

gen #(.op(0)) gen_0(.a(a),.b(b),.clk(clk),.cout(cout1));

initial
begin
	clk = 0;
	forever #3 clk = ~clk;
end
initial
begin 
        a = 0; b=0;
	#10 b =2; a= 3;
	#10; b = 4; a= 10;
	for (i = 1; i<100; i = i +1)
	begin
            #10; a=i+10; b = i+3;
	end

end
initial
begin
	$dumpfile("gen_tb.vcd");
	$dumpvars();
	#1000 $finish;
end

endmodule
