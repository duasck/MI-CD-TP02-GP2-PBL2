/*
module bit_counter (
    input clk,      // Clock input
    input rst,      // Reset input
    output [3:0] Q  // 4-bit counter output
);
    wire [3:0] D;  // Wires for the D inputs of the flip-flops
	 wire dff0, dff1, dff2, dff3;

    // D flip-flop for the first bit
    d_ff_struct dff0(
        .D(~Q[0]), // Toggle the first bit on every clock
        .clk(clk),
        .rst(rst),
        .Q(Q[0])
    );

    // D flip-flop for the second bit
    d_ff_struct dff1(
        .D(Q[0] & ~Q[1]), // Toggle on the rising edge of the first bit
        .clk(clk),
        .rst(rst),
        .Q(Q[1])
    );

    // D flip-flop for the third bit
    d_ff_struct dff2(
        .D((Q[0] & Q[1]) & ~Q[2]), // Toggle on the rising edge of the second bit
        .clk(clk),
        .rst(rst),
        .Q(Q[2])
    );

    // D flip-flop for the fourth bit
    d_ff_struct dff3(
        .D((Q[0] & Q[1] & Q[2]) & ~Q[3]), // Toggle on the rising edge of the third bit
        .clk(clk),
        .rst(rst),
        .Q(Q[3])
    );
endmodule
*/