module d_flip_flop_structural (
    input wire D,      // Data input
    input wire clk,    // Clock input
    output wire Q,     // Normal output
    output wire Q_bar  // Inverted output
);

    wire clk_not;     // Inverted clock signal
    wire D_not;       // Inverted data signal
    wire R1, R2;      // Intermediate signals

    // Inverting signals
    not(clk_not, clk);
    not(D_not, D);

    // First latch (Master latch)
    nand(R1, D, clk);
    nand(R2, D_not, clk);
    
    // The cross-coupled NAND gates forming the master latch
    nand(Qm, R1, Qm_bar);
    nand(Qm_bar, R2, Qm);

    // Second latch (Slave latch)
    nand(R3, Qm, clk_not);
    nand(R4, Qm_bar, clk_not);
    
    // The cross-coupled NAND gates forming the slave latch
    nand(Q, R3, Q_bar);
    nand(Q_bar, R4, Q);

endmodule 