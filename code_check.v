`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:17 02/09/2019 
// Design Name: 
// Module Name:    code_check 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module code_check(
    input       i_clock,
    input [7:0] i_user_code,
    input       i_clear,
    input       i_valid_in,
    output reg  o_lock,
    output reg  o_acess_grant
    );
	 reg       count ;
	 reg       clear ; 
	 reg [7:0] value  ;
/*Implmentation of Comparasion function */	 
always@(posedge i_clock)
   begin 
	     if(i_clear == 1) 
		  begin
		  o_acess_grant <= 0  ;
		  count <= 0 ;
		  end
		  
        if((i_user_code == 8'b01001101)&& i_valid_in && (!o_lock)) 
		  begin
		  o_acess_grant <= 1;
		  clear <= 1 ;
		  count <= 0 ;
		  end
		  else 
		  begin
		  count <= 0 ;
		  o_acess_grant<=0;
		  end
		 
		  if ((i_user_code!=8'b01001101)&& i_valid_in && (!o_lock))
		  begin
		  o_acess_grant <= 0 ; 
		  clear <= 0 ;
		  count <= 1 ;
		  end
   end 

/*implmentation of counter */ 
always@(posedge i_clock ) 
   begin 
	     if ((i_clear)|(clear==1)) 
		  value <= 8'b0 ;
		  else
        if( (count==1) && (!o_lock)) 
        value<= value + 8'b00000001 ; 
    end 
/*implmntation of o_lock*/
always@(*) 
   begin 
		o_lock = (value[2] & (!value[1]) & (!value[0]));
  	end
	  
endmodule
