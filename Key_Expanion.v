`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2023 06:21:53 PM
// Design Name: 
// Module Name: Key_Expan
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


module Key_Expanion(
    input [127:0] Key,
    output reg [127:0] Key_OUT,
    input [3:0] Round
    );
    reg [7:0] RC [0:9];
    reg [7:0] key [0:15];
    reg [31:0] w [0:3];
    reg [31:0] out [0:3];
    reg [31:0] g;
    reg [7:0] b [0:3];
    reg [127:0] full_keys [0:10];
    reg start;
    integer i,k,n;
    always @(*) begin
        case(Round)
            0: Key_OUT = full_keys[0];
            1: Key_OUT = full_keys[1];
            2: Key_OUT = full_keys[2];
            3: Key_OUT = full_keys[3];
            4: Key_OUT = full_keys[4];
            5: Key_OUT = full_keys[5];
            6: Key_OUT = full_keys[6];
            7: Key_OUT = full_keys[7];
            8: Key_OUT = full_keys[8];
            9: Key_OUT = full_keys[9];
            10: Key_OUT = full_keys[10];
            default: Key_OUT=0;
        endcase
        full_keys[0]=Key;
        for (k=0;k<10;k=k+1) begin 
            RC[0] = 8'h01;
            RC[1] = 8'h02;
            RC[2] = 8'h04;
            RC[3] = 8'h08;
            RC[4] = 8'h10;
            RC[5] = 8'h20;
            RC[6] = 8'h40;
            RC[7] = 8'h80;
            RC[8] = 8'h1b;
            RC[9] = 8'h36;
            n=0;
            for(i=127;i>5;i=i-8) begin
                key[n] = full_keys[k][i -: 8];
                n=n+1;
            end
            for(i=0; i<4 ; i=i+1)
                w[i] = {key[4*i],key[4*i+1],key[4*i+2],key[4*i+3]};
            b[0]=key[13];
            b[1]=key[14];
            b[2]=key[15];
            b[3]=key[12];
            for(i=0;i<4;i=i+1) begin
            case (b[i])          //substitution table
                   8'h00              : b[i] = 8'h63;
                   8'h01              : b[i] = 8'h7c;
                   8'h02              : b[i] = 8'h77;
                   8'h03              : b[i] = 8'h7b;
                   8'h04              : b[i] = 8'hf2;
                   8'h05              : b[i] = 8'h6b;
                   8'h06              : b[i] = 8'h6f;
                   8'h07              : b[i] = 8'hc5;
                   8'h08              : b[i] = 8'h30;
                   8'h09              : b[i] = 8'h01;
                   8'h0a              : b[i] = 8'h67;
                   8'h0b              : b[i] = 8'h2b;
                   8'h0c              : b[i] = 8'hfe;
                   8'h0d              : b[i] = 8'hd7;
                   8'h0e              : b[i] = 8'hab;
                   8'h0f              : b[i] = 8'h76;
                /****************************************/
                   8'h10              : b[i] = 8'hca;
                   8'h11              : b[i] = 8'h82;
                   8'h12              : b[i] = 8'hc9;
                   8'h13              : b[i] = 8'h7d;
                   8'h14              : b[i] = 8'hfa;
                   8'h15              : b[i] = 8'h59;
                   8'h16              : b[i] = 8'h47;
                   8'h17              : b[i] = 8'hf0;
                   8'h18              : b[i] = 8'had;
                   8'h19              : b[i] = 8'hd4;
                   8'h1a              : b[i] = 8'ha2;
                   8'h1b              : b[i] = 8'haf;
                   8'h1c              : b[i] = 8'h9c;
                   8'h1d              : b[i] = 8'ha4;
                   8'h1e              : b[i] = 8'h72;
                   8'h1f              : b[i] = 8'hc0;
                /**********************************************/
                   8'h20              : b[i] = 8'hb7;
                   8'h21              : b[i] = 8'hfd;
                   8'h22              : b[i] = 8'h93;
                   8'h23              : b[i] = 8'h26;
                   8'h24              : b[i] = 8'h36;
                   8'h25              : b[i] = 8'h3f;
                   8'h26              : b[i] = 8'hf7;
                   8'h27              : b[i] = 8'hcc;
                   8'h28              : b[i] = 8'h34;
                   8'h29              : b[i] = 8'ha5;
                   8'h2a              : b[i] = 8'he5;
                   8'h2b              : b[i] = 8'hf1;
                   8'h2c              : b[i] = 8'h71;
                   8'h2d              : b[i] = 8'hd8;
                   8'h2e              : b[i] = 8'h31;
                   8'h2f              : b[i] = 8'h15;
                /*****************************************/
                   8'h30              : b[i] = 8'h04;
                   8'h31              : b[i] = 8'hc7;
                   8'h32              : b[i] = 8'h23;
                   8'h33              : b[i] = 8'hc3;
                   8'h34              : b[i] = 8'h18;
                   8'h35              : b[i] = 8'h96;
                   8'h36              : b[i] = 8'h05;
                   8'h37              : b[i] = 8'h9a;
                   8'h38              : b[i] = 8'h07;
                   8'h39              : b[i] = 8'h12;
                   8'h3a              : b[i] = 8'h80;
                   8'h3b              : b[i] = 8'he2;
                   8'h3c              : b[i] = 8'heb;
                   8'h3d              : b[i] = 8'h27;
                   8'h3e              : b[i] = 8'hb2;
                   8'h3f              : b[i] = 8'h75;
                /*******************************************/
                   8'h40              : b[i] = 8'h09;
                   8'h41              : b[i] = 8'h83;
                   8'h42              : b[i] = 8'h2c;
                   8'h43              : b[i] = 8'h1a;
                   8'h44              : b[i] = 8'h1b;
                   8'h45              : b[i] = 8'h6e;
                   8'h46              : b[i] = 8'h5a;
                   8'h47              : b[i] = 8'ha0;
                   8'h48              : b[i] = 8'h52;
                   8'h49              : b[i] = 8'h3b;
                   8'h4a              : b[i] = 8'hd6;
                   8'h4b              : b[i] = 8'hb3;
                   8'h4c              : b[i] = 8'h29;
                   8'h4d              : b[i] = 8'he3;
                   8'h4e              : b[i] = 8'h2f;
                   8'h4f              : b[i] = 8'h84;
                /**********************************************/
                   8'h50              : b[i] = 8'h53;
                   8'h51              : b[i] = 8'hd1;
                   8'h52              : b[i] = 8'h00;
                   8'h53              : b[i] = 8'hed;
                   8'h54              : b[i] = 8'h20;
                   8'h55              : b[i] = 8'hfc;
                   8'h56              : b[i] = 8'hb1;
                   8'h57              : b[i] = 8'h5b;
                   8'h58              : b[i] = 8'h6a;
                   8'h59              : b[i] = 8'hcb;
                   8'h5a              : b[i] = 8'hbe;
                   8'h5b              : b[i] = 8'h39;
                   8'h5c              : b[i] = 8'h4a;
                   8'h5d              : b[i] = 8'h4c;
                   8'h5e              : b[i] = 8'h58;
                   8'h5f              : b[i] = 8'hcf;
                   /****************************************/
                   8'h60              : b[i] = 8'hd0;
                   8'h61              : b[i] = 8'hef;
                   8'h62              : b[i] = 8'haa;
                   8'h63              : b[i] = 8'hfb;
                   8'h64              : b[i] = 8'h43;
                   8'h65              : b[i] = 8'h4d;
                   8'h66              : b[i] = 8'h33;
                   8'h67              : b[i] = 8'h85;
                   8'h68              : b[i] = 8'h45;
                   8'h69              : b[i] = 8'hf9;
                   8'h6a              : b[i] = 8'h02;
                   8'h6b              : b[i] = 8'h7f;
                   8'h6c              : b[i] = 8'h50;
                   8'h6d              : b[i] = 8'h3c;
                   8'h6e              : b[i] = 8'h9f;
                   8'h6f              : b[i] = 8'ha8;
                /*********************************************/
                   8'h70              : b[i] = 8'h51;
                   8'h71              : b[i] = 8'ha3;
                   8'h72              : b[i] = 8'h40;
                   8'h73              : b[i] = 8'h8f;
                   8'h74              : b[i] = 8'h92;
                   8'h75              : b[i] = 8'h9d;
                   8'h76              : b[i] = 8'h38;
                   8'h77              : b[i] = 8'hf5;
                   8'h78              : b[i] = 8'hbc;
                   8'h79              : b[i] = 8'hb6;
                   8'h7a              : b[i] = 8'hda;
                   8'h7b              : b[i] = 8'h21;
                   8'h7c              : b[i] = 8'h10;
                   8'h7d              : b[i] = 8'hff;
                   8'h7e              : b[i] = 8'hf3;
                   8'h7f              : b[i] = 8'hd2;
                /********************************************/
                   8'h80              : b[i] = 8'hcd;
                   8'h81              : b[i] = 8'h0c;
                   8'h82              : b[i] = 8'h13;
                   8'h83              : b[i] = 8'hec;
                   8'h84              : b[i] = 8'h5f;
                   8'h85              : b[i] = 8'h97;
                   8'h86              : b[i] = 8'h44;
                   8'h87              : b[i] = 8'h17;
                   8'h88              : b[i] = 8'hc4;
                   8'h89              : b[i] = 8'ha7;
                   8'h8a              : b[i] = 8'h7e;
                   8'h8b              : b[i] = 8'h3d;
                   8'h8c              : b[i] = 8'h64;
                   8'h8d              : b[i] = 8'h5d;
                   8'h8e              : b[i] = 8'h19;
                   8'h8f              : b[i] = 8'h73;
             /***********************************************/
                   8'h90              : b[i] = 8'h60;
                   8'h91              : b[i] = 8'h81;
                   8'h92              : b[i] = 8'h4f;
                   8'h93              : b[i] = 8'hdc;
                   8'h94              : b[i] = 8'h22;
                   8'h95              : b[i] = 8'h2a;
                   8'h96              : b[i] = 8'h90;
                   8'h97              : b[i] = 8'h88;
                   8'h98              : b[i] = 8'h46;
                   8'h99              : b[i] = 8'hee;
                   8'h9a              : b[i] = 8'hb8;
                   8'h9b              : b[i] = 8'h14;
                   8'h9c              : b[i] = 8'hde;
                   8'h9d              : b[i] = 8'h5e;
                   8'h9e              : b[i] = 8'h0b;
                   8'h9f              : b[i] = 8'hdb;
                  /******************************************/
                   8'ha0              : b[i] = 8'he0;
                   8'ha1              : b[i] = 8'h32;
                   8'ha2              : b[i] = 8'h3a;
                   8'ha3              : b[i] = 8'h0a;
                   8'ha4              : b[i] = 8'h49;
                   8'ha5              : b[i] = 8'h06;
                   8'ha6              : b[i] = 8'h24;
                   8'ha7              : b[i] = 8'h5c;
                   8'ha8              : b[i] = 8'hc2;
                   8'ha9              : b[i] = 8'hd3;
                   8'haa              : b[i] = 8'hac;
                   8'hab              : b[i] = 8'h62;
                   8'hac              : b[i] = 8'h91;
                   8'had              : b[i] = 8'h95;
                   8'hae              : b[i] = 8'he4;
                   8'haf              : b[i] = 8'h79;
                /******************************************/
                   8'hb0              : b[i] = 8'he7;
                   8'hb1              : b[i] = 8'hc8;
                   8'hb2              : b[i] = 8'h37;
                   8'hb3              : b[i] = 8'h6d;
                   8'hb4              : b[i] = 8'h8d;
                   8'hb5              : b[i] = 8'hd5;
                   8'hb6              : b[i] = 8'h4e;
                   8'hb7              : b[i] = 8'ha9;
                   8'hb8              : b[i] = 8'h6c;
                   8'hb9              : b[i] = 8'h56;
                   8'hba              : b[i] = 8'hf4;
                   8'hbb              : b[i] = 8'hea;
                   8'hbc              : b[i] = 8'h65;
                   8'hbd              : b[i] = 8'h7a;
                   8'hbe              : b[i] = 8'hae;
                   8'hbf              : b[i] = 8'h08;
                /****************************************/
                   8'hc0              : b[i] = 8'hba;
                   8'hc1              : b[i] = 8'h78;
                   8'hc2              : b[i] = 8'h25;
                   8'hc3              : b[i] = 8'h2e;
                   8'hc4              : b[i] = 8'h1c;
                   8'hc5              : b[i] = 8'ha6;
                   8'hc6              : b[i] = 8'hb4;
                   8'hc7              : b[i] = 8'hc6;
                   8'hc8              : b[i] = 8'he8;
                   8'hc9              : b[i] = 8'hdd;
                   8'hca              : b[i] = 8'h74;
                   8'hcb              : b[i] = 8'h1f;
                   8'hcc              : b[i] = 8'h4b;
                   8'hcd              : b[i] = 8'hbd;
                   8'hce              : b[i] = 8'h8b;
                   8'hcf              : b[i] = 8'h8a;
                /****************************************/
                   8'hd0              : b[i] = 8'h70;
                   8'hd1              : b[i] = 8'h3e;
                   8'hd2              : b[i] = 8'hb5;
                   8'hd3              : b[i] = 8'h66;
                   8'hd4              : b[i] = 8'h48;
                   8'hd5              : b[i] = 8'h03;
                   8'hd6              : b[i] = 8'hf6;
                   8'hd7              : b[i] = 8'h0e;
                   8'hd8              : b[i] = 8'h61;
                   8'hd9              : b[i] = 8'h35;
                   8'hda              : b[i] = 8'h57;
                   8'hdb              : b[i] = 8'hb9;
                   8'hdc              : b[i] = 8'h86;
                   8'hdd              : b[i] = 8'hc1;
                   8'hde              : b[i] = 8'h1d;
                   8'hdf              : b[i] = 8'h9e;
                /*******************************************/
                   8'he0              : b[i] = 8'he1;
                   8'he1              : b[i] = 8'hf8;
                   8'he2              : b[i] = 8'h98;
                   8'he3              : b[i] = 8'h11;
                   8'he4              : b[i] = 8'h69;
                   8'he5              : b[i] = 8'hd9;
                   8'he6              : b[i] = 8'h8e;
                   8'he7              : b[i] = 8'h94;
                   8'he8              : b[i] = 8'h9b;
                   8'he9              : b[i] = 8'h1e;
                   8'hea              : b[i] = 8'h87;
                   8'heb              : b[i] = 8'he9;
                   8'hec              : b[i] = 8'hce;
                   8'hed              : b[i] = 8'h55;
                   8'hee              : b[i] = 8'h28;
                   8'hef              : b[i] = 8'hdf;
                /****************************************/
                   8'hf0              : b[i] = 8'h8c;
                   8'hf1              : b[i] = 8'ha1;
                   8'hf2              : b[i] = 8'h89;
                   8'hf3              : b[i] = 8'h0d;
                   8'hf4              : b[i] = 8'hbf;
                   8'hf5              : b[i] = 8'he6;
                   8'hf6              : b[i] = 8'h42;
                   8'hf7              : b[i] = 8'h68;
                   8'hf8              : b[i] = 8'h41;
                   8'hf9              : b[i] = 8'h99;
                   8'hfa              : b[i] = 8'h2d;
                   8'hfb              : b[i] = 8'h0f;
                   8'hfc              : b[i] = 8'hb0;
                   8'hfd              : b[i] = 8'h54;
                   8'hfe              : b[i] = 8'hbb;
                   8'hff              : b[i] = 8'h16;
                   default            : b[i] = 8'h00;
                   
                endcase
            end
            b[0] = b[0]^RC[k];
            g={b[0],b[1],b[2],b[3]};
            out[0] = w[0]^g;
            out[1] = out[0]^w[1];
            out[2] = out[1]^w[2];
            out[3] = out[2]^w[3];
            full_keys[k+1] = {out[0],out[1],out[2],out[3]};
        end
    end
endmodule
