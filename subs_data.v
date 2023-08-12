/*
Project        : AES
Standard doc.  : 
Module name    : SBox block
Dependancy     :
Design doc.    : 
References     : 
Description    : Sbox is a lookup/substitution table to 
                 substitute the input byte
Owner          : Omar Amin
*/

`timescale 1 ns/1 ps

module subs_data               
(
// input clk,               //system clock
// input reset,             //asynch active low reset
// input valid_in,          //valid input signal
input [127:0] Data,        //SBox input byte
output [127:0] dout    //SBox output
);
genvar i;
generate
    for(i=0;i<128;i=i+8) begin :subBytes
        SBox s(Data[i+:8],dout[i+:8]);
    end
endgenerate
endmodule 
