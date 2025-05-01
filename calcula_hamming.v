module calcula_hamming (
    input  [10:0] data_in,     // Entrada com 11 bits de dados
    output [14:0] data_out     // Saída com 15 bits (Hamming codificado)
);

    wire p1, p2, p4, p8;

    // Atribuição dos bits de dados às posições corretas
    assign data_out[2]  = data_in[0]; 
    assign data_out[4]  = data_in[1]; 
    assign data_out[5]  = data_in[2]; 
    assign data_out[6]  = data_in[3]; 
    assign data_out[8]  = data_in[4]; 
    assign data_out[9]  = data_in[5];  
    assign data_out[10] = data_in[6];  
    assign data_out[11] = data_in[7];  
    assign data_out[12] = data_in[8];  
    assign data_out[13] = data_in[9];  
    assign data_out[14] = data_in[10]; 

    // Cálculo dos bits de paridade (paridade par)
    assign p1 = data_out[2] ^ data_out[4] ^ data_out[6] ^ data_out[8] ^ data_out[10] ^ data_out[12] ^ data_out[14];
    assign p2 = data_out[2] ^ data_out[5] ^ data_out[6] ^ data_out[9] ^ data_out[10] ^ data_out[13] ^ data_out[14];
    assign p4 = data_out[4] ^ data_out[5] ^ data_out[6] ^ data_out[11] ^ data_out[12] ^ data_out[13] ^ data_out[14];
    assign p8 = data_out[8] ^ data_out[9] ^ data_out[10] ^ data_out[11] ^ data_out[12] ^ data_out[13] ^ data_out[14];

    // Atribuição dos bits de paridade às posições corretas
    assign data_out[0] = p1;  // pos 1
    assign data_out[1] = p2;  // pos 2
    assign data_out[3] = p4;  // pos 4
    assign data_out[7] = p8;  // pos 8

endmodule
