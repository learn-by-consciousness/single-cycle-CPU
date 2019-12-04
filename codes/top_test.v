//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Nov 26 15:18:35 2019
//Host        : DESKTOP-BA24NS3 running 64-bit major release  (build 9200)
//Command     : generate_target CPU.bd
//Design      : CPU
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps


module test_CPU
   (
    
    );
    reg clk;
    reg reset;

  wire [31:0]ALU_data;
  wire [31:0]DB;
  wire [31:0]PC;
  
  wire [31:0]nextPC;
  
  wire [4:0]rs;
  wire [31:0]rs_data;
  wire [4:0]rt;
  wire [31:0]rt_data;

  wire ALU_0_Sign;
  wire ALU_0_Zero;
  wire [31:0]ALU_0_result;
  wire [31:0]Registers_0_bussA;
  wire [31:0]Registers_0_bussB;
  wire clk_1;

  wire controlUnit_0_ALUSrcA;
  wire controlUnit_0_ALUSrcB;
  wire controlUnit_0_ExtSel;
  wire controlUnit_0_Jump;
  wire controlUnit_0_MemWr;
  wire controlUnit_0_PCWr;
  wire controlUnit_0_R_data_Src;
  wire controlUnit_0_RegSrc;
  wire controlUnit_0_RegWr;
  wire [2:0]controlUnit_0_aluOp;
  wire [1:0]controlUnit_0_btype;
  wire [31:0]dataMemory_0_Data_out;
  wire [5:0]decoder_0_fun;
  wire [15:0]decoder_0_imm16;
  wire [25:0]decoder_0_imm26;
  wire [5:0]decoder_0_op;
  wire [4:0]decoder_0_rd;
  wire [4:0]decoder_0_rs;
  wire [4:0]decoder_0_rt;
  wire [4:0]decoder_0_sa;
  wire [31:0]extend_16_0_imm32;
  wire [31:0]extend_sa_0_imm32;
  wire [31:0]instructionMemory_0_Instruction;
  wire [31:0]mux32_0_ret;
  wire [31:0]mux32_1_ret;
  wire [31:0]mux32_2_ret;
  wire [4:0]mux5_0_ret;
  wire [31:0]npc_0_PC;
  wire [31:0]npc_0_nextPC;
  wire reset_1;

  assign ALU_data[31:0] = ALU_0_result;
  assign DB[31:0] = mux32_2_ret;
  assign PC[31:0] = npc_0_PC;
  assign clk_1 = clk;
  assign nextPC[31:0] = npc_0_nextPC;
  assign reset_1 = reset;
  assign rs[4:0] = decoder_0_rs;
  assign rs_data[31:0] = Registers_0_bussA;
  assign rt[4:0] = decoder_0_rt;
  assign rt_data[31:0] = Registers_0_bussB;
  ALU ALU_0
       (.A(mux32_0_ret),
        .B(mux32_1_ret),
        .Sign(ALU_0_Sign),
        .Zero(ALU_0_Zero),
        .aluOp(controlUnit_0_aluOp),
        .result(ALU_0_result));
  Registers Registers_0
       (.Ra(decoder_0_rs),
        .Rb(decoder_0_rt),
        .RegWr(controlUnit_0_RegWr),
        .Rw(mux5_0_ret),
        .bussA(Registers_0_bussA),
        .bussB(Registers_0_bussB),
        .clk(clk_1),
        .data_in(mux32_2_ret));
  controlUnit controlUnit_0
       (.ALUSrcA(controlUnit_0_ALUSrcA),
        .ALUSrcB(controlUnit_0_ALUSrcB),
        .ExtSel(controlUnit_0_ExtSel),
        .Jump(controlUnit_0_Jump),
        .MemWr(controlUnit_0_MemWr),
        .PCWr(controlUnit_0_PCWr),
        .R_data_Src(controlUnit_0_R_data_Src),
        .RegSrc(controlUnit_0_RegSrc),
        .RegWr(controlUnit_0_RegWr),
        .aluOp(controlUnit_0_aluOp),
        .btype(controlUnit_0_btype),
        .fun(decoder_0_fun),
        .op(decoder_0_op));
  dataMemory dataMemory_0
       (.Addr(ALU_0_result),
        .Data_in(Registers_0_bussB),
        .Data_out(dataMemory_0_Data_out),
        .Men_Wr(controlUnit_0_MemWr),
        .clk(clk_1));
  decoder decoder_0
       (.fun(decoder_0_fun),
        .imm16(decoder_0_imm16),
        .imm26(decoder_0_imm26),
        .instruction(instructionMemory_0_Instruction),
        .op(decoder_0_op),
        .rd(decoder_0_rd),
        .rs(decoder_0_rs),
        .rt(decoder_0_rt),
        .sa(decoder_0_sa));
  extend_16 extend_16_0
       (.extsel(controlUnit_0_ExtSel),
        .imm16(decoder_0_imm16),
        .imm32(extend_16_0_imm32));
  extend_sa extend_sa_0
       (.imm32(extend_sa_0_imm32),
        .imm5(decoder_0_sa));
  instructionMemory instructionMemory_0
       (.Instruction(instructionMemory_0_Instruction),
        .ReadAddress(npc_0_PC));
  mux32 mux32_0
       (.ret(mux32_0_ret),
        .src(controlUnit_0_ALUSrcA),
        .src0(Registers_0_bussA),
        .src1(extend_sa_0_imm32));
  mux32 mux32_1
       (.ret(mux32_1_ret),
        .src(controlUnit_0_ALUSrcB),
        .src0(Registers_0_bussB),
        .src1(extend_16_0_imm32));
  mux32 mux32_2
       (.ret(mux32_2_ret),
        .src(controlUnit_0_R_data_Src),
        .src0(ALU_0_result),
        .src1(dataMemory_0_Data_out));
  mux5 mux5_0
       (.ret(mux5_0_ret),
        .src(controlUnit_0_RegSrc),
        .src0(decoder_0_rd),
        .src1(decoder_0_rt));
  npc npc_0
       (.Imm26(decoder_0_imm26),
        .Imm32(extend_16_0_imm32),
        .Jump(controlUnit_0_Jump),
        .PC(npc_0_PC),
        .PCwr(controlUnit_0_PCWr),
        .Sign(ALU_0_Sign),
        .Zero(ALU_0_Zero),
        .btype(controlUnit_0_btype),
        .clk(clk_1),
        .nextPC(npc_0_nextPC),
        .reset(reset_1));


    initial begin
        clk = 1;
        reset = 1;
        # 1 reset = 0;
    end

    always #2 begin
        clk = ~clk;
    end


endmodule
