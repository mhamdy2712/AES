`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 03:32:16 PM
// Design Name: 
// Module Name: AES_tb
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


module AES_tb(

    );
    parameter clk_cycle =30;
    reg [127:0] data,key;
    wire [127:0] cipher;
    wire done;
    reg clk=0; 
    reg start;
    always begin
        clk=0;
        #(clk_cycle/2);
        clk=1;
        #(clk_cycle/2);
    end
    AES_Encryption my_aes (
    .data(data),
    .key(key),
    .done(done),
    .start(start),
    .clk(clk),
    .cipher(cipher)
    );
    initial begin
        data = 'h54776F204F6E65204E696E652054776F;
        key =  'h5468617473206D79204B756E67204675;
        start=1;
        #(clk_cycle);
        start=0;
        #(100*clk_cycle);

        data = 'h00112233445566778899aabbccddeeff;
        key =  'h000102030405060708090a0b0c0d0e0f;
        start=1;
        #(clk_cycle);
        start=0;
    end
endmodule
