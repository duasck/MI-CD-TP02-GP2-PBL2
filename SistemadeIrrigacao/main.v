module main(clk, clk7seg, clkLeds, H, M, L, V, Ua, Us, T, switch, reiniciar, Erro, Alarme, Ve, Bs, Vs, a, b, c, d, e, f, g, d1, d2, d3, d4, coluna, linha);

	
	input H, M, L, V, Ua, Us, T, switch, reiniciar, clk;
	output Erro, Alarme, Ve, Bs, Vs, a, b, c, d, e, f, g, d1, d2, d3, d4, clk7seg, clkLeds;
	output [4:0] coluna;
	output [6:0] linha;
	
	wire reset;
	wire clk_1hz;
	//wire Cheio, Medio, Baixo, V, Vs, Bs;
	
	divisorLeds divisor(.clk(clk), .clkLeds(clkLeds));
	
	//Matriz de LEDs
	
	deslocamento_coluna_leds dc(.clk(clkLeds), .coluna(coluna));
	
	assign coluna[4] = 1;
	
	assign linha[0] = !(((switch) && ((M && (coluna[2])) || (V && (coluna[3] || coluna[2] || coluna[3]))))
	|| ((~switch) && (coluna[2] || coluna[1])));
	assign linha[1] = !(((switch) && ((L && coluna[3]) || (H && (coluna[3] || coluna[0])) || (V && coluna[3])))
	|| ((~switch) && (coluna[3] || coluna[0])));
	assign linha[2] = !(((switch) && ((L && coluna[3]) || (M && coluna[2]) || (H && (coluna[3] || coluna[0])) 
	|| (V && coluna[3])) || ((~switch) && ((Bs && (coluna[3] || coluna[0]) || (Vs && coluna[3]))))));
	assign linha[3] = !(((switch) && ((L && coluna[3]) || (M && coluna[2]) || (H && (coluna[3] || coluna[2] 
	|| coluna[1] || coluna[0])) || (V && (coluna[3] || coluna[2])))) || ((~switch) && (Bs && (coluna[3] || coluna[2] 
	|| coluna[1] || coluna[0]) || (Vs && (coluna[3] || coluna[1] || coluna[0])))));
	assign linha[4] = !(((switch) && ((L && coluna[3]) || (M && coluna[2]) || (H && (coluna[3] || coluna[0])) 
	|| (V && coluna[3]))) || ((~switch) && (coluna[3] || coluna[0])));
	assign linha[5] = !(((switch) && ((L && coluna[3]) || (M && coluna[2]) || (H && (coluna[3] || coluna[0])) 
	|| (V && coluna[3]))) || ((~switch) && (coluna[3] || coluna[0])));
	assign linha[6] = !(((switch) && ((L && (coluna[3] || coluna[2] || coluna[1])) || (M && coluna[2]) 
	|| (H && (coluna[3] || coluna[0])) || (V && (coluna[3] || coluna[2] || coluna[1])))) 
	|| ((~switch) && ((Vs && (coluna[3] || coluna[0]))|| (Bs && (coluna[2] || coluna[1])))));
	
	/*Modo
	assign linha[0] = !((~switch) && (coluna[2] || coluna[1]));//verificar na placa
	assign linha[1] = !((~switch) && (coluna[3] || coluna[0]));
	assign linha[2] = !((~switch) && ((Bs && (coluna[3] || coluna[0]) || (Vs && coluna[3]))));
	assign linha[3] = !((~switch) && (Bs && (coluna[3] || coluna[2] || coluna[1] || coluna[0]) || (Vs && (coluna[3] || coluna[1] || coluna[0]))));
	assign linha[4] = !((~switch) && (coluna[3] || coluna[0]));
	assign linha[5] = !((~switch) && (coluna[3] || coluna[0]));
	assign linha[6] = !((~switch) && ((Vs && (coluna[3] || coluna[0]))|| (Bs && (coluna[2] || coluna[1]))));*/
	
	// Instancia do módulo de irrigação
	sistemaIrrigacao irrigacao_inst (.H(H), .M(M), .L(L), .Ua(Ua), 
	.Us(Us), .T(T), .Vs(Vs), .Bs(Bs)
	);
	
	 // Instancia do módulo de nivel
    sistemaNivel nivel_inst (.H(H), .M(M), .L(L), .Cheio(Cheio), .Medio(Medio), 
	 .Baixo(Baixo), .Vazio(V), .Erro(Erro), .Alarme(Alarme), .Ve(Ve)
	 );
	 

	 
endmodule


