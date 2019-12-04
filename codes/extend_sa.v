`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 21:36:56
// Design Name: 
// Module Name: extend_sa
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


module extend_sa(
        imm5,imm32
    );
    input [4:0]imm5;
    output [31:0]imm32;
    assign imm32 = {27'b0, imm5};
endmodule

