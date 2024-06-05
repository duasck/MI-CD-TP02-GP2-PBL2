module main(clk, H, M, L, Ua, Us, T, switch, reiniciar, Erro, Alarme, Ve, a, b, c, d, e, f, g, d1, d2, d3, d4, cl0, cl1, cl2, cl3, cl4, ln0, ln1, ln2, ln3, ln4, ln5, ln6);

	
	input H, M, L, Ua, Us, T, switch, reiniciar, clk;
	output Erro, Alarme, Ve, a, b, c, d, e, f, g, d1, d2, d3, d4;
	output cl0, cl1, cl2, cl3, cl4, ln0, ln1, ln2, ln3, ln4, ln5, ln6;
	
	wire reset;
	wire clk_1hz;
	wire Cheio, Medio, Baixo, Vazio, Vs, Bs;
	
	// Instancia do módulo de irrigação
	sistemaIrrigacao irrigacao_inst (.H(H), .M(M), .L(L), .Ua(Ua), 
	.Us(Us), .T(T), .Vs(Vs), .Bs(Bs)
	);
	
	 // Instancia do módulo de nivel
    sistemaNivel nivel_inst (.H(H), .M(M), .L(L), .Cheio(Cheio), .Medio(Medio), 
	 .Baixo(Baixo), .Vazio(Vazio), .Erro(Erro), .Alarme(Alarme), .Ve(Ve)
	 );
	 

	 
endmodule


