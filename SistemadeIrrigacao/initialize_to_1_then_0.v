module initialize_to_1_then_0 (
    input wire clk,
    input wire reset,
    output wire q
);
    wire q1, q2;

    // First D flip-flop: initializes to 1 then 0
    d_flip_flop ff1 (
        .clk(clk),
        .reset(reset),
        .d(1'b0), // This flip-flop always loads 0 after the first clock cycle
        .q(q1)
    );

    // Second D flip-flop: tracks the state of the first flip-flop
    d_flip_flop ff2 (
        .clk(clk),
        .reset(reset),
        .d(q1), // This flip-flop loads the output of the first flip-flop
        .q(q2)
    );

    // Output logic: initialize to 1, then 0
    assign q = ~q2;

endmodule
