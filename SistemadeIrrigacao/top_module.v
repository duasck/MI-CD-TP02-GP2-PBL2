module top_module (
    input wire clk,
    input wire reset,
	 input vs,
    output wire [3:0] Dseg,
    output wire [3:0] Useg,
    output wire [3:0] Umin,
    output wire [3:0] Dmin,
	 output wire [3:0] dezenas_min, 
	 output wire [3:0] unidades_min
);
	  
    wire carryout0, carryout1, carryout2;
    wire clk1seg, clk0;
	 //;
    reg lo;

    // Inicializa `lo` como 1
    initial begin
        lo = 1;
    end
	
	
    divisorLeds d0 (.clk(clk), .clkLeds(clk0));
    divisor7seg d1 (.clk(clk0), .clk7seg(clk1seg));
	
    // Instância do módulo `down_count` para os segundos unidades
    down_count us (
        .clk(clk),
        .load(lo),
        .d(4'b1001),
        .up_down(1),
        .cten(0),
        .q(Useg),
        .rco(),
        .max_min(carryout0)
    );
	
    // Instância do módulo `down_count` para os segundos dezenas
    down_count ds (
        .clk(carryout0),
        .load(lo),
        .d(4'b0101),
        .up_down(1),
        .cten(0),
        .q(Dseg),
        .rco(),
        .max_min(carryout1)
    );
	
	 // Instância do multiplexador para selecionar o valor de `d` para dezenas de minutos
    mux2to1 mux_u_min (
        .in0(4'b0100),  // 4 Valor quando vs = 0
        .in1(4'b1001),  // 9 Valor quando vs = 1
        .sel(vs),
        .out(unidades_min)
    );
	 
    // Instância do módulo `down_count` para os minutos unidades
    down_count um (
        .clk(carryout1),
        .load(lo),
        .d(unidades_min),
        .up_down(1),
        .cten(0),
        .q(Umin),
        .rco(),
        .max_min(carryout2)
    );
	 
	 // Instância do multiplexador para selecionar o valor de `d` para dezenas de minutos
    mux2to1 mux_d_min (
        .in0(4'b0001),  // Valor quando vs = 0
        .in1(4'b0011),  // Valor quando vs = 1
        .sel(vs),
        .out(dezenas_min)
    );
	
    // Instância do módulo `down_count` para os minutos dezenas
    down_count dm (
        .clk(carryout2),
        .load(lo),
        .d(dezenas_min),
        .up_down(1),
        .cten(0),
        .q(Dmin),
        .rco(),
        .max_min()
    );

	// wire [3:0]mdez;
	// assign mdez = ();
    // Lógica sequencial para atualizar `lo` com base em `Useg`, `Dseg`, `Umin` e `Dmin`
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lo <= 1; // Resetar lo para 1
        end else begin
            if ((Useg == 4'b0000 && Dseg == 4'b0000 && Umin == 4'b0000 && Dmin == 4'b0000)) begin
                lo <= 1; // Ativar lo quando todos os contadores atingirem 0000
            end else if (Useg == 4'b1001 || Dseg == 4'b0101 || Umin == 4'b1001 || Dmin == 4'b0101) begin
                lo <= 0; // Desativar lo quando qualquer contador atingir seu valor de reinício
            end
        end
    end

endmodule
