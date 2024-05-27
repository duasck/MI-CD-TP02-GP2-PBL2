module shif (clk, d, s0, s1, s2, s3);

	input clk, d;
	output s0, s1, s2, s3;
	
	
	dff_sync ff0 (.clk(clk),.reset(1), .d(d), .q(s0));
	dff_sync ff1 (.clk(clk),.reset(1), .d(s0), .q(s1));
	dff_sync ff2 (.clk(clk),.reset(1), .d(s1), .q(s2));
	dff_sync ff3 (.clk(clk),.reset(1), .d(s2), .q(s3));
	
endmodule
