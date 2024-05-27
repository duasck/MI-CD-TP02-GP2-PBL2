module divisor_clk(clk, rstn, out);
	input clk, rstn; 
	output out;
	
	wire 	T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24,
		T0_not, T1_not, T2_not, T3_not, T4_not, T5_not, T6_not, T7_not, T8_not, T9_not, T10_not, T11_not, T12_not, T13_not, T14_not, T15_not, T16_not, T17_not, T18_not, T19_not, T20_not, T21_not, T22_not, T23_not, T24_not;

	// Flip-Flops e inversores para cada estágio
	d_ff d0 ( .d(T0_not), 
		.rstn(rstn),
		.clk(clk),
		.q(T0)
	);
	not (T0_not, T0);

	d_ff d1 ( .d(T1_not), 
		.rstn(rstn),
		.clk(T0),
		.q(T1)
	);
	not (T1_not, T1);

	d_ff d2 ( .d(T2_not), 
		.rstn(rstn),
		.clk(T1),
		.q(T2)
	);
	not (T2_not, T2);

	d_ff d3 ( .d(T3_not), 
		.rstn(rstn),
		.clk(T2),
		.q(T3)
	);
	not (T3_not, T3);

	d_ff d4 ( .d(T4_not), 
		.rstn(rstn),
		.clk(T3),
		.q(T4)
	);
	not (T4_not, T4);

	d_ff d5 ( .d(T5_not), 
		.rstn(rstn),
		.clk(T4),
		.q(T5)
	);
	not (T5_not, T5);

	d_ff d6 ( .d(T6_not), 
		.rstn(rstn),
		.clk(T5),
		.q(T6)
	);
	not (T6_not, T6);

	d_ff d7 ( .d(T7_not), 
		.rstn(rstn),
		.clk(T6),
		.q(T7)
	);
	not (T7_not, T7);

	d_ff d8 ( .d(T8_not), 
		.rstn(rstn),
		.clk(T7),
		.q(T8)
	);
	not (T8_not, T8);

	d_ff d9 ( .d(T9_not), 
		.rstn(rstn),
		.clk(T8),
		.q(T9)
	);
	not (T9_not, T9);

	d_ff d10 ( .d(T10_not), 
		.rstn(rstn),
		.clk(T9),
		.q(T10)
	);
	not (T10_not, T10);

	d_ff d11 ( .d(T11_not), 
		.rstn(rstn),
		.clk(T10),
		.q(T11)
	);
	not (T11_not, T11);

	d_ff d12 ( .d(T12_not), 
		.rstn(rstn),
		.clk(T11),
		.q(T12)
	);
	not (T12_not, T12);

	d_ff d13 ( .d(T13_not), 
		.rstn(rstn),
		.clk(T12),
		.q(T13)
	);
	not (T13_not, T13);

	d_ff d14 ( .d(T14_not), 
		.rstn(rstn),
		.clk(T13),
		.q(T14)
	);
	not (T14_not, T14);

	d_ff d15 ( .d(T15_not), 
		.rstn(rstn),
		.clk(T14),
		.q(T15)
	);
	not (T15_not, T15);

	d_ff d16 ( .d(T16_not), 
		.rstn(rstn),
		.clk(T15),
		.q(T16)
	);
	not (T16_not, T16);

	d_ff d17 ( .d(T17_not), 
		.rstn(rstn),
		.clk(T16),
		.q(T17)
	);
	not (T17_not, T17);

	d_ff d18 ( .d(T18_not), 
		.rstn(rstn),
		.clk(T17),
		.q(T18)
	);
	not (T18_not, T18);

	d_ff d19 ( .d(T19_not), 
		.rstn(rstn),
		.clk(T18),
		.q(T19)
	);
	not (T19_not, T19);

	d_ff d20 ( .d(T20_not), 
		.rstn(rstn),
		.clk(T19),
		.q(T20)
	);
	not (T20_not, T20);

	d_ff d21 ( .d(T21_not), 
		.rstn(rstn),
		.clk(T20),
		.q(T21)
	);
	not (T21_not, T21);

	d_ff d22 ( .d(T22_not), 
		.rstn(rstn),
		.clk(T21),
		.q(T22)
	);
	not (T22_not, T22);

	d_ff d23 ( .d(T23_not), 
		.rstn(rstn),
		.clk(T22),
		.q(T23)
	);
	not (T23_not, T23);

	d_ff d24 ( .d(T24_not), 
		.rstn(rstn),
		.clk(T23),
		.q(T24)
	);
	not (T24_not, T24);

	// A saída final é o clock dividido pela 2^25
	assign out = T24;

endmodule
