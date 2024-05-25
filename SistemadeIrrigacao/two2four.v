module two2four ( A, B, Enable, X );
input A, B, Enable;
output [0:3]X;
wire A_Inv, B_Inv, X0_, X1_, X2_, X3_;
 
 not U1 ( B_Inv, B ) ;
 not U2 ( A_Inv, A ) ;
 and U3 ( X[0], A_Inv, B_Inv, Enable ) ;
 and U4 ( X[1], A, B_Inv, Enable ) ;
 and U5 ( X[2], A_Inv, B, Enable ) ;
 and U6 ( X[3], A, B, Enable ) ;
 
endmodule
