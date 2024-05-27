module divisor_clk390(clk, rstn, out);
	input clk, rstn; 
	output out;
	
	wire 	T0, T1, T2, T3, T4, T5, T6, T7, T8,
		T0_not, T1_not, T2_not, T3_not, T4_not, T5_not, T6_not, T7_not, T8_not;

	d_ff d0 ( .d(T0_not), // SAIDA 25MHZ
		.rstn(rstn),
		.clk(clk),
		.q(T0)
	);
	
	not (T0_not, T0);
	
	d_ff d1 ( .d(T1_not), //SAIDA 12,5MHZ
		.rstn(rstn),
		.clk(T0),
		.q(T1)
	);
	
	not (T1_not, T1);
	
	d_ff d2 ( .d(T2_not), //SAIDA 6,25MHZ
		.rstn(rstn),
		.clk(T1),
		.q(T2)
	);
	
	not (T2_not, T2);
	
	d_ff d3 ( .d(T3_not), //SAIDA 3,125MHZ
		.rstn(rstn),
		.clk(T2),
		.q(T3)
	);
	
	not (T3_not, T3);
	
	d_ff d4 ( .d(T4_not), //SAIDA 1,5625MHZ
		.rstn(rstn),
		.clk(T3),
		.q(T4)
	);
	
	not (T4_not, T4);
	
	d_ff d5 ( .d(T5_not), //SAIDA 781,25KHZ
		.rstn(rstn),
		.clk(T4),
		.q(T5)
	);
	
	not (T5_not, T5);
	
	d_ff d6 ( .d(T6_not), //SAIDA 390,625KHZ
		.rstn(rstn),
		.clk(T5),
		.q(T6)
	);
	
	not (T6_not, T6);
	
	d_ff d7 ( .d(T7_not), //SAIDA 195,3125KHZ
		.rstn(rstn),
		.clk(T6),
		.q(T7)
	);
	
	not (T7_not, T7);
	
	d_ff d8 ( .d(T8_not), //SAIDA 97,65625KHZ
		.rstn(rstn),
		.clk(T7),
		.q(T8)
	);
	
	not (T8_not, T8);
	

	wire out = T8;


endmodule 