module main(H, M, L, Ua, Us, T, switch, rest, d1, d2, d3, d4, a, b, c, d, e, f, g, Vs, Bs, Cheio, Medio, Baixo, Vazio, Erro, Alarme, Ve);

	input H, M, L, Ua, Us, T, switch, rest;
	output Vs, Bs, Cheio, Medio, Baixo, Vazio, Erro, Alarme, Ve, a, b, c, d, e, f, g, d1, d2, d3, d4;

	// Instancia do módulo de irrigação
	sistemaIrrigacao irrigacao_inst (.H(H), .M(M), .L(L), .Ua(Ua), .Us(Us), .T(T), .Vs(Vs), .Bs(Bs) );
	
	 // Instancia do módulo de nivel
    sistemaNivel nivel_inst (.H(H), .M(M), .L(L), .Cheio(Cheio), .Medio(Medio), .Baixo(Baixo), .Vazio(Vazio), .Erro(Erro), 
	 .Alarme(Alarme), .Ve(Ve) );

	 
endmodule


