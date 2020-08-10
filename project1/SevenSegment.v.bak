// ECEN2350 
// Jusin Thwaites


module SevenSegment(


	output		     [7:0]		hex,
	input 		     [3:0]		bin,
	input 		     				point
);
reg [6:0] led;
assign hex[6:0]=led[6:0];
assign hex[7] = ~point;

always @ (bin[3:0]) begin
case(bin[3:0])
4'b0000:begin
led[0]=0;
led[1]=0;
led[2]=0;
led[3]=0;
led[4]=0;
led[5]=0;
led[6]=1;
end
4'b0001:begin
led[0]=1;
led[1]=0;
led[2]=0;
led[3]=1;
led[4]=1;
led[5]=1;
led[6]=1;
end
4'b0010:begin
led[0]=0;
led[1]=0;
led[2]=1;
led[3]=0;
led[4]=0;
led[5]=1;
led[6]=0;
end
4'b0011:begin
led[0]=0;
led[1]=0;
led[2]=0;
led[3]=0;
led[4]=1;
led[5]=1;
led[6]=0;
end
4'b0100:begin
led[0]=1;
led[1]=0;
led[2]=0;
led[3]=1;
led[4]=1;
led[5]=0;
led[6]=0;
end
4'b0101:begin
led[0]=1;
led[1]=0;
led[2]=0;
led[3]=1;
led[4]=1;
led[5]=1;
led[6]=1;
end
4'b0110:begin
led[0]=0;
led[1]=0;
led[2]=1;
led[3]=0;
led[4]=0;
led[5]=1;
led[6]=0;
end
4'b0111:begin
led[0]=0;
led[1]=0;
led[2]=0;
led[3]=0;
led[4]=1;
led[5]=1;
led[6]=0;
end
default:begin
led[0]=0;
led[1]=0;
led[2]=0;
led[3]=0;
led[4]=0;
led[5]=0;
led[6]=0;
end
endcase
end
endmodule
