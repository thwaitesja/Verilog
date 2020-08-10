//Justin Thwaites
//50MHz to 1kHz
module Clock_divider(

	output		  	   			clk1kHz,
	input								clk50MHz
);
parameter clkdivide= 50000;//how much you want to divide the clock
reg flash; 
reg [30:0] count=0;


assign clk1kHz= flash;


always @(posedge clk50MHz) begin
	if(count<<1==clkdivide) begin//shifted to be half the parameter so that the flash signal can go high then low taking 2 inversions.
	count=31'b0;
	flash= ~flash;
	end
	else count = count + 1;
end



endmodule