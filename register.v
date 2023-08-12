`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 02:32:44 PM
// Design Name: 
// Module Name: register
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


module register(
    input done,
    input [127:0] data,
    input reset,
    output reg [127:0] cipher
    );
    always @(done,reset)
        if(reset)
            cipher = 0;
        else if(done)
            cipher = data;
        else
            cipher = 0;
endmodule
