module pwm_tb (); 

parameter COUNTER_BITS=8; 
parameter TIMER_BITS=4; 

//Signals Declaration 
reg clk_tb, rst_n_tb ;
reg [COUNTER_BITS:0] duty_tb ; 
reg [TIMER_BITS-1:0] final_value_tb ; 
wire pwm_out_tb; 


//DUT Instantiation 
pwm_top_module DUT (.clk(clk_tb),.rst_n(rst_n_tb),.duty(duty_tb),.pwm_out(pwm_out_tb),.final_value(final_value_tb)); 

//Clock generation 
initial begin 
	clk_tb=1'b0; 
	forever 
	#2 clk_tb=~clk_tb; //Period is 4 ns 
end 

integer pwm_period ; 
//Test Stimulus generation 
initial begin 
//------Test 1 : Reset Functionality-----//
	rst_n_tb=1'b0;
	@(negedge clk_tb);
	rst_n_tb=1'b1; 
	final_value_tb='d1;
	pwm_period = (1 << COUNTER_BITS) * (final_value_tb + 1); 
//------Test 2 : Quarter duty cycle-----//
	duty_tb='d64; 
	repeat (2*pwm_period) @(negedge clk_tb) ; 
//------Test 3 : Half duty cycle-----//
	duty_tb='d128; 
	repeat (2*pwm_period) @(negedge clk_tb) ; 
//------Test 3 : 75% duty cycle-----//
	duty_tb='d192; 
	repeat (2*pwm_period) @(negedge clk_tb) ; 
//------Test 4 : 100% duty cycle-----//
	duty_tb='d256; 
	repeat (2*pwm_period) @(negedge clk_tb) ; 
//------Test 5 : 0% duty cycle-----//
	duty_tb='d0; 
	repeat (2*pwm_period) @(negedge clk_tb) ; 
	$stop; 
end 

endmodule 