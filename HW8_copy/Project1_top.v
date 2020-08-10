// ECEN2350 
// University of Colorado, Boulder
// Justin Thwaites SID:107552433


module Project1_top(

	output		     [7:0]		HEX0,
	output		     [9:0]		LEDR,
	input								MAX10_CLK1_50//50MHz
);

reg [27:0] count1=0; 
reg flash1=0;
reg flash05=0;
//generates a counter with 24 bits
//generates the two clock signals


always @(posedge MAX10_CLK1_50) begin
	/*if(count1==28'h17D7840) begin
	//count1=28'h0000000;
	flash1= !flash1;
	end*/
	flash1=count1[24];
	count1 = count1 + 1;
end
//counts up on the positive edge of the clock cycle, counts to 25 million which 
//then it resets, and inverts flash, causing flash to be 1 hz
always @(posedge flash1) begin
	flash05= ~flash05;
end

assign LEDR[9:2]= 8'b0;
assign LEDR[1]= flash1;
assign LEDR[0]= flash05;

reg [3:0] disp=4'b0;

always @(posedge flash1) begin
	if(disp==4'b1010) disp=4'b0;
	else disp=disp+1;
end

SevenSegment(HEX0[7:0], disp[3:0], 0);
//set the seven segment display
endmodule
