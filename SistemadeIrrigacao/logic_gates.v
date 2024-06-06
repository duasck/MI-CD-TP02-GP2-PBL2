module logic_gates (
    input wire equal0,
    input wire equal1,
    output wire lo
);
    assign lo = equal0 | ~equal1;
endmodule
