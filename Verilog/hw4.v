module Hw4(f1,f2,a,b,c,d);
	input a,b,c,d;
	output f1, f2;
	assign f1=a&c|b&c|c&d|a&b|a&d;
	assign f2=(a|c)&(a|b|d)&(b|c|d);


endmodule