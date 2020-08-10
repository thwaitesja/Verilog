// ECEN2350 
// University of Colorado, Boulder
// Justin Thwaites SID:107552433


module Project1_top(

	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW,
	input 		     [1:0]		KEY,
	input								MAX10_CLK1_50//50MHz
);
reg [1:0] keys=2'b0;

always @(negedge KEY[0]) 
	begin: push
	keys = keys+KEY[1];
	keys[1]= keys[1] & KEY[1];
	keys[0]= keys[0] & KEY[1];
	end
//keys acts as the mode seclection which is incremented for each press of KEY0, and reset if you press KEY0 while holding down KEY1

wire [7:0] comp;
wire [8:0] num;
wire [7:0] log;
wire [9:0] mag;
//generates wires for each of the modules to be instantiated
Magic magic1(mag[9:0], MAX10_CLK1_50);
Comparison comp1(comp[7:0], SW[7:0], SW[9:8]);
Arithmetic math1(num[7:0], num[8], SW[7:0],SW[9:8]);
logical bool1(log[7:0], SW[9:8], SW[7:0]);
//intantiates all of the modules

Multiplexer mult1(HEX0[7:0], HEX1[7:0], LEDR[9:0], SW[9:8], SW[7:0], keys[1:0], num[8:0], log[7:0], comp[7:0], mag[9:0]);
//mode selection and all module data goes into the multiplexer which then outputs 2 seven segment LEDs and 10 leds to the DE10 lite
endmodule
