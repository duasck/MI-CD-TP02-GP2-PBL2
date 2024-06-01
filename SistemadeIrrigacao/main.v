module main(clk, H, M, L, Ua, Us, T, switch, reiniciar, a, b, c, d, e, f, g, d1, d2, d3, d4, Erro, Alarme, Ve, cl0, cl1, cl2, cl3, cl4, ln0, ln1, ln2, ln3, ln4, ln5, ln6);

	
	input H, M, L, Ua, Us, T, switch, reiniciar, clk;
	output Erro, Alarme, Ve, a, b, c, d, e, f, g, d1, d2, d3, d4;
	output cl0, cl1, cl2, cl3, cl4, ln0, ln1, ln2, ln3, ln4, ln5, ln6;
	
	wire [3:0] segundos_unidades, segundos_decenas, minutos_unidades, minutos_decenas;
	wire reset;
	wire clk_1hz;
	wire carry_segundos_unidades;
	wire carry_segundos_decenas;
	wire carry_minutos_unidades;
	wire carry_minutos_decenas;
	wire Cheio, Medio, Baixo, Vazio, Vs, Bs;
	
	// Instancia do módulo de irrigação
	sistemaIrrigacao irrigacao_inst (.H(H), .M(M), .L(L), .Ua(Ua), 
	.Us(Us), .T(T), .Vs(Vs), .Bs(Bs)
	);
	
	 // Instancia do módulo de nivel
    sistemaNivel nivel_inst (.H(H), .M(M), .L(L), .Cheio(Cheio), .Medio(Medio), 
	 .Baixo(Baixo), .Vazio(Vazio), .Erro(Erro), .Alarme(Alarme), .Ve(Ve)
	 );
	 

	// Instancia divisor de relogio
    divisor_clk divisor (
        .clk(clk),
        .rstn(reset),
        .out(clk_1hz)
    );
	 
	 // Contador de segundos (unidades, 0-9)
    contador_bcd contador_segundos_unidades (
        .clk(clk_1hz),
        .reset(reset),
        .bcd(segundos_unidades),
        .carry(carry_segundos_unidades)
    );
	 
	 // Contador de segundos (decenas, 0-5)
    contador contador_segundos_decenas (
        .clk(carry_segundos_unidades),
        .reset(reset),
        .bcd(segundos_decenas),
        .carry(carry_segundos_decenas)
    );
	 
	 // Contador de minutos (unidades, 0-9)
    contador_bcd contador_minutos_unidades (
        .clk(carry_segundos_decenas),
        .reset(reset),
        .bcd(minutos_unidades),
        .carry(carry_minutos_unidades)
    );
	 
	 // Contador de minutos (decenas, 0-5)
    contador contador_minutos_decenas (
        .clk(carry_minutos_unidades),
        .reset(reset),
        .bcd(minutos_decenas),
        .carry(reset)
    );

endmodule


