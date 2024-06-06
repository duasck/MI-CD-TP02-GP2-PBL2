module jk_ff ( 
    input wire J,           // Entrada J do flip-flop JK
    input wire K,           // Entrada K do flip-flop JK
    input wire CLK,         // Sinal de clock do flip-flop JK
    input wire RESET,       // Sinal de reset do flip-flop JK (ativo em nível baixo)
    input wire PRESET,      // Sinal de preset do flip-flop JK (ativo em nível baixo)
    output reg Q,           // Saída Q do flip-flop JK
    output wire Qn          // Saída complementar Qn do flip-flop JK
);

    assign Qn = ~Q;         // Saída complementar é a negação da saída Q

    always @(posedge CLK or negedge RESET or negedge PRESET) begin
        if (!RESET)          // Se o sinal de reset estiver ativo (nível baixo)
            Q <= 1'b0;       // Zera o flip-flop (ativo em nível baixo)
        else if (!PRESET)    // Se o sinal de preset estiver ativo (nível baixo)
            Q <= 1'b1;       // Define o flip-flop em estado "set" (ativo em nível baixo)
        else begin           // Caso contrário
            case ({J, K})    // Verifica as combinações de J e K
                2'b00: Q <= Q;          // Sem mudança no estado atual
                2'b01: Q <= 1'b0;       // Zera Q
                2'b10: Q <= 1'b1;       // Define Q em estado "set"
                2'b11: Q <= ~Q;         // Inverte Q (toggle)
            endcase
        end
    end

endmodule