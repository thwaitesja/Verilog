//Justin Thwaites
module shuffle(

	output			[9:0]	q,
	input 		  			clk
	);
	
reg [9:0]  Q=10'b0000000001;
assign q=Q;
//always at the clock cycle q will move one to the left, so it will be at a pseudorandom place 
//because the button won't be pressed to the same milisecond every time.
always@(posedge clk)
	Q <= {Q[8],Q[7],Q[6],Q[5],Q[4],Q[3],Q[2], Q[1], Q[0], Q[9]};
endmodule