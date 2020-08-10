module Div(
	output		     [7:0]		sum,
	output		     				carry,
	input 		     [7:0]		val0

);

assign {sum[7:0],carry}= {val0[7:0],1'b0} >> 1;//uses the shift operator to divide by 2
endmodule
