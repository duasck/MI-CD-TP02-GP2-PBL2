/*
* comparador
* a = a3 a2 a1 a0
* b = b3 b2 b1 b0
*/
module comparador (a, b, aIGUALb, aMAIORb, aMENORb);

	input [3:0] a, b;

	output aIGUALb, aMAIORb, aMENORb;

	//Declaração
	wire x0, x1, x2, x3;

	//Intermediarias
	assign x3 = ~(a[3] ^ b[3]);
	assign x2 = ~(a[2] ^ b[2]);
	assign x1 = ~(a[1] ^ b[1]);
	assign x0 = ~(a[0] ^ b[0]);


	//saidas

	//quando for igual 
	assign aIGUALb = x3 & x2 & x1 & x0;

	//quando a > b
	assign aMAIORb = a[3] & (~b[3]) | x3 & a[2] & (~b[2]) | x3 & x2 & a[1] & (~b[1]) | x3 & x2 & x1 & a[0] & (~b[0]);

	//quando a < b

	assign aMENORb = (~a[3]) & b[3] | x3 & (~a[2]) & b[2] | x3 & x2 & (~a[1]) & b[1] | x3 & x2 & x1 & (~a[0]) & b[0];


endmodule
