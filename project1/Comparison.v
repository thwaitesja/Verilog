
module Comparison(
	output		     [7:0]		numo,
	input 		     [7:0]		numi,
	input				  [1:0]		sel
);



reg eq, gr, ls;
//defines Equal to greater than and less than regs
wire [3:0] A;
wire [3:0] B;
assign A[3:0]= numi[7:4];
assign B[3:0]= numi[3:0];
// sets the first half of the input of numi to A and the second half to B

always @(numi) 
	if (A[3:0]==B[3:0])	eq=1'b1;
	else	eq=1'b0;
	//outputs eq=1 if A == B and eq=0 if they are not equal.


always @(numi) 
	if (A[3:0]>B[3:0])	gr=1'b1;
	else	gr=1'b0;	
	//outputs gr=1 if A is greater than B and gr=0 otherwise.

always @(numi) 
	if (A[3:0]<B[3:0])	ls=1'b1;
	else	ls=1'b0;	
	//outputs ls=1 if A is less than B and ls=0 otherwise.
	
wire [3:0] max;
wire A7B;
//sets a max wire and A7B wire for if A > B	
	

assign A7B=(A[3]&~B[3])|((A[3]~^B[3]) & ((A[2]&~B[2])|((A[2]~^B[2]) & ((A[1]&~B[1])|((A[1]~^B[1]) & (A[0]&~B[0]))))));
//uses an assignment statement from a derived truth table to have A7B be 1 if A>B and 0 if A<B
assign max[0]= (A[0] & A7B) + (B[0] & ~A7B);
assign max[1]= (A[1] & A7B) + (B[1] & ~A7B);
assign max[2]= (A[2] & A7B) + (B[2] & ~A7B);
assign max[3]= (A[3] & A7B) + (B[3] & ~A7B);
//assigns each bit to A if A7B==1 or B if A7B==0 
//If A == B it will be assigned to B but it does not matter because both A and B are maxes then. 


reg [7:0] num;
assign numo=num;
//This always block is designed based on SW[9:8] which selects what function of the comparison module will be outputted num[7:0] is 
//what will be outputted to the seven segment display if enabled, num[0] is a binary true false for the comparison functions.
always @(*)
	begin: switch1
		case (sel[1:0])
			2'b00: begin //equal
			 num[7:1]=7'b0;
			 num[0]=eq;
			end
			2'b01: begin//greater
			 num[7:1]=7'b0;
			 num[0]=gr;
			end
			2'b10: begin//less than
			 num[7:1]=7'b0;
			 num[0]=ls;
			end
			2'b11: begin//Max
			 num[7:4]=4'b0;
			 num[3:0]=max[3:0];
			end
			//default: begin//unnecessary, just used for testing and error fixing
				//num[7:0]=7'b0;	
			//end
		endcase
	end
endmodule





	