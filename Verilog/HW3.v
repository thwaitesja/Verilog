/*
HW3 Justin Thwaites
Verilog code to implement the product 
of sums in a module using an assign statement
*/
module Product_of_sums(a,b,c,f);
	input a,b,c;
	output f;
	
	assign f = (c | a) & ((~c)|(~a)|b);

	
endmodule// Product_of_sums
	