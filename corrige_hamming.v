module corrige_hamming (
  input [14:0] entrada,  
  output reg [10:0] saida  
);

  wire s0 = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] 
           ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  
  wire s1 = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] 
           ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  
  wire s2 = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] 
           ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  
  wire s3 = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] 
           ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  wire [3:0] error_pos = {s3, s2, s1, s0};

  // Correção aplicada somente se error_pos for diferente de 0
 wire [14:0] corrected_input = (error_pos != 4'b0000) 
    ? (entrada ^ (15'b1 << (error_pos - 1))) : entrada;

  always @(*) begin
    saida = {
      corrected_input[14], // d10
      corrected_input[13], // d9
      corrected_input[12], // d8
      corrected_input[11], // d7
      corrected_input[10], // d6
      corrected_input[9],  // d5
      corrected_input[8],  // d4
      corrected_input[6],  // d3
      corrected_input[5],  // d2
      corrected_input[4],  // d1
      corrected_input[2]   // d0
    };
  end

endmodule
