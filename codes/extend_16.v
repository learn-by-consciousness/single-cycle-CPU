`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 16:18:16
// Design Name: 
// Module Name: extend_16
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


module extend_16(
        imm16,extsel,imm32
    );
    input [15:0]imm16;
    input extsel;
    output [31:0]imm32;
    assign imm32 = extsel? {{16{imm16[15]}},imm16}:{16'b0,imm16};

endmodule
