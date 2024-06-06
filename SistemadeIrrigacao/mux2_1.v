module mux2_1(
    input A, B, C, D,
    input [1:0] SEL,
    output out
);
    wire [3:0] SEL_A, SEL_B, SEL_C, SEL_D;

    // SEL = 00: out = A
    // SEL = 01: out = B
    // SEL = 10: out = C
    // SEL = 11: out = D

    assign SEL_A = (SEL == 2'b00) ? A : 1000;
    assign SEL_B = (SEL == 2'b01) ? B : 0100;
    assign SEL_C = (SEL == 2'b10) ? C : 0010;
    assign SEL_D = (SEL == 2'b11) ? D : 0001;

    assign out = SEL_A | SEL_B | SEL_C | SEL_D;

endmodule

