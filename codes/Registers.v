`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 13:31:17
// Design Name: 
// Module Name: Registers
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


module Registers(
    clk,Ra,Rb,Rw,RegWr,data_in,bussA,bussB
    );
    input clk, RegWr;
    input [4:0]Ra,Rb,Rw;
    input [31:0]data_in;
    output [31:0]bussA, bussB;
    
    reg[31:0] registers[31:0];
    integer i;
    
    assign bussA = registers[Ra];
    assign bussB = registers[Rb];
    
    always @(negedge clk)  //ÏÂ½µÑØÐ´Èë
        if (RegWr && Rw)
            registers[Rw] <= data_in;
    
    initial 
        for(i = 0; i < 32; i = i + 1)
            registers[i] <= 0;
endmodule
