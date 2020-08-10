//Justin Thwaites
module BCD_counter(
	output			 [31:0]  hex,
	output		    [15:0]	ocount,
	input				 			reset,
	input							mclk
);
reg enclk=0;
reg  [15:0] r;// this is a 16 bit reset
wire [4:0] carry;
wire [3:0] point=4'b1000;
wire [15:0] count;
reg pulse;
assign carry[0]=mclk;
assign ocount=count|r;//makes ocount =count unless reset where it equals all 1s,
//this makes count equal all 0s for each clock cycle that reset is high

always @(reset)
begin
if(reset)
r=16'hffff;
else
r=16'h0000;
end


parameter j=4;//makes this a 4 digit set
generate
	genvar i;
	for (i=0; i<j; i=i+1)
		begin: digit
		BCD(carry[i+1], count[3+4*i:4*i], ocount[3+4*i:4*i], (reset & pulse)|(~reset & carry[i]));
		BCD_decoder(hex[7+8*i:8*i], count[3+4*i:4*i], point[i]);
		end
		//this loops through 4 times to make a 4 digit set
endgenerate

always @(negedge mclk)
    pulse <= reset;
	 //generates a short pulse after reset goes high to allow BCD to output count[15:0] equal to 0


endmodule