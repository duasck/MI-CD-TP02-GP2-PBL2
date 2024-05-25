module main(H, M, L, Ua, Us, T, Vs, Bs, Cheio, Medio, Baixo, Vazio, Erro, Alarme, Ve);

	input H, M, L, Ua, Us, T;
	output Vs, Bs, Cheio, Medio, Baixo, Vazio, Erro, Alarme, Ve;

	// Instancia do módulo de irrigação
	sistemaIrrigacao irrigacao_inst (.H(H), .M(M), .L(L), .Ua(Ua), .Us(Us), .T(T), .Vs(Vs), .Bs(Bs) );
	
	 // Instancia do módulo de nivel
    sistemaNivel nivel_inst (.H(H), .M(M), .L(L), .Cheio(Cheio), .Medio(Medio), .Baixo(Baixo), .Vazio(Vazio), .Erro(Erro), 
	 .Alarme(Alarme), .Ve(Ve) );
	
	
endmodule


