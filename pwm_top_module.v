module pwm_top_module (clk,rst_n,duty,pwm_out,final_value); 

//Parameters initialization 
parameter COUNTER_BITS=8 ; 
parameter TIMER_BITS=4; 

//Ports declaration 
input clk , rst_n; 
input [COUNTER_BITS:0] duty; 
input [TIMER_BITS-1:0] final_value ; 
output pwm_out ;

//Internal signals 
wire enable; 
wire [COUNTER_BITS-1:0] counter_out ; 
wire comparator_out;

//Modules Instantiation 
timer timer_inst (.clk(clk),.rst_n(rst_n),.final_value(final_value),.done(enable)) ;
up_counter counter_inst (.clk(clk),.rst_n(rst_n),.Q(counter_out),.enable(enable));
comparator comparator_inst (.duty(duty),.Q(counter_out),.comparator_out(comparator_out)); 
D_FF D_FF_inst (.d(comparator_out),.rst_n(rst_n),.clk(clk),.Q(pwm_out)); 

endmodule 


