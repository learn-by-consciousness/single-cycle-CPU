`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 20:06:45
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory(
        ReadAddress, Instruction
    );
    input [31:0]ReadAddress;
    output [31:0]Instruction;
    
    reg [7:0] memory[0:255];
    
    assign Instruction = ReadAddress<253?{ memory[ReadAddress], memory[ReadAddress+1], memory[ReadAddress+2], memory[ReadAddress+3]}:32'HFC000000;
    
    initial begin
        $readmemh("D:/10593/Desktop/hex.txt",memory);
    end
    
endmodule
