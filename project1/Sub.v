module Sub(
	output		     [3:0]		sum,
	output		     				carry,
	input 		     [3:0]		val0,
	input				  [3:0]		val1
);


wire  [4:0] send;
assign send[0]=0;
parameter j=4;//links 4 bits
assign carry=send[4];
//sets up the output parameters
generate
	genvar i;
	for (i=0; i<j; i=i+1)
		begin: subit//has the contents of one full subtractor
			reg   Wire1;
			reg   Wire2;
			reg   Wire3;
			 and(wire3, ~val0[i], val1[i]);
			 and(wire2, ~wire1, send[i]);
			 xor(wire1,val0[i] , val1[i]);
			 xor(sum[i], wire1 ,send[i]);
			 or(send[i+1], wire2, wire3);
		end
		//the for loop links four full subtractors together to make a 4 bit subtractor
endgenerate

endmodule
