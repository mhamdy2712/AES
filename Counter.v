`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 12:59:49 PM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk,
    input reset_n,
    input reset,
    output [3:0] count,
    output done,
    output done2,
    output done3,
    output done1
    );
    reg [3:0] counts,counts_next;
    reg en;
    assign count = counts;
    always @(posedge clk , negedge reset_n,posedge reset)
    begin
        if(reset) begin
            counts <= 0;
            en <=0; end
        else if(~reset_n) begin
            counts <= 0;
            en <=1; end
        else if(en) begin
            counts <= counts_next;  
        end
    end
    always@(*) begin
        if(~done)
            counts_next = counts +1;
        else
            counts_next = counts;
    end
    assign done = counts == 12;
    assign done2 = counts>0;
    assign done3 = count >1;
    assign done1 = counts == 10;
endmodule
