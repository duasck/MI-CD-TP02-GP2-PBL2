module jk_ff ( //usando no down_count
    input wire J,
    input wire K,
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
        else begin
            case ({J, K})
                2'b00: Q <= Q;          // No change
                2'b01: Q <= 0;          // Reset Q
                2'b10: Q <= 1;          // Set Q
                2'b11: Q <= ~Q;         // Toggle Q
            endcase
        end
    end

endmodule
