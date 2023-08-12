`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 03:13:12 PM
// Design Name: 
// Module Name: MUX2
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


module MUX2X1
    #(parameter N=128)(
    input [N-1:0] In1,
    input [N-1:0] In2,
    input sel,
    output [N-1:0] out
    );
    assign out = sel ? In2 : In1;
endmodule