module corrige_hamming (
  input [14:0] entrada, 
  output reg [10:0] saida
);

wire [3:0] posicao_erro;
wire [3:0] erro_exato;
reg [14:0] corrigido;

assign posicao_erro[0] = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
assign posicao_erro[1] = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
assign posicao_erro[2] = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^entrada[13] ^ entrada[14];
assign posicao_erro[3] = ^entrada[14:7];

assign erro_exato = posicao_erro - 1;


always @(*) begin
  corrigido = entrada;
  if (posicao_erro != 0) begin
    corrigido[erro_exato] = ~entrada[erro_exato];
  end
end



always @(*) begin
  saida = {
    corrigido[14],      
    corrigido[13],      
    corrigido[12],      
    corrigido[11],      
    corrigido[10],      
    corrigido[9],      
    corrigido[8],      
    corrigido[6],
    corrigido[5],
    corrigido[4],
    corrigido[2]};
end

endmodule
