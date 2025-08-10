module D_FF (d,rst_n,clk,Q) ; 

//Ports Declaration 
input d,rst_n,clk;
output reg Q;

always @(posedge clk or negedge rst_n) begin 

	if (~rst_n)   
		Q<=1'b0;   
	else 
		Q<=d; 
	 
end 
endmodule 