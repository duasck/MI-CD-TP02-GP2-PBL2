module gatilho (
    input wire clk,

	 input reset,

	 output stop
);
    wire q0, q1, shift_in;
	 wire [1:0] q;
    // Instantiate the first D flip-flop
    d_ff ff0 (
		  .d(1),
		  .rstn(reset),
        .clk(stop),
        .q(q0)
    );

    // Instantiate the second D flip-flop
    d_ff ff1 (
		  .d(q0),
		  .rstn(reset),
        .clk(stop),
        .q(q1)
    );
	 assign stop = clk & ~(q[0] & q[1]);
    assign q = {q1, q0};

endmodule

//d_ff (d, rstn, clk, q); 
	
