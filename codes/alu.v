`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 11:56:51
// Design Name: 
// Module Name: alu
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


module ALU(
        A,B,aluOp,result,Zero,Sign
    );
    input [2:0]aluOp;
    output [31:0]result;
    input [31:0]A;
    input [31:0]B;
    reg [31:0]result;
    reg [31:0]temp;
    output Zero;
    output Sign;
    assign Zero = (result==0)?1:0;
    assign Sign = result[31];
    
    always @(A,B,aluOp)begin
        case(aluOp)
            0:result = A + B;   // add
            1:result = A - B;   // sub
            2:result = A & B;   // and
            3:result = A | B;   // or
            4:result = B << A;  // sll     
            5:                  //slti
            result = (((A < B) && (A[31] == B[31] )) ||( ( A[31] ==1 && B[31] == 0))) ? 1:0;
        endcase
    end
    
endmodule
