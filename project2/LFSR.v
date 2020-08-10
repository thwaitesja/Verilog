//Justin Thwaites
module LFSR(

	output		[11:0]	q,
	input 		  			clk//50mhz

);
//this module starts at all 1s but does not need presetting because it will just randomly change and the time it is sampled is random,
//thus generating randomness for the timing.
reg[11:0] Q=12'hfff;
assign q=Q;
//per clock cycle this shifts all digits up one and then uses an xor combination to generate a pseudorandom Q[0]
always @(posedge clk)
//Q <={Q<<1, Q[5]^(Q[8]^(Q[10]^Q[11]))};//randomly goes through the numbers
Q <= {Q[10],Q[9],Q[8],Q[7],Q[6],Q[5],Q[4],Q[3],Q[2], Q[1], Q[0], Q[5]^(Q[8]^(Q[10]^Q[11]))};
endmodule 

