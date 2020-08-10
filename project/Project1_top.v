// ECEN2350 Intro to Verilog
// 7/15/2018, Michael Deeds
// University of Colorado, Boulder
// 



module Project1_top(

	//output		     [7:0]		HEX0,
	//output		     [7:0]		HEX1,
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW
);
wire [7:0] sev0;
wire [4:0] num;
wire [7:0] sev1;
assign LEDR[9:8] = 2'b00;
//assign LEDR[7:0] = sev0[7:0];
//assign num[4:0]=SW[4:0];
//assign HEX0[7:0]=sev0[7:0];	
//assign HEX1[7:0]=sev1[7:0];		


//SevenSegment(sev0[7:0], num[3:0], num[4]);
//SevenSegment(sev1[7:0], num[3:0], num[4]);
endmodule
