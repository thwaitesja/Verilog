// ECEN2350 Intro to Verilog
// 7/15/2018, Michael Deeds
// University of Colorado, Boulder
// 


module DE10_LITE_Golden_Top(

/*
	
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,
*/
	output		     [7:0]		HEX0,
	//output		     [9:0]		LEDR,
	input 		     [9:0]		SW
);

assign HEX0[7]=SW[7];
assign HEX0[6]=SW[6];
assign HEX0[5]=SW[5];
assign HEX0[4]=SW[4];
assign HEX0[3]=SW[3];
assign HEX0[2]=SW[2];
assign HEX0[1]=SW[1];
assign HEX0[0]=SW[0];
wire a[9:0];
reg f;			// We must use the 'reg' data type for always statements, 
					// even when defining combinational logic.
/*
assign a[0]= SW[0];
assign a[1] = SW[1];
assign LEDR[0] = f;
assign LEDR[9:1] = 9'h0;		// set all unused LED outputs to 0 (off)

always @ (a) 	
begin
	if (a[0] == 1 && a[1] == 0)
		 f = 1;
	else if (a[0] == 0 && a[1] == 1)
		 f = 1;
	else
		 f = 0;
end
*/
endmodule
