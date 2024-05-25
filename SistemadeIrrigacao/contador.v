//contador4bits.v


module contador (clk, c);
	input clk;
	output [3:0] c;
	
	always @(posedge clk) begin
		//a, b, cin, s, cout
		//c = somador4b(.a(c), .b(s), .cin(0), s, cout);
		//a, b, aIGUALb, aMAIORb, aMENORb
		//comparador(.a(cout), .b(1), aIGUALb, aMAIORb, aMENORb);
	end
	
endmodule
