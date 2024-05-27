module decod7seg (A, B, C, D, a, b, c, d, e, f, g);
	input A, B, C, D;
	output a, b, c, d, e, f, g;

	assign a = (A | B | C | (~D)) & (A | (~B) | C | D);
	assign b = (A | (~B) | C | (~D)) & (A | (~B) | (~C) | D);
	assign c = (A | B | (~C) | D);
	assign d = (A | (~B) | C | D) & (A | B | C | (~D)) & (A | ~B | (~C) | (~D));
	assign e = (A | (~D)) & (B | C | (~D)) & (A | (~B) | C);
	assign f = (A | B | (~D)) & (A | B | (~C));
	assign g = (A | B | C) & (A | (~B) | (~C) | (~D));
	 
endmodule

//FUNCIONA!!