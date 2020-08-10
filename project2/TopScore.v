//Justin Thwaites
module TopScore(

	output		     [31:0]   	hex,
	input				  [15:0]	 	count,
	input				  				en,
	input				  				reset
);

wire [3:0] point=4'b1000;
reg [15:0] low= 16'hffff;//the low score starts at all 1s so that any score becomes the first low score
reg [15:0] print= 16'h0000;//the actual being printed

always @(posedge en or posedge reset)begin//posedge

if(reset) begin
low=16'hffff;//has the asyncronous reset
print=16'h0000;
end
else begin
if(count[15:0]<low[15:0])begin
low=count;
print=low; 
end//if a score is better than the current low score
if(low==16'hffff)begin
print=16'h0000;
end//if no timing has occured-initial setup

end




end




parameter j=4;//makes this a 4 digit set
generate
	genvar i;
	for (i=0; i<j; i=i+1)
		begin: digit
		BCD_decoder(hex[7+8*i:8*i], print[3+4*i:4*i], point[i]);
		end
		//this loops through 4 times to make a 4 digit set printing the decimal value of print
endgenerate

endmodule