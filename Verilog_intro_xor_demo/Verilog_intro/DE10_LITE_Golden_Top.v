// ECEN2350 Intro to Verilog
// 7/15/2018, Michael Deeds
// University of Colorado, Boulder
// 


module DE10_LITE_Golden_Top(

/*
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,
*/
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW
);

wire a,b;
reg f;			// We must use the 'reg' data type for always statements, 
					// even when defining combinational logic.

assign a = SW[0];
assign b = SW[1];
assign LEDR[0] = f;
assign LEDR[9:1] = 9'h0;		// set all unused LED outputs to 0 (off)

always @ (a or b) 	
begin
	if (a == 1 && b == 0)
		 f = 1;
	else if (a == 0 && b == 1)
		 f = 1;
	else
		 f = 0;
end

endmodule
