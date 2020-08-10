// ECEN2350 Project 2 - Spring 2019
// University of Colorado, Boulder
//
// Name: Justin Thwaites
//


//////////////////////////
// Project2_top
//
// Do not remove inputs/ outputs that you don't use. However, any unused
// input/ outputs can remain unconnected in the pin planner.
//
module Project2_top(
	output	[7:0] HEX0,
	output	[7:0] HEX1,
	output	[7:0] HEX2,
	output	[7:0]	HEX3,
	output	[9:0] LEDR,
	input		[9:0] SW,
	input		KEY0,
	input		KEY1,
	input		CLK_50MHZ,
	input  	CLK_10MHZ
);




wire mclk, carry, change, ok;
wire [11:0] rtime;
wire  [15:0] count;
reg  [15:0] countsave;
assign LEDR[9:0]=led[9:0];
reg en=0, reset, read=0;
reg [11:0] timing;

wire [31:0] hex0;
wire [31:0] hex3;
reg [31:0] hex;
assign HEX0=hex [7:0];
assign HEX1=hex [15:8];
assign HEX2=hex [23:16];
assign HEX3=hex [31:24];
//Defines most of the functional wires and regs, hex is a reg to the 7 segement output, switching between the top score
//(hex0) and the BCD counter (hex3)

Clock_divider clock1(mclk, CLK_50MHZ);
delay time1(ok, timing, ~ok&en, mclk);
//timing modules

BCD_counter counter(hex3, count, reset, mclk); 
TopScore score( hex0, countsave, read, FSMreset);
//display modules



LFSR rand(rtime, CLK_50MHZ);
shuffle leds(myled, mclk);
//randomizing modules

reg [9:0] led;//equals myled in waiting state, but stops at a random led  in timing
wire [9:0] myled;//continously changing one hot led
wire flip;
wire [9:0] flop;
and my[9:0](flop, SW, led);//flop only gets a 1 in the array if the switch is high on the one hot led
assign flip=(flop[0]|flop[1]|flop[2]|flop[3]|flop[4]|flop[5]|flop[6]|flop[7]|flop[8]|flop[9]);
//sop of all the SW components with led.



//_____________________________FSM________________________________________________________________________
 parameter RESTING  = 2'b00, WAITING = 2'b01, TIMING = 2'b10, SHOWING = 2'b11 ;
 wire FSMreset;
 reg   [1:0]          state        ;// Seq part of the FSM
 reg   [1:0]          next_state   ;// combo part of FSM
 assign FSMreset=~KEY1;
 reg resetread=0;
 
 
 
 //____________________________KEY0 PULSE________________________________________________________

 //assign LEDR[1:0]=state;//used in degging
 reg start=0, store=0;
 always @ (posedge mclk)
 begin: pulse
	start=store&~KEY0;
	store=KEY0;
 end
 //____________________________DOUBLE ALWAYS BLOCK________________________________________________________
 always @ (state)
 begin : FSM
 
  case(state)
	RESTING: if (start) begin//waits for KEY0 to be pressed
                next_state = WAITING;
               end else begin
                next_state = RESTING;
               end
	WAITING: if (ok) begin//waits for delay module to have the random amount of time pass
                 next_state = TIMING;
					 end else if(SW[9:0]) begin//goes back to RESTING if any switch is high
                 next_state = RESTING;
					 end else if(start) begin//goes back to RESTING if KEY0 is pushed again
                 next_state = RESTING;
                end else begin
                 next_state = WAITING;
               end
					
	TIMING: if (flip) begin//waits for the correct switch to be flipped
                 next_state = SHOWING;
               end else begin
                 next_state = TIMING;
                end
	SHOWING: if (ok) begin//waits for delay module to have the hardcoded amount of time pass
                 next_state = RESTING;
               end else begin
                 next_state = SHOWING;
                end
	default: next_state = RESTING;
	
   endcase
 end

 
 always @ (posedge mclk or posedge FSMreset)
 begin : FSM_iter
    if (FSMreset == 1'b1) begin
      state =    RESTING;
    end else begin
      state =    next_state;

   end
 end

//iterates to the next state after one clock cycle

//_____________________________FUNCTIONAL ALWAYS BLOCK____________________________________________________

always @(mclk)
case(state)
RESTING:begin//highscore
en=0;//timing module not counting down
read=1;//checks if countsave is less than current low score
reset=1;//resets the BCD counter
hex=hex0;//sets 7 segment display equal to the high score
timing=rtime;//keep setting the timing delay to a random time until state switch keeps one random timing delay
led[9:0]=0;//leds low
//locks in the timing value and led after this
end


WAITING:begin
read=0;//turns off highscore checking
reset=1;//ensures the BCD counter is reset
hex=hex3;//sets 7 segment display equal to BCD counter value
en=1;//timing module counting down
led[9:0]=0;//leds low
end


TIMING:begin
if(reset)begin//__________this only happens once per state cycle
reset=0;//allow the BCD counter to function
led= myled;//1 random led hot
end
read=0;//turns off highscore checking
hex=hex3;//sets 7 segment display equal to BCD counter value
en=0;//timing module not counting down
timing=12'h7ff;//hardcoded timing of displaying current score
end


SHOWING:begin
en=1;//timing module counting down
if(~reset)begin//print__________this only happens once per state cycle
countsave=count;//locks in the BCD count for the highscore module in the next state
hex=hex3;//sets 7 segment display equal to BCD counter
reset=1;//ensures the BCD counter is reset
read=0;//turns off highscore checking
led[9:0]=0;//leds low
end
end
endcase

//________________________________________________________________________________________________________


endmodule