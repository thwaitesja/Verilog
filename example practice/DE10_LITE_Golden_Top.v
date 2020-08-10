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
	//output		     [7:0]		HEX0,
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW
);

Mux4(LEDR[0], SW[5:2], SW[1:0]);
endmodule
/*
assign LEDR[0]=out;
reg out;
 
always @ *
case (SW[1:0])
2'b00: 
out = SW[2];
2'b01 :
out = SW[3];
2'b10: 
out = SW[4];
2'b11 :
out = SW[5];
endcase
endmodule

assign LEDR[7]=SW[7];
assign LEDR[6]=SW[6];
assign LEDR[5]=SW[5];
assign LEDR[4]=SW[4];
assign LEDR[3]=SW[3];
assign LEDR[2]=SW[2];
assign LEDR[1]=SW[1];
assign LEDR[0]=SW[0];
assign HEX0[7]=~SW[7];

begin
	case(SW[1:0])
		2'b00 : f[1] <=1;
		2'b01 : f[1] <=1;
		2'b10 : f[1] <=1;
		2'b11 : f[1] <=1;
		default : f=7'b0;
	endcase
end
reg f[6:0];	
assign HEX0[6]=f[6];
assign HEX0[5]=f[5];
assign HEX0[4]=f[4];
assign HEX0[3]=f[3];
assign HEX0[2]=f[2];
assign HEX0[1]=f[1];
assign HEX0[0]=f[0];		
endmodule
*/