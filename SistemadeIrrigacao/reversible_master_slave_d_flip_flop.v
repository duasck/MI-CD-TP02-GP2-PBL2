module reversible_master_slave_d_flip_flop (
    input wire C,
    input wire L,
    input wire [3:0] D,  // 4-bit input
    input wire CP,       // Clock
    output wire [3:0] Q  // 4-bit output
);

	 and (a0, (~L), C);
	 and (a1, Q[0], a0);
	 and (a2, Q[1], a1);
	 and (a3, Q[2], a2);
	 and (a4, Q[3], a3);
	 and (a5, D[0], L);
	 and (a6, D[1], L);
	 and (a7, D[2], L);
	 and (a8, D[3], L);
	 
	 xor (x0, Q[0], a0);
	 xor (x1, Q[1], a1);
	 xor (x2, Q[2], a2);
	 xor (x3, Q[3], a3);
	 
	 or (o0, a5, x0);
	 or (o1, a6, x1);
	 or (o2, a7, x2);
	 or (o3, a8, x3);
	 
	wire q0_, q1_, q2_, q3_;
	wire q0, q1, q2, q3;
	
    // D Flip-Flops
    d_flip_flop DFF0 (.D(q0_), .CLK(CP), .RESET(1'b1), .PRESET(1'b1), .Q(q0), .Qn(q0_));
    d_flip_flop DFF1 (.D(q1_), .CLK(q0), .RESET(1'b1), .PRESET(1'b1), .Q(q1), .Qn(q1_));
    d_flip_flop DFF2 (.D(q2_), .CLK(q1), .RESET(1'b1), .PRESET(1'b1), .Q(q2), .Qn(q2_));
    d_flip_flop DFF3 (.D(q3_), .CLK(q2), .RESET(1'b1), .PRESET(1'b1), .Q(q3), .Qn(q3_));
	
	assign Q = {q3, q2, q1, q0};
	
endmodule
