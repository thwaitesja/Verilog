module Mult(
	output		     [7:0]		sum,
	output		     				carry,
	input 		     [7:0]		val0

);

assign {carry, sum[7:0]}= {1'b0,val0[7:0]} << 1;//uses the shift operator to multiply by 2
endmodule

