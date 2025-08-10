module timer (clk,rst_n,final_value,done) ;

parameter TIMER_BITS=4;
//Ports Declaration 
input clk , rst_n ; 
input [TIMER_BITS-1:0] final_value; 
output reg done ; 

reg [TIMER_BITS-1:0] Q ; 


always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin  
		Q<=0; 
		done<=1'b0;
	end 
	else begin 
		if(Q==final_value) begin 
			done<=1'b1;
			Q<=0; 
		end 
		else begin 
			Q<=Q+1; 
			done<=1'b0; 
		end
	end 

end 

endmodule 
