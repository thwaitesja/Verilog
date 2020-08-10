module Test();
reg a, b, c, d;
wire f1, f2;

assign f1=a&c|b&c|c&d|a&b|a&d;
assign f2=(a|c)&(a|b|d)&(b|c|d);


initial
begin
	$display($time, "<< Starting The Test>>");
	a= 1'b0;
	b= 1'b0;
	c= 1'b0;
	d= 1'b0;
	#100
	a= 1'b1;
	b= 1'b0;
	c= 1'b0;
	d= 1'b0;
	#100
	a= 1'b0;
	b= 1'b1;
	c= 1'b0;
	d= 1'b0;
	#100
	a= 1'b1;
	b= 1'b1;
	c= 1'b0;
	d= 1'b0;
	#100
	a= 1'b0;
	b= 1'b0;
	c= 1'b1;
	d= 1'b0;
	#100
	a= 1'b1;
	b= 1'b0;
	c= 1'b1;
	d= 1'b0;
	#100
	a= 1'b0;
	b= 1'b1;
	c= 1'b1;
	d= 1'b0;
	#100
	a= 1'b1;
	b= 1'b1;
	c= 1'b1;
	d= 1'b0;
	#100
	a= 1'b0;
	b= 1'b0;
	c= 1'b0;
	d= 1'b1;
	#100
	a= 1'b1;
	b= 1'b0;
	c= 1'b0;
	d= 1'b1;
	#100
	a= 1'b0;
	b= 1'b1;
	c= 1'b0;
	d= 1'b1;
	#100
	a= 1'b1;
	b= 1'b1;
	c= 1'b0;
	d= 1'b1;
	#100
	a= 1'b0;
	b= 1'b0;
	c= 1'b1;
	d= 1'b1;
	#100
	a= 1'b1;
	b= 1'b0;
	c= 1'b1;
	d= 1'b1;
	#100
	a= 1'b0;
	b= 1'b1;
	c= 1'b1;
	d= 1'b1;
	#100
	a= 1'b1;
	b= 1'b1;
	c= 1'b1;
	d= 1'b1;
	#100
	$display($time, "<< Simulation Complete>>");
end
endmodule
	
