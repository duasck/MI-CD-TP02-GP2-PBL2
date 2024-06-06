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
	wire [3:0] dezSeg, dezMin, uniMin, uniSeg;
	
	top_module(.clk(clk), .reset(reiniciar), .vs(Vs), .Dseg(dezSeg), .Useg(uniSeg), .Umin(uniMin), .Dmin(dezMin));
	wire [6:0] d0, d1, d2, d3;
	
	//unidade de segundo
	decod7seg dec0 (.A(uniSeg[3]), .B(uniSeg[2]), .C(uniSeg[1]), .D(uniSeg[0]), .a(d0[6]), .b(d0[5]), .c(d0[4]), .d(d0[3]), .e(d0[2]), .f(d0[1]), .g(d0[0]));
	//dezena de segundo
	decod7seg dec1 (.A(dezSeg[3]), .B(dezSeg[2]), .C(dezSeg[1]), .D(dezSeg[0]), .a(d1[6]), .b(d1[5]), .c(d1[4]), .d(d1[3]), .e(d1[2]), .f(d1[1]), .g(d1[0]));
	//unidade de minuto
	decod7seg dec2 (.A(uniMin[3]), .B(uniMin[2]), .C(uniMin[1]), .D(uniMin[0]), .a(d2[6]), .b(d2[5]), .c(d2[4]), .d(d2[3]), .e(d2[2]), .f(d2[1]), .g(d2[0]));
	//dezena de minuto
	decod7seg dec3 (.A(dezMin[3]), .B(dezMin[2]), .C(dezMin[1]), .D(dezMin[0]), .a(d3[6]), .b(d3[5]), .c(d3[4]), .d(d3[3]), .e(d3[2]), .f(d3[1]), .g(d3[0]));
	
	//mux2_1(.A(), .B(), .C(), .D(), .SEL(), .out())
//	1000;
 //  0100;
  // 0010;
 //  0001;
	
endmodule


