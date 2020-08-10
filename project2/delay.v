//Justin Thwaites
module delay(
	output	reg 		go,
	input		[11:0] 	cycles,
	input					enable,
	input					clk
);

reg [11:0] count;

always @(posedge clk) begin
	if(enable)begin//if enabled clock will count down to when it equals zero as a delay of cycles millisecond delay
		if( count==0)
			go=1;//once the delay is over go will become 1
		else
			count=count-1;
		end
	else begin//if not enabled count will become set to the amount of cycles needed to be delayed
		count=cycles;
		go=0;
	end
end



endmodule