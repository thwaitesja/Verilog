module logical(

	output		     [7:0]		out,
	input		     		[1:0]		sel,
	input 		     [7:0]		sendi
);

wire [3:0] x;
wire [3:0] y;

assign x=sendi[7:4];
assign y=sendi[3:0];
//makes wires x and y, assigning x to the first 4 inputs and y to the second 4 inputs

wire [7:0] sel1;
wire [7:0] sel2;

assign sel1[0]=sel[0];
assign sel1[1]=sel[0];
assign sel1[2]=sel[0];
assign sel1[3]=sel[0];
assign sel1[4]=sel[0];
assign sel1[5]=sel[0];
assign sel1[6]=sel[0];
assign sel1[7]=sel[0];

assign sel2[0]=sel[1];
assign sel2[1]=sel[1];
assign sel2[2]=sel[1];
assign sel2[3]=sel[1];
assign sel2[4]=sel[1];
assign sel2[5]=sel[1];
assign sel2[6]=sel[1];
assign sel2[7]=sel[1];
//makes selecting wires each 8 bits long
wire [3:0] an;
wire [3:0] o;
wire [3:0] xo;
wire [7:0] zn;
wire [7:0] za;
wire [7:0] zo;
wire [7:0] zx;
wire [7:0] sn;
wire [7:0] sa;
wire [7:0] so;
wire [7:0] sx;
//makes intermediatate wires

assign za[7:4]=4'b0;
assign zo[7:4]=4'b0;
assign zx[7:4]=4'b0;

and a [3:0](an, x, y);
or b [3:0](o, x, y);
xor c [3:0](xo, x, y);
assign za[3:0]=an[3:0];
assign zo[3:0]=o[3:0];
assign zx[3:0]=xo[3:0];
assign zn= ~sendi;
//computes each function assigns the zn, za, zo, zx to negating the x|y, anding x y, oring x y, or xoring x y respectivly.

and a1 [7:0](sa, za, ~sel1, ~sel2);
and b1 [7:0](so, zo, sel1, ~sel2);
and c1 [7:0](sx, zx, ~sel1, sel2);
and d1 [7:0](sn, zn, sel1, sel2);
or o2 [7:0](out, sn, sx, so, sa);

//acts as a 4 option multiplexer only allowing the output if it is selected

	endmodule
	
	
								