`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 02:42:13 PM
// Design Name: 
// Module Name: MUX
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



module MUX3X1
    #(parameter N=128)(
    input [N-1:0] In1,
    input [N-1:0] In2,
    input [N-1:0] In3,
    input [1:0] sel,
    output reg [N-1:0] out
    );
    always @(*) begin
        case(sel)
            2'b00: out=In1;
            2'b01: out=In2;
            2'b11: out=In3;
            default: out = 2'bx;
        endcase
    end
endmodule
