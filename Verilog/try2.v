module HalfAdd(a,b,c,s);
	input a,b;
	output c,s;
	
	
	assign s = (~a&b) | (a&~b);
	assign c = a&b;
	
endmodule// Halfadd
	