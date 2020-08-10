
module Magic(
	output		     [9:0]		LED,
	input								clk
);


reg [20:0] count1; 
reg flash;
//generates a counter with 20 bits


always @(posedge clk) begin
  flash 	<= count1[20];
  count1    <= count1 + 1;
end
//counts up on the positive edge of the clock cycle, flash goes on after 2^19 counts off after another 2^19 counts
//this cuases flash to be a clock at around 47Hz


integer i=0;
reg [9:0] pin= 10'b0;
assign LED[9:0]= pin[9:0];
reg dir=1;
//defines the LEDs as regs, generates a direction and has an iterator integer.

always @(posedge flash) begin
	if (dir)	begin 
		if (i==9) dir=0;
		else begin 
			pin[i]=0;
			i=i+1;
			pin[i]=1;
			end
		end//counts up the leds turning each on then off in sequence, until it reaches the top led where it changes direction to 0.
	else	begin 
		if (i==0) dir=1;
		else begin 
			pin[i]=0;
			i=i-1;
			pin[i]=1;	
			end
		end//counts down the leds turning each on then off in sequence, until it reaches the bottom led where it changes direction to 1.
	end


endmodule

