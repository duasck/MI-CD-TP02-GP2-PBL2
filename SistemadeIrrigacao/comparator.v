module comparator (
    input wire [3:0] A,
    input wire [3:0] B,
    output wire OUT
);
    assign OUT = (A == B);
endmodule
