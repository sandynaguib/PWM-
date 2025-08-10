module up_counter (clk,rst_n,Q,enable);

parameter COUNTER_BITS=8;

//Ports Declaration 
input clk,rst_n,enable;
output reg [COUNTER_BITS-1:0] Q; 

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n)
		Q<='b0; 
	else if (enable)
		Q<=Q+1;
	else  
		Q<=Q;  
end 

endmodule 