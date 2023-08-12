`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2023 03:41:34 PM
// Design Name: 
// Module Name: Mix_Col
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


module Mix_Col(
    input [127:0] Data,
    output reg [127:0] Data_OUT
    );
    integer i,k;
    reg [7:0] a [0:15];
    reg [7:0] b [0:15];
    always @(*) begin
            k=0;
            for(i=127;i>5;i=i-8) begin
                a[k] = Data[i -: 8];
                k=k+1;
            end 
            for(i=0; i<13; i=i+4) begin
                b[i] = (mult_2(a[i]))^(mult_2(a[i+1])^a[i+1])^a[i+2]^a[i+3];
                b[i+1] = a[i]^(mult_2(a[i+1]))^(mult_2(a[i+2])^a[i+2])^a[i+3];
                b[i+2] = a[i]^a[i+1]^(mult_2(a[i+2]))^(mult_2(a[i+3])^a[i+3]);
                b[i+3] = (mult_2(a[i])^a[i])^a[i+1]^a[i+2]^(mult_2(a[i+3]));
            end
            Data_OUT = {b[0],b[1],b[2],b[3],b[4],b[5],b[6],b[7],b[8],b[9],b[10],b[11],b[12],b[13],b[14],b[15]};
    end
    function [7:0] mult_2(input [7:0] in);
    if(in[7]==0)
        mult_2 = in<<1;
    else 
        mult_2 = (in<<1) ^ 8'h1b;    
    endfunction
endmodule
