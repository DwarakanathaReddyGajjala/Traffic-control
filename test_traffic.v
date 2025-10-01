`include"trafficcontroller.v"
module test_traffic;
reg clk,x,start;
wire [2:0] highway,country;
traffic a0(x,clk,highway,country,start);
always
#5 clk=~clk;
initial
begin
clk=0;start=0;
#2 start=1;#10 x=1;#70 x=0;
end
initial
begin
$monitor("highway=%b,country=%b",highway,country);
#500 $finish;
end

endmodule
