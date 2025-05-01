module injetor(
  input [14:0] entrada,   // Dados de entrada codificados com Hamming
  input [3:0] n,          // Número do bit a ser invertido (1 a 15)
  input erro,             // Se 1, realiza a inversão
  output reg [14:0] saida // Saída com erro injetado (ou igual à entrada)
);

always @(*) begin
  if (erro && n != 0 && n <= 15) begin
    // Inverte apenas o bit de posição n (1 a 15), ajustando para 0-based
    saida = entrada ^ (15'b1 << (n - 1));
  end else begin
    saida = entrada;
  end
end

endmodule
