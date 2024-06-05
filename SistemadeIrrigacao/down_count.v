module down_count ( // FUNCIONA!!!!!!!!!!!!!!!!!!!!!
    input wire clk,
    input wire load,
    input wire [3:0] d,
    input wire up_down,
    input wire cten,
    output wire [3:0] q,
    output wire rco,
    output wire max_min
);
	 wire q0, q1, q2, q3;
	 wire q0_, q1_, q2_, q3_;
	 
	 not (n0, clk);
	 not (n1, up_down);
	 not (n2, n1);
	 not (n3, load);
	 not (n4, cten);
	 
	 and (a0, (~n2), (~cten));
	 and (a1, (~n1), (~cten));
	 and (a2, n1, q0, q1, q2, q3);
	 and (a3, n2, q0_, q1_, q2_, q3_);
	 and (a4, a1, q0_);
	 and (a5, a0, q0);
	 and (a6, a1, q0_, q1_);
	 and (a7, a0, q0, q1);
	 and (a8, a1, q0_, q1_, q2_);
	 and (a9, a0, q0, q1, q2);
	 
	 nand (na0, d[0], load);
	 nand (na1, d[1], load);
	 nand (na2, d[2], load);
	 nand (na3, d[3], load);
	 nand (na4, na0, load);
	 nand (na5, na1, load);
	 nand (na6, na2, load);
	 nand (na7, na3, load);
	 nand (na8, n0, n4, o0);
	 
	 or (o0, a2, a3);
	 or (o1, a4, a5);
	 or (o2, a6, a7);
	 or (o3, a8, a9);

    // Instantiate JK flip-flops     input wire J, K, CLK, RESET, Q, Qn
	 
    jk_ff ff0 (.J(n4), .K(n4), .CLK(clk), .RESET(na4), .PRESET(na0), .Q(q0), .Qn(q0_));
    jk_ff ff1 (.J(o1), .K(o1), .CLK(clk), .RESET(na5), .PRESET(na1), .Q(q1), .Qn(q1_));
	 jk_ff ff2 (.J(o2), .K(o2), .CLK(clk), .RESET(na6), .PRESET(na2), .Q(q2), .Qn(q2_));
	 jk_ff ff3 (.J(o3), .K(o3), .CLK(clk), .RESET(na7), .PRESET(na3), .Q(q3), .Qn(q3_));
	 
	assign q = {q3, q2, q1, q0};
	assign max_min = o0;
	assign rco = na8;

endmodule
