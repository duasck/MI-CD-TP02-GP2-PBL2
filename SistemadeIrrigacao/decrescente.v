module decrescente (
    input clk, 
    input mode, 
    input rst,
    output q0, q1, q2, q3
);
    
    wire q0_, q1_, q2_, q3_;
    wire sq0, sq1, sq2;

    // Flip-flops JK configurados para contar en modo descendente
    jk_flipflop c0 (
        .j(1), 
        .k(1), 
        .clk(clk), 
        .reset(rst), 
        .q(q0), 
        .qn(q0_)
    );

    // Generación de las señales de control para los flip-flops JK
    and cr0 (a0, q0, mode);
    and dr0 (a1, q0_, (~mode));
    or o0 (sq0, a0, a1);  // Corrección: añadir punto y coma

    jk_flipflop c1 (
        .j(sq0), 
        .k(sq0), 
        .clk(clk), 
        .reset(rst), 
        .q(q1), 
        .qn(q1_)
    );

    and cr1 (a2, q1, a0);
    and dr1 (a3, q1_, a1);
    or o1 (sq1, a2, a3);  // Corrección: añadir punto y coma

    jk_flipflop c2 (
        .j(sq1), 
        .k(sq1), 
        .clk(clk), 
        .reset(rst), 
        .q(q2), 
        .qn(q2_)
    );

    and cr2 (a4, q2, a2);
    and dr2 (a5, q2_, a3);
    or o2 (sq2, a4, a5);  // Corrección: añadir punto y coma

    jk_flipflop c3 (
        .j(sq2), 
        .k(sq2), 
        .clk(clk), 
        .reset(rst), 
        .q(q3), 
        .qn(q3_)
    );

endmodule
