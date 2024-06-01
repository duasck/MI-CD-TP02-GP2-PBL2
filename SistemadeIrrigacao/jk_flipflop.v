module jk_flipflop ( //usando esse
    input j,
    input k,
    input clk,
    input reset,
    output reg q,
    output qn
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;
        end else begin
            case ({j, k})
                2'b00: q <= q;     // Sin cambio
                2'b01: q <= 0;     // Reseteo
                2'b10: q <= 1;     // Seteo
                2'b11: q <= ~q;    // Toggle
            endcase
        end
    end

    assign qn = ~q;

endmodule