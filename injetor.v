module injetor(
  input [14:0] entrada,  
  input [3:0] n,         
  input erro,            
  output reg [14:0] saida 
);

always @(*) begin
  if (erro) begin
 
    saida = entrada ^ (15'b1 << (n-1));
  end else begin
  
    saida = entrada;
  end
end

endmodule
