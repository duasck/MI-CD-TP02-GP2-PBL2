module ffd (clk,reset,d,q); // assíncrono

	input clk,reset,d;
	output q;
	reg q;

	always @ (posedge clk or negedge reset) begin
	
		if(~reset) // reseta com 0
			q <= 0;
			
		else
			q <= d;
			
	end
			 
endmodule
