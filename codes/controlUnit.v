`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 21:41:37
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
        op,fun,aluOp,ALUSrcA,ALUSrcB,MemWr,RegWr,ExtSel,btype,RegSrc,R_data_Src,PCWr,Jump
    );
    input [5:0]op;
    input [5:0]fun;
    output [2:0]aluOp;
    output [1:0]btype;
    output ALUSrcA, ALUSrcB, MemWr,RegWr,ExtSel,RegSrc,R_data_Src,PCWr,Jump;
    reg ALUSrcA, ALUSrcB, MemWr,RegWr,ExtSel,RegSrc,R_data_Src;
    reg [2:0]aluOp;
    reg [1:0]btype;
    
    assign PCWr = (op==6'b111111)?0:1;
    assign Jump = (op==6'b000010)?1:0;
   
    always @(*)begin 
        //缺省参数,适用于halt与j
        ALUSrcA=0;      //rs
        ALUSrcB=0;      //rt
        MemWr=0;        //no write
        RegWr=0;        //no write
        ExtSel=0;       //zero extend
        RegSrc=0;       //write into rd
        R_data_Src=0;   //write from alu
        btype = 0;      //no brunch
        aluOp = 0;      //add
        
        //ALUSrcA, ALUSrcB, MemWr,RegWr,ExtSel,RegSrc,R_data_Src
        if(op==6'b000100 || op==6'b000101 || op==6'b000001)begin
            ExtSel = 1; //sign ext
            aluOp = 1;  //sub
            case (op)   
                6'b000100: btype = 1;  //beq
                6'b000101: btype = 2;  //bne
                6'b000001: btype = 3;  //bltz
            endcase
        end
        
        // R - type
        if(op==0)begin
            RegWr = 1;  // write into register
            case (fun)
                6'b100000:aluOp = 0;    //add
                6'b100010:aluOp = 1;    //sub
                6'b100100:aluOp = 2;    //and
                6'b100101:aluOp = 3;    //or
                6'b000000:begin         //sll
                    aluOp = 4;      
                    ALUSrcA = 1;        //using sa
                end
            endcase
        end
        
        // I - type
        if(op==6'b001001||op==6'b001100 || op==6'b001101)begin  //ps: they are all zero-ext, including addiu
            RegWr = 1;      //write into register
            ALUSrcB = 1;    //using imm16
            RegSrc = 1;     //write into rt
            case (op)
                6'b001001:ExtSel= 1;    //addiu
                6'b001100:aluOp = 2;    //andi
                6'b001101:aluOp = 3;    //ori
            endcase
        end
        
        if(op==6'b001010)begin  //stli
            RegWr = 1;      //write into register
            ALUSrcB = 1;    //using imm16
            ExtSel = 1;     //using sign-ext(imm16)
            RegSrc = 1;     //write into rt
            aluOp = 5;      
        end
        
        if(op==6'b101011)begin //sw
            ALUSrcB = 1;    //using imm16
            ExtSel = 1;     //using sign-ext(imm16)
            MemWr = 1;      //write into mem
        end
        
        if(op==6'b100011)begin   //lw
            ALUSrcB = 1;    //using imm16
            ExtSel = 1;     //using sign-ext(imm16)
            RegWr = 1;      //write into register
            RegSrc = 1;     //write into rd
            R_data_Src = 1; //write from dataMemory
        end
    end
endmodule
