`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 16:13:30
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
        clk, Data_in, Addr, Men_Wr, Data_out
    );
    input clk;
    input [31:0]Data_in;
    input [31:0]Addr;
    input Men_Wr;
    output [31:0]Data_out;
    
    integer i;
    reg [7:0] memory [0:1023];      // 1024 bytes
    assign Data_out = Addr<1021?{memory[Addr],memory[Addr+1],memory[Addr+2],memory[Addr+3]}:32'h0;

    always @(negedge clk)begin //ÏÂ½µÑØÐ´Èë
        if(Men_Wr==1)begin
            memory[Addr] = Data_in[31:24];
            memory[Addr+1] = Data_in[23:16];
            memory[Addr+2] = Data_in[15:8];
            memory[Addr+3] = Data_in[7:0];
        end
    end
    
    initial begin
        $readmemh("D:/10593/Desktop/code.txt",memory);
    end
endmodule