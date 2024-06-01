
module contador_bcd ( //0 a 9
    input clk,
    input reset,
    output [3:0] bcd,
	 output carry
);

    // Interconexiones de JK flip-flops para formar un contador BCD
    wire q0, q1, q2, q3;
    wire qn0, qn1, qn2, qn3;
	 wire reset_count = reset | (q3 & q1);


   // Instanciación de flip-flops JK
    jk_flipflop ff0 (1, 1, clk, reset_count, q0, qn0);
    jk_flipflop ff1 (q0, q0, clk, reset_count, q1, qn1);
    jk_flipflop ff2 (q1 & q0, q1 & q0, clk, reset_count, q2, qn2);
    jk_flipflop ff3 (q2 & q1 & q0, q2 & q1 & q0, clk, reset_count, q3, qn3);

	 assign carry = q3 & q0;
    assign bcd = {q3, q2, q1, q0};

endmodule

