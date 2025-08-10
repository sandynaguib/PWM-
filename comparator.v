module comparator (duty,Q,comparator_out); 

parameter COUNTER_BITS=8; 
//Ports Declaration
input [COUNTER_BITS:0] duty ; 
input [COUNTER_BITS-1:0] Q ; 
output comparator_out ; 

assign comparator_out = (Q<duty) ? 1'b1 : 1'b0;  

endmodule 