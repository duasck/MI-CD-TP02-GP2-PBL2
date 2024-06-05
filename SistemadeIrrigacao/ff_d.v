module ff_d(clk,Q);  //usando no divisor k
	input clk; // clock input 
	output reg Q; // output Q 
	always @(posedge clk) 
	begin
	 Q <= !Q; 
	end 
endmodule
