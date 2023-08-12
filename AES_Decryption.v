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


module AES_Decryption(
    input [127:0] data,
    input [127:0] key,
    output done,
    input start,
    input reset,
    input clk,
    output [127:0] decrypted_data
    );
    wire [127:0] round_out,rounddata_in,subs_out,SR_out,Mix_out,SR_IN;
    wire [127:0] keyexpan_out;
    wire rst,done1,cntdone,done2,done3;
    wire [1:0] rounddatasel = {done1,done2};
    wire [3:0] counts;
    assign done = cntdone;
    MUX2X1 Rowin(
    .In1(round_out),
    .In2(Mix_out),
    .sel(done3),
    .out(SR_IN)
    );
    MUX2X1 addrounddata(
    .In1(data),
    .In2(subs_out),
    .sel(done2),
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
    Inverse_Sub_Bytes sd (
    .Data(SR_out),
    .dout(subs_out)
    );
    Inverse_Shift_Row SR (
    .Data(SR_IN),
    .Data_OUT(SR_out)
    );
    Inverse_MixColumns MC(
    .Data(round_out),
    .Data_OUT(Mix_out)
    );
    Counter cnt(
    .reset_n(rst),
    .reset(reset),
    .clk(clk),
    .count(counts),
    .done(cntdone),
    .done1(done1),
    .done2(done2),
    .done3(done3)
    );
    register myreg (
    .done(cntdone),
    .data(round_out),
    .reset(reset),
    .cipher(decrypted_data)
    );
    Key_Expanion KE (
    .Key(key),
    .Key_OUT(keyexpan_out),
    .Round(10-counts)
    );
endmodule
