`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2023 04:35:25 AM
// Design Name: 
// Module Name: AES_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AES(
    input [127:0] data,
    input [127:0] key,
    output done_encryption,
    output done_decryption,
    input start_encryption,
    input start_decryption,
    input clk,
    input reset,
    output [127:0] cipher,
    output [127:0] decrypted_data
    );
    AES_Encryption AE(
    .data(data),
    .key(key),
    .reset(reset),
    .done(done_encryption),
    .start(start_encryption),
    .clk(clk),
    .cipher(cipher)
    );
    AES_Decryption AD(
    .data(data),
    .key(key),
    .reset(reset),
    .done(done_decryption),
    .start(start_decryption),
    .clk(clk),
    .decrypted_data(decrypted_data)
    );
endmodule
