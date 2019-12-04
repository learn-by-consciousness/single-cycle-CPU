`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/20 09:33:34
// Design Name: 
// Module Name: npc
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


/*

btype:
    00  no brunch
    01  beq
    10  bne
    11  bltz

*/
module npc(
    clk,reset,Zero,Jump,Imm32,Imm26,PC,nextPC,btype,Sign,PCwr
    );
    input clk,reset,Zero,Jump,Sign,PCwr;
    input [31:0]Imm32;
    input [25:0]Imm26;
    input [1:0]btype;
    output [31:0]PC;
    output [31:0]nextPC;
    reg [31:0]PC;
    reg [31:0]nextPC;
    
    always @(posedge clk, posedge reset)//…œ…˝—ÿ–¥»Î
    begin
        if(PCwr)
            PC=nextPC;  
        if(reset)
            PC = 0;
    end
    
    
    always @(btype, Sign, Imm26, Imm32, Jump, Zero, PC, reset, PCwr)begin
        nextPC = PC + 4;
        if(Jump)
            nextPC = {nextPC[31:28],Imm26,2'b0}; 
        else 
            case (btype)
                2'b00:begin end //no brunch
                2'b01:  //beq
                   if(Zero)
                        nextPC = nextPC + (Imm32 << 2);
                2'b10: //bne
                    if(!Zero)
                        nextPC = nextPC + (Imm32 << 2);
                2'b11: //bltz
                    if(Sign)
                        nextPC = nextPC + (Imm32 << 2);
            endcase
        if(reset)
            nextPC = 0;
        if(~PCwr)
            nextPC = PC;
    end

    initial begin
        PC <= 0;
        nextPC <= 0;
    end
endmodule
