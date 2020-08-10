
//Justin  Thwaites 
//modulo 12 up counter
module count(clk, reset, count);
input clk, reset;
output reg[3:0] count;
always @(posedge clk)
begin
if(reset | count ==11) count=4'b0;
else count=count+1;
end
endmodule