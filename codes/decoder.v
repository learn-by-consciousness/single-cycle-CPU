`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 22:11:12
// Design Name: 
// Module Name: decoder
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


module decoder(
    instruction, rs, rt, rd, imm16, op, sa, fun, imm26
    );
    input [31:0]instruction;
    output [4:0]rs;
    output [4:0]rt;
    output [4:0]rd;
    output [15:0]imm16;
    output [25:0]imm26;
    output [4:0]sa;
    output [5:0]op;
    output [5:0]fun;
    
    assign op = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign sa = instruction[10:6];
    assign fun = instruction[5:0];
    assign imm16 = instruction[15:0];
    assign imm26 = instruction[25:0];
endmodule
