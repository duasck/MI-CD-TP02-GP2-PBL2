module d_flip_flop(
    input wire clk,
    input wire rst,
    input wire d,
    output wire q
);
    reg q_int;

    always @(posedge clk or posedge rst) begin
        q_int <= rst ? 1'b0 : d;
    end

    assign q = q_int;
endmodule

module ring_counter(
    input wire clk,
    input wire rst,
    output wire [3:0] q
);
    wire [3:0] d;

    // Define the connections for the ring counter
    assign d[0] = q[3];
    assign d[1] = q[0];
    assign d[2] = q[1];
    assign d[3] = q[2];

    // Instantiate D flip-flops for each bit
    d_flip_flop dff0 (
        .clk(clk),
        .rst(rst),
        .d(d[0]),
        .q(q[0])
    );

    d_flip_flop dff1 (
        .clk(clk),
        .rst(rst),
        .d(d[1]),
        .q(q[1])
    );

    d_flip_flop dff2 (
        .clk(clk),
        .rst(rst),
        .d(d[2]),
        .q(q[2])
    );

    d_flip_flop dff3 (
        .clk(clk),
        .rst(rst),
        .d(d[3]),
        .q(q[3])
    );

    // Initialize the ring counter to 4'b0001 using reset signal
    assign q = rst ? 4'b0001 : {q[2:0], q[3]};
endmodule