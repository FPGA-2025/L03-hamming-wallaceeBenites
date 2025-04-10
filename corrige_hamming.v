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

  wire [14:0] corrected = entrada ^ (15'b1 << (error_pos-1));

  always @(*) begin
    saida = {
      corrected[14], // d10
      corrected[13], // d9
      corrected[12], // d8
      corrected[11], // d7
      corrected[10], // d6
      corrected[9],  // d5
      corrected[8],  // d4
      corrected[6],  // d3
      corrected[5],  // d2
      corrected[4],  // d1
      corrected[2]   // d0
    };
  end

endmodule
