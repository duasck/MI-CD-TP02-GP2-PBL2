module jkff_gate(q, qbar, clk, j, k);

input j,k,clk;
output q,qbar;

wire nand1_out; // output from nand1
wire nand2_out; // output from nand2

nand(nand1_out, j,clk,qbar);
nand(nand2_out, k,clk,q);
nand(q,qbar,nand1_out);
nand(qbar,q,nand2_out);

endmodule
