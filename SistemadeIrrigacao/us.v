/*module us (
    input clk,
    input rst,
    output q3,
	 output q2,
	 output q1,
	 output q0,
    output carry);

	wire reset;
	 

    // Lógica de reset: reinicia quando rst está ativo ou quando o contador chega a 0 (0000)
    assign reset = rst ;
	 //assign q0 = 1;
	 
    decrescente d0 (
        .clk(clk),
        .mode(0), // O modo deve ser 0 para contar de forma decrescente
        .rst(reset),
        .q0(1),
        .q1(0),
        .q2(0),
        .q3(1));

	assign carry = (~q3 & ~q2 & ~q1 & ~q0);

	
	
endmodule
*/