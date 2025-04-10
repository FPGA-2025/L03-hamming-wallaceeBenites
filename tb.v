module tb();

reg [10:0] entrada;
wire [14:0] h15;
reg [3:0] n;
reg injeta_erro;
wire [14:0] alterado;
wire [10:0] saida;
reg [15:0] dados_arquivo [0:4];

calcula_hamming cah(
  .entrada(entrada),
  .saida(h15)
);

injetor inj(
  .entrada(h15),
  .n(n),
  .erro(injeta_erro),
  .saida(alterado)
);

corrige_hamming coh(
  .entrada(alterado),
  .saida(saida)
);

integer i;

initial begin
  $readmemb("teste.txt", dados_arquivo); // le o arquivo de entrada
  
  $dumpfile("saida.vcd"); // gera waveform
  $dumpvars(0, tb); // salva todas as variáveis

  // Monitor apenas das entradas e saídas principais
  $monitor("entrada=%b, saida=%b", entrada, saida);

  // Loop principal de teste
  for (i = 0; i < 5; i = i + 1) begin
    entrada = dados_arquivo[i][15:5];  // 11 bits de dados
    n = dados_arquivo[i][4:1];         // 4 bits de posição
    injeta_erro = dados_arquivo[i][0]; // 1 bit de controle
    #10; // Tempo suficiente para propagação
  end
  
  $finish; // Finaliza a simulação
end

endmodule
