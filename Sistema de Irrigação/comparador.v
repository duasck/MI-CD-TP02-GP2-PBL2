module comparador (a, b, aeqb, agtb, altb);

input [3:0] a, b;

output aeqb, agtb, altb;

//Declaração
wire x0, x1, x2, x3;
wire g0, g1, g2, g3;
wire l0, l1, l2, l3;
wire b3Inv, b2Inv, b1Inv, b0Inv;
wire a3Inv, a2Inv, a1Inv, a0Inv;

//Inversores
not N1(b3Inv, b[3]);
not N2(b2Inv, b[2]);
not N3(b1Inv, b[1]);
not N4(b0Inv, b[0]);
not N5(a3Inv, a[3]);
not N6(a2Inv, a[2]);
not N7(a1Inv, a[1]);
not N8(a0Inv, a[0]);

//Intermediarias
and I1 (x3, a[3], b[3]);
and I2 (x2, a[2], b[2]);
and I3 (x1, a[1], b[1]);
and I4 (x0, a[0], b[0]);


//saidas

//quando for igual [equals]
and S1 (aeqb, x3, x2, x1, x0);


//quando a > b []

and S2 (g0, a[3], b3Inv);
and S3 (g1, x3, a[2], b2Inv);
and S4 (g2, x3, x2, a[1], b1Inv);
and S5 (g3, x3, x2, x1, a[0], b0Inv);
or S6 (agtb, g0, g1, g2, g3);

//quando a < b

and S7 (l0, b[3], a3Inv);
and S8 (l1, x3, b[2], a2Inv);
and S9 (l2, x3, x2, b[1], a1Inv);
and S10 (l3, x3, x2, x1, b[0], a0Inv);
or S11 (altb, l0, l1, l2, l3);

endmodule
