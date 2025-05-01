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
  $readmemb("teste.txt", dados_arquivo);

  $dumpfile("saida.vcd");
  $dumpvars(0, tb);

  $display("Teste de código Hamming com injeção e correção de erro:");
  $monitor("entrada=%b, h15=%b, n=%d, erro=%b, alterado=%b, saida=%b",
           entrada, h15, n, injeta_erro, alterado, saida);

  for (i = 0; i < 5; i = i + 1) begin
    entrada = dados_arquivo[i][15:5];
    n = dados_arquivo[i][4:1];
    injeta_erro = dados_arquivo[i][0];
    #10;
  end
end

initial begin
  #100;
  $finish;
end

endmodule