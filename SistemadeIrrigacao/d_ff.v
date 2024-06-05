module d_ff (d, rstn, clk, q);  // usando no gatilho
	input d, rstn, clk;
	output reg q;
  
	always @ (posedge clk or negedge rstn)  
		if (!rstn)  
			q <= 0;  
		else  
			q <= d;  
		 
endmodule  