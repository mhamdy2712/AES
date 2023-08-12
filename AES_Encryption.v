`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 02:41:40 PM
// Design Name: 
// Module Name: AES
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


module AES_Encryption(
    input [127:0] data,
    input [127:0] key,
    output done,
    input start,
    input clk,
    input reset,
    output [127:0] cipher
    );
    wire [127:0] round_out,rounddata_in,subs_out,SR_out,Mix_out;
    wire [127:0] keyexpan_out;
    wire rst,done1,cntdone,done2;
    wire [1:0] rounddatasel = {done1,done2};
    wire [3:0] counts;
    assign done = cntdone;
    MUX3X1 addrounddata(
    .In1(data),
    .In2(Mix_out),
    .In3(SR_out),
    .sel(rounddatasel),
    .out(rounddata_in)
    );
    Add_Round_Key ark(
    .Data(rounddata_in),
    .Key(keyexpan_out),
    .clk(clk),
    .start(start),
    .rst_counter(rst),
    .out_round(round_out)
    );
    subs_data sd (
    .Data(round_out),
    .dout(subs_out)
    );
    ShiftRow SR (
    .Data(subs_out),
    .Data_OUT(SR_out)
    );
    Mix_Col MC(
    .Data(SR_out),
    .Data_OUT(Mix_out)
    );
    Counter cnt(
    .reset_n(rst),
    .reset(reset),
    .clk(clk),
    .count(counts),
    .done(cntdone),
    .done1(done1),
    .done2(done2)
    );
    register myreg (
    .done(cntdone),
    .data(round_out),
    .reset(reset),
    .cipher(cipher)
    );
    Key_Expanion KE (
    .Key(key),
    .Key_OUT(keyexpan_out),
    .Round(counts)
    );
endmodule
