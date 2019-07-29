`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:53:07 02/10/2019
// Design Name:   code_check
// Module Name:   D:/Assignment2/stimulate.v
// Project Name:  Assignment2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: code_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stimulate;

	// Inputs
	reg i_clock;
	reg [7:0] i_user_code;
	reg i_clear;
	reg i_valid_in;

	// Outputs
	wire o_lock;
	wire o_acess_grant;

	// Instantiate the Unit Under Test (UUT)
	code_check uut (
		.i_clock(i_clock), 
		.i_user_code(i_user_code), 
		.i_clear(i_clear), 
		.i_valid_in(i_valid_in), 
		.o_lock(o_lock), 
		.o_acess_grant(o_acess_grant)
	);

	initial begin
		i_clock = 1 ; 
		#10 
		i_clear = 1 ; 
		#40 
		i_clock = 0 ; 
		#50  
		i_clock = 1 ;
      #10 
      i_clear= 0 ; 
      #40 
      i_clock=0 ; 
		#50 
		i_clock= 1 ; 
		#10
		i_valid_in = 1; 
      i_user_code = 8'b01001101 ; /*valid input */ 
      #40 
      i_clock = 0 ; 
      #50 
      i_clock =1;
      #10 
      i_valid_in = 1 ;
      i_user_code =  8'b01000101 ;/*1st wrong input */
      #40 
      i_clock = 0 ;
      #50 
      i_clock = 1 ;
      #10
		i_valid_in = 1; 
      i_user_code = 8'b01000101 ;/*2nd wrong input */ 
		#40 
      i_clock = 0 ; 
      #50 
      i_clock =1;
      #10 
      i_valid_in = 1 ;
      i_user_code =  8'b01001101 ;/*valid input*/  
      #40 
      i_clock = 0 ;
      #50 
      i_clock = 1 ;
      #10
		i_valid_in = 1; 
      i_user_code = 8'b01000101 ; /*1st wrong input */
		#40 
      i_clock = 0 ; 
      #50 
      i_clock =1;
      #10 
      i_valid_in = 1 ;
      i_user_code = 8'b01000101 ;/*2nd wrong input*/
      #40 
      i_clock = 0 ;
      #50 
      i_clock = 1 ;
      #10
		i_valid_in = 1; 
      i_user_code = 8'b01000101; /*3rd wrong input */
		#40 
      i_clock = 0 ; 
      #50 
      i_clock =1;
      #10 
      i_valid_in = 1 ;
      i_user_code =  8'b01000101;/*4th wrong input*/
      #40 
      i_clock = 0 ;
      #50 
      i_clock = 1 ;
	   #50 
		i_clock = 0 ;
		#50
		i_clock=1; 
		#20 
		i_valid_in = 1  ;
      i_user_code = 8'b01001101 ;		
      #30 
      i_clock = 0	;
      #50 
      i_clock = 1; 
      #50 
      i_clock = 0 ;
		#50
		i_clock = 1 ;
		i_valid_in = 0 ; 
		#10 
		i_clear = 1 ;
		#40
		i_clock = 0 ; 
		#50
		i_clock = 1 ; 
		#30
		i_clear = 0 ;
		#20
		i_clock=0 ;
		#50
		i_clock = 1 ; 
      #10 
      i_valid_in = 1	;
		i_user_code = 8'b01001101 ;
		#40
		i_clock = 0 ;  
		#50
		i_clock = 1 ; 
		#50
		i_clock =0 ;	

	end
      
endmodule

