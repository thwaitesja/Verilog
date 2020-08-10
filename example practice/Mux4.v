
// Justin Thwaites
// University of Colorado, Boulder
// 


module Mux4(

	output						send,
	input 		     [3:0]	opts,
	input					[1:0] select
);

assign send=out;
reg out;
 
always @ *
case (select[1:0])
2'b00: 
out = opts[0];
2'b01 :
out = opts[1];
2'b10: 
out = opts[2];
2'b11 :
out =	opts[3];
endcase
endmodule
