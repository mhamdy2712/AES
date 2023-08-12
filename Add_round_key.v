`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 12:39:12 PM
// Design Name: 
// Module Name: Add_round_key
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


module Add_Round_Key(
    input [127:0] Data,
    input [127:0] Key,
    input clk,
    input start,
    output reg rst_counter,
    output reg [127:0] out_round
    );
    integer i=0,k=0;
    reg [7:0] a [0:15];
    reg [7:0] key [0:15];
    reg [7:0] out [0:15];
    always @(posedge clk,posedge start)
    begin
        if(start)
            rst_counter <=0;
        else begin
        rst_counter <=1;
        out_round <= {out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15]};
        end
    end
    always @(*) begin
        k=0;
    for(i=127;i>5;i=i-8) begin
        a[k] = Data[i -: 8];
        key[k] = Key[i -: 8];
        k=k+1;
    end
        for(i=0;i<16;i=i+1)
            out[i] = key[i] ^ a[i];
    end
endmodule
