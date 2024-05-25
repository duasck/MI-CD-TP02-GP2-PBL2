module jk_ff (clk, j, k, q);
	input clk, j, k;
	output q;
	
	wire fio1, fio2, qbar;

	nand n1j (fio1, j, clk, qbar);
	nand n2k (fio2, k, clk, q);
	nand n3 (q, qbar, fio1);
	nand n4 (qbar, q, fio2);
	
endmodule
