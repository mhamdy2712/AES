`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2023 12:48:59 AM
// Design Name: 
// Module Name: Inverse_Shift_Row
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


module Inverse_Shift_Row(
    input [127:0] Data,
    output reg [127:0] Data_OUT
    );
    integer i,k;
    reg [7:0] a [0:15];
    always @(*) begin
        k=0;
        for(i=127;i>5;i=i-8) begin
            a[k] = Data[i -: 8];
            k=k+1;
        end 
        
        Data_OUT = {a[0],a[13],a[10],a[7],a[4],a[1],a[14],a[11],a[8],a[5],a[2],a[15],a[12],a[9],a[6],a[3]};
    end
endmodule
