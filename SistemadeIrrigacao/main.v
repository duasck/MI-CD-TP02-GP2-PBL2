module main(
    input HH, 				 //Nível alto
	 input MM, 				 //Nível Médio
	 input LL,				 //Nível Baixo
	 input Ua,				 //Umidade do ar
	 input Us,				 //Umidade do Solo
	 input T,				 //Temperatura
	 input switch,		    //Chave de seleção
	 input reiniciar,		 //reset
	 input clk, 			 //Sinal de clock
    output Erro, 			 //Sinal de erro
	 output Alarme, 		 //Alarme
	 output Ve, 			 //Válvula de entrada
	 output Bs, 			 //Válvula de aspersão
	 output Vs, 			 //Válvulade Gotejamento
	 output a, 				 
	 output b, 				 
	 output c, 				 
	 output d, 				 // a-g: Saídas para os displays de 7 segmentos
	 output e, 				 
	 output f, 				 
	 output g,
	 output d01,
	 output d02,
	 output d03,
	 output d04,
    output [4:0] coluna, //Saída das colunas da matriz de LEDs
    output [6:0] linha	 //Saída das linhas da matriz de LEDs
);
	
	wire clk7seg, clkLeds, V, H, M, L;
		
	// Instancia do módulo de irrigação
	sistemaIrrigacao irrigacao_inst (.H(H), .M(M), .L(L), .Ua(Ua), 
	.Us(Us), .T(T), .Vs(Vs), .Bs(Bs)
	);
	
	 // Instancia do módulo de nivel
    sistemaNivel nivel_inst (.H(HH), .M(MM), .L(LL), .Cheio(H), .Medio(M), 
	 .Baixo(L), .Vazio(V), .Erro(Erro), .Alarme(Alarme), .Ve(Ve)
	 );
	
	// Divisores de clock
	divisorLeds divisor(.clk(clk), .clkLeds(clkLeds));
	divisor7seg(.clk(clkLeds), .clk7seg(clk7seg));
	// Deslocamento da coluna dos LEDs
	deslocamento_coluna_leds dc(.clk(clkLeds), .coluna(coluna));
	
	// Atribuição dos valores para as linhas da matriz de LEDs
	assign linha[0] = ~(((switch) && ((M && (coluna[2])) || (V && (coluna[1] || coluna[2] || coluna[3]))))
	|| ((~switch) && (coluna[2] || coluna[3])));
	
	assign linha[1] = !(((switch) && ((L && coluna[1]) || (H && (coluna[1] || coluna[4])) || (V && coluna[1])))
	|| ((~switch) && (coluna[1] || coluna[4])));
	
	assign linha[2] = !(((switch) && ((L && coluna[1]) || (M && coluna[2]) || (H && (coluna[1] || coluna[4])) 
	|| (V && coluna[1])) || ((~switch) && ((Bs && (coluna[1] || coluna[4]) || (Vs && coluna[1]))))));
	
	assign linha[3] = !(((switch) && ((L && coluna[1]) || (M && coluna[2]) || (H && (coluna[1] || coluna[2] 
	|| coluna[3] || coluna[4])) || (V && (coluna[1] || coluna[2])))) || ((~switch) && (Bs && (coluna[1] || coluna[2] 
	|| coluna[3] || coluna[4]) || (Vs && (coluna[1] || coluna[3] || coluna[4])))));
	
	assign linha[4] = !(((switch) && ((L && coluna[1]) || (M && coluna[2]) || (H && (coluna[1] || coluna[4])) 
	|| (V && coluna[1]))) || ((~switch) && (coluna[1] || coluna[4])));
	
	assign linha[5] = !(((switch) && ((L && coluna[1]) || (M && coluna[2]) || (H && (coluna[1] || coluna[4])) 
	|| (V && coluna[1]))) || ((~switch) && (coluna[1] || coluna[4])));
	
	assign linha[6] = !(((switch) && ((L && (coluna[1] || coluna[2] || coluna[3])) || (M && coluna[2]) 
	|| (H && (coluna[1] || coluna[4])) || (V && (coluna[1] || coluna[2] || coluna[3])))) 
	|| ((~switch) && ((Bs && (coluna[1] || coluna[4]))|| (Vs && (coluna[2] || coluna[3])))));

	
	wire [3:0] dezSeg, dezMin, uniMin, uniSeg;
	
	//modulo de contadores em cascata
	matriz7seg m7 (.clk(clk), .reset(), .vs(Vs), .Dseg(dezSeg), .Useg(uniSeg), .Umin(uniMin), .Dmin(dezMin), .clk1seg(clk7seg));
	wire [6:0] d1, d2, d3, d4;
	
	//Unidade de segundo
	decod7seg dec0 (.A(uniSeg[3]), .B(uniSeg[2]), .C(uniSeg[1]), .D(uniSeg[0]), .a(d1[6]), .b(d1[5]), .c(d1[4]),
	.d(d1[3]), .e(d1[2]), .f(d1[1]), .g(d1[0]));
	
	//Dezena de segundo
	decod7seg dec1 (.A(dezSeg[3]), .B(dezSeg[2]), .C(dezSeg[1]), .D(dezSeg[0]), .a(d2[6]), .b(d2[5]), .c(d2[4]),
	.d(d2[3]), .e(d2[2]), .f(d2[1]), .g(d2[0]));
	
	//Unidade de minuto
	decod7seg dec2 (.A(uniMin[3]), .B(uniMin[2]), .C(uniMin[1]), .D(uniMin[0]), .a(d3[6]), .b(d3[5]), .c(d3[4]),
	.d(d3[3]), .e(d3[2]), .f(d3[1]), .g(d3[0]));
	
	//Dezena de minuto
	decod7seg dec3 (.A(dezMin[3]), .B(dezMin[2]), .C(dezMin[1]), .D(dezMin[0]), .a(d4[6]), .b(d4[5]), .c(d4[4]), 
	.d(d4[3]), .e(d4[2]), .f(d4[1]), .g(d4[0]));
	
	//Selecionar uma das 4 matrizes
	wire [1:0] select;
	wire [4:0] select_dig;
	binary_counter_2bit(.clk(clk7seg), .reset(), .q(select));
	wire [6:0] out7seg;
	
	//Mux 4x1
	mux_4x1 mux4x1 (.A(d1), .B(d2), .C(d3), .D(d4), .SEL(select), .out(out7seg));
	
	
   mux_4x1bit(.SEL(select), .out(select_dig));

   assign d01 = select_dig[0];
   assign d02 = select_dig[1];
   assign d03 = select_dig[2];
   assign d04 = select_dig[3];
	
	assign a = ~out7seg[6];
	assign b = ~out7seg[5];
	assign c = ~out7seg[4];
	assign d = ~out7seg[3];
	assign e = ~out7seg[2];
	assign f = ~out7seg[1];
	assign g = ~out7seg[0];
	
endmodule