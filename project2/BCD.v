//Justin Thwaites
module BCD(
output		     					carry,
output 		     		[3:0]		obinary,//output binary
input 		     		[3:0]		ibinary,//input binary
input 		     					clk
);

reg[3:0]	bin=0;
reg c=0;
assign obinary[3:0]=bin[3:0];
assign carry=c;


always @(posedge clk) begin
	c=0;
	if(ibinary == 4'b1111) begin
		c=1;//this state only occurs as a held reset for the BCD, where it will automatically go back to 0 
		//at the next clock cycle, this state also ensures all digits will go to 0
	end
	//go up one count every clock cycle
	bin=ibinary+1;
	if(ibinary == 4'b1001) begin
		bin<=0;//if the input digit is at 9, the next BCD module is triggered by c and this module is back at 0
		c=1;
	end 
end



endmodule