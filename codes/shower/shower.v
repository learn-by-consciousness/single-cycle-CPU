`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/27 08:05:29
// Design Name: 
// Module Name: shower
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


module shower(
    input clk_hand,
    input [1:0]sw_hand,
    input clk_machine,
    input reset,
    output [3:0]ands,
    output [7:0]light
    );
    
  wire [31:0]ALU_data;
  wire [31:0]DB;
  wire [31:0]PC;
  wire [31:0]nextPC;
  wire [4:0]rs;
  wire [31:0]rs_data;
  wire [4:0]rt;
  wire [31:0]rt_data;

    CPU mycpu(
    .clk(clk_hand),
    .reset(reset),
    
    .ALU_data(ALU_data),
    .DB(DB),
    .PC(PC),
    .nextPC(nextPC),
    .rs(rs),
    .rs_data(rs_data),
    .rt(rt),
    .rt_data(rt_data)
    );
    
    wire [15:0]num0;
    wire [15:0]num1;
    wire [15:0]num2;
    wire [15:0]num3;
    
    
    binding_32_32 getNum0(
        .data1(PC), .data2(nextPC), .data(num0)
    );
    
    binding_5_32 getNum1(
        .data1(rs), .data2(rs_data), .data(num1)
    );
    
    binding_5_32 getNum2(
        .data1(rt), .data2(rt_data), .data(num2)
    );
    
    binding_32_32 getNum3(
    .data1(ALU_data), .data2(DB), .data(num3)
    );
    
    wire [15:0]tobeprint;
    wire [1:0]the_sw;
    
    selector the_selector(
        .data0(num0),
        .data1(num1),
        .data2(num2),
        .data3(num3),
        .data_out(tobeprint),
        .sw(sw_hand)
    );
    
    clk_div divider(
        .I_clk(clk_machine), //100MHz
        .sw(the_sw),
        .ands(ands)
    );
    
    wire [7:0]the_display_data;
    assign the_display_data = (the_sw[1])?(the_sw[0]?tobeprint[15:12]:tobeprint[11:8]):(the_sw[0]?tobeprint[7:4]:tobeprint[3:0]);
    
    led thelight( .display_data(the_display_data), .dispcode(light) );
    
    
endmodule
