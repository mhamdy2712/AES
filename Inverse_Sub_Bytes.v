`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2023 12:56:37 AM
// Design Name: 
// Module Name: Inverse_Sub_Bytes
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


module Inverse_Sub_Bytes(
    input [127:0] Data,
    output [127:0] dout
    );
    genvar i;
    generate
        for(i=0;i<128;i=i+8) begin :InversesubBytes
            Inverse_SBox s(Data[i+:8],dout[i+:8]);
        end
    endgenerate
endmodule
