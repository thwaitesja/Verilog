module Arithmetic(

	output		     [7:0]		numo,
	output		     				carryo,
	input 		     [7:0]		numi,
	input				  [1:0]		sel
);

wire [8:0] addo;
wire [8:0] subo;
wire [8:0] multo;
wire [8:0] divo;
//wires for each sub module

Add addinst(addo[3:0], addo[8], numi[7:4], numi[3:0]);
Sub subinst(subo[3:0], subo[8], numi[7:4], numi[3:0]);
Mult multinst(multo[7:0], multo[8], numi[7:0]);
Div divinst(divo[7:0], divo[8], numi[7:0]);
//instances of all the arithmetic sub modules

assign addo[7:4]=4'b0;
assign subo[7:4]=4'b0;
//add and subtract only use one digit on the DE10 lite, this sets the other to 0 but it will be deactivated in the multiplexer module.

reg carry;
reg [7:0] num;
assign numo=num;
assign carryo=carry;
//makes regs for the outputs of the module

always @(sel[1:0]) 
	begin: switch1
			//This case statement swithches the output of the module based on the values of SW[9:8]
		case (sel[1:0])
			2'b00: begin //add
			 carry=addo[8];
			 num[7:0]=addo[7:0];
			end
			2'b01: begin//subtract
			 carry=subo[8];
			 num[7:0]=subo[7:0];
			end
			2'b10: begin//multiply
			 carry=multo[8];
			 num[7:0]=multo[7:0];
			end
			2'b11: begin//divide
			 carry=divo[8];
			 num[7:0]=divo[7:0];
			end
			//default: begin//unnecessary, just used for testing and error fixing
			 //carry=1'b0;
			//assign numi[7:0]=7'b0;
			 //num[7:4]=4'b0;
		//end
		endcase
	end
endmodule




