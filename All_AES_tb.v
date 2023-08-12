`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2023 04:41:49 AM
// Design Name: 
// Module Name: All_AES_tb
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


module All_AES_tb(

    );
    parameter clk_cycle =30;
    reg [127:0] data,key;
    wire [127:0] cipher,decrypted_data;
    wire done_encryption,done_decryption;
    reg clk=0; 
    reg start_encryption,start_decryption,reset;
    always begin
        clk=0;
        #(clk_cycle/2);
        clk=1;
        #(clk_cycle/2);
    end
    AES allAES (
    .data(data),
    .key(key),
    .reset(reset),
    .done_encryption(done_encryption),
    .start_encryption(start_encryption),
    .done_decryption(done_decryption),
    .start_decryption(start_decryption),
    .clk(clk),
    .cipher(cipher),
    .decrypted_data(decrypted_data)
    );
    initial begin
        reset = 1;
        start_decryption=0;
        start_encryption=0;
        data = 'h54776F204F6E65204E696E652054776F;
        key =  'h5468617473206D79204B756E67204675;
        #(clk_cycle);
        reset=0;
        start_encryption=1;
        #(clk_cycle);
        start_encryption=0;
        #(15*clk_cycle);
        data = cipher;
        start_decryption=1;
        #(clk_cycle);
        start_decryption=0;
        #(15*clk_cycle);
        data = 'h00112233445566778899aabbccddeeff;
        key =  'h000102030405060708090a0b0c0d0e0f;
        start_encryption=1;
        #(clk_cycle);
        start_encryption=0;
        #(2*clk_cycle);
        reset = 1;
        #(2*clk_cycle);
        reset = 0;
        #(6*clk_cycle);
        start_encryption=1;
        #(clk_cycle);
        start_encryption=0;
        #(15*clk_cycle);
        data = cipher;
        start_decryption=1;
        #(clk_cycle);
        start_decryption=0;
    end
endmodule


