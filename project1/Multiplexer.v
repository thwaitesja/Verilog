
module Multiplexer(
	output				[7:0] hex0, 
	output				[7:0] hex1,
	output				[9:0] led,
	input					[1:0] sel,
	input					[7:0] numb,
	input					[1:0] key, 
	input					[8:0] nums,
	input					[7:0] logs,
	input					[7:0] comps,
	input					[9:0] magic
);

reg [19:0] out;
assign led[9:0]=out[17:8];
//assigns the LEDs to the top outputs of the selection reg "out"
//out[19:18]=> the decimal points on the seven segment display.
//out[17:8]=> the leds on the DE10 lite board
//out[7:4]=> binary number for the left of the seven segment displays if enabled
//out[3:0]=> binary number for the right of the seven segment displays if enabled

 
always @(*)//(key[1:0]) //based on what mode the push button is on out is assigned to a specific modules data
	begin: switch
		case (key[1:0])
			2'b00: begin //Arithmetic--------------------------------------------------------------
				out[7:0]=nums[7:0];
				out[16]=1'b0;
				out[15:8]=numb[7:0];//this turns on LED[7:0]for better visualization of math operations
				
				case (sel[1:0])//based on what operation is occuring this selects where the carry is displayed
								2'b10: begin//mult
								 out[18:17]=2'b0;
								 out[19]=nums[8];
								end
								2'b11: begin//div
								 out[19]=1'b0;
								 out[17]=1'b0;
								 out[18]=nums[8];
								end
								default: begin//add/sub
								out[19:18]=2'b0;
								out[17]=nums[8];
								end
							endcase	
			end
			2'b01: begin//Logic -------------------------------------------------------------------
				out[7:0]=8'b0;//nulls the seven segmant display
				out[19:16]=4'b0;//nulls the carry lights
				out[15:8]=logs[7:0];
				

					end
			2'b10: begin//compare----------------------------------------------------------------
				out[7:0]=comps[7:0];//sets the seven segment display equal to the compare data for the max
				out[19:18]=2'b0;
				out[16]=1'b0;
				out[15:8]=numb[7:0];//sets the leds to the corresponding switch for easier visualization of comparing
				case (sel[1:0])
								2'b11: begin//Max
								out[17]=1'b0;
								end
								default: begin//have the output on LED[9]
								out[17]=comps[0];
								end
							endcase	
			end
			2'b11: begin//magic
				out[7:0]=8'b0;//nulls the seven segment display
				out[17:8]=magic[9:0];//has the leds light up coresponding to the clock data
				out[19:18]=2'b0;
			end
			//default: begin//just for testing errors
			 //out=20'b0;
			//assign numi[7:0]=7'b0;
			//end
		endcase
	end
wire [15:0] hexi;
SevenSegment light1(hexi[7:0], out[3:0], out[18]);
SevenSegment light2(hexi[15:8], out[7:4], out[19]);	
//compute the 4 bit binary conversion to data for the seven segment leds, stored in hexi[15:0]
	
reg [15:0] hexo;
assign hex0[7:0]=hexo[7:0];
assign hex1[7:0]=hexo[15:8];
//sets up a reg hexo and assigns it to hex1 and hex0	
	
	
	always @(*) 
	begin: sevs
			//turns off the seven segment leds if they are not needed for a mode
		case (key[1:0])
			2'b00: begin //Arithmetic--------------------------------------------------------------
						case (sel[1])
								1'b0: begin//add/sub-turns of the left seven segment led
								 hexo[15:8]=8'hFF;
								 hexo[7:0]=hexi[7:0];
								end
								1'b1: begin//mult/div
								 hexo[15:0]=hexi[15:0];
								end
							endcase		
			end
			2'b01: begin//Logic -------------------------------------------------------------------
					 hexo[15:0]=16'hFFFF;//turns off both seven segment leds
					end
			2'b10: begin//compare----------------------------------------------------------------
					 case (sel[1:0])
								2'b11: begin//Max
								hexo[15:8]=8'hFF;
								hexo[7:0]=hexi[7:0];//turns of left seven segment led if in Max mode
								end
								default: begin
								hexo[15:0]=16'hFFFF;//turns off both seven segment leds if not Max mode
								end
							endcase	
			end
			2'b11: begin//magic
					 hexo[15:0]=16'hFFFF;//turns off both seven segment leds
			end
			//default: begin //used for testing but no longer nessesary
			// out=18'b0;
			//assign numi[7:0]=7'b0;
			//end
		endcase
	end
	
endmodule