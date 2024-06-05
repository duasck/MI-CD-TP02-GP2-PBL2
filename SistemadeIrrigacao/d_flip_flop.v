module d_flip_flop (
    input wire D,
    input wire CLK,
    input wire RESET,  // Active low
    input wire PRESET, // Active low
    output reg Q,
    output wire Qn
);

    assign Qn = ~Q;

    always @(posedge CLK or negedge RESET or negedge PRESET) begin
        if (!RESET)
            Q <= 0; // Reset the flip-flop (active low)
        else if (!PRESET)
            Q <= 1; // Preset the flip-flop (active low)
        else
            Q <= D; // Load D into Q on the clock's rising edge
    end

endmodule
