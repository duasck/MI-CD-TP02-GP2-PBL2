/*module us (
    input clk,
    input rst,
    output q3,
	 output q2,
	 output q1,
	 output q0,
    output carry);

	wire reset, w0, w1, w2, w3;
	 
	assign w0 = 1;
	assign w1 = 0;
	assign w2 = 0;
	assign w3 = 1; 

    // Lógica de reset: reinicia quando rst está ativo ou quando o contador chega a 0 (0000)
    assign reset = rst ;
	 //assign q0 = 1;
	 
    decrescente d0 (
        .clk(clk),
        .mode(0), // O modo deve ser 0 para contar de forma decrescente
        .rst(reset),
        .q0(w0),
        .q1(w1),
        .q2(w2),
        .q3(w3));

	assign carry = (~q3 & ~q2 & ~q1 & ~q0);

	
	
endmodule */
