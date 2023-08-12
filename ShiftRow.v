`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2023 03:09:49 PM
// Design Name: 
// Module Name: ShiftRow
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


module ShiftRow(
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
        Data_OUT = {a[0],a[5],a[10],a[15],a[4],a[9],a[14],a[3],a[8],a[13],a[2],a[7],a[12],a[1],a[6],a[11]};
    end
endmodule
