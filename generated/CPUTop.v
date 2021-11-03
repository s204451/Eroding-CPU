module ProgramCounter(
  input         clock,
  input         reset,
  input         io_stop,
  input         io_jump,
  input         io_run,
  input  [15:0] io_programCounterJump,
  output [15:0] io_programCounter
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] programCounterReg; // @[ProgramCounter.scala 14:34]
  wire  _T = ~io_run; // @[ProgramCounter.scala 16:19]
  wire  _T_1 = io_stop | _T; // @[ProgramCounter.scala 16:16]
  wire [15:0] _T_3 = io_programCounter + 16'h1; // @[ProgramCounter.scala 22:46]
  assign io_programCounter = programCounterReg; // @[ProgramCounter.scala 25:21]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  programCounterReg = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      programCounterReg <= 16'h0;
    end else if (_T_1) begin
      programCounterReg <= io_programCounter;
    end else if (io_jump) begin
      programCounterReg <= io_programCounterJump;
    end else begin
      programCounterReg <= _T_3;
    end
  end
endmodule
module DataMemory(
  input         clock,
  input  [15:0] io_address,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  output [31:0] io_dataRead,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:19]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:19]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:19]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:19]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:19]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:19]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:19]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:19]
  wire  memory__T_1_en; // @[DataMemory.scala 18:19]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:19]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:19]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:19]
  wire  memory__T_3_en; // @[DataMemory.scala 18:19]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 24:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 32:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:19]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:19]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 23:17 DataMemory.scala 30:17 DataMemory.scala 34:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 22:23 DataMemory.scala 26:25 DataMemory.scala 31:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:19]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:19]
    end
  end
endmodule
module ProgramMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_instructionRead,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_2_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_2_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_1_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_1_addr; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_mask; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_en; // @[ProgramMemory.scala 16:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[ProgramMemory.scala 22:32]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign io_instructionRead = io_testerEnable ? 32'h0 : memory__T_2_data; // @[ProgramMemory.scala 21:24 ProgramMemory.scala 28:24]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[ProgramMemory.scala 20:23 ProgramMemory.scala 24:25 ProgramMemory.scala 29:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[ProgramMemory.scala 16:20]
    end
  end
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input  [2:0]  io_aSel,
  input  [2:0]  io_bSel,
  input  [31:0] io_writeData,
  input         io_writeEnable,
  output [31:0] io_a,
  output [31:0] io_b
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] R0Reg; // @[RegisterFile.scala 17:22]
  reg [31:0] R1Reg; // @[RegisterFile.scala 18:22]
  reg [31:0] R2Reg; // @[RegisterFile.scala 19:22]
  reg [31:0] R3Reg; // @[RegisterFile.scala 20:22]
  reg [31:0] R4Reg; // @[RegisterFile.scala 21:22]
  reg [31:0] R5Reg; // @[RegisterFile.scala 22:22]
  reg [31:0] R6Reg; // @[RegisterFile.scala 23:22]
  reg [31:0] R7Reg; // @[RegisterFile.scala 24:22]
  wire  _T = 3'h0 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h2 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h3 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h4 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h5 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h6 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h7 == io_aSel; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_8 = _T_7 ? R7Reg : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_10 = _T_6 ? R6Reg : _GEN_8; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_13 = _T_5 ? R5Reg : _GEN_10; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_17 = _T_4 ? R4Reg : _GEN_13; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_22 = _T_3 ? R3Reg : _GEN_17; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_28 = _T_2 ? R2Reg : _GEN_22; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_35 = _T_1 ? R1Reg : _GEN_28; // @[Conditional.scala 39:67]
  wire  _T_8 = 3'h0 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_9 = 3'h1 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_10 = 3'h2 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h3 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_12 = 3'h4 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_13 = 3'h5 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_14 = 3'h6 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_15 = 3'h7 == io_bSel; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_52 = _T_15 ? R7Reg : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_53 = _T_14 ? R6Reg : _GEN_52; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_54 = _T_13 ? R5Reg : _GEN_53; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_55 = _T_12 ? R4Reg : _GEN_54; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_56 = _T_11 ? R3Reg : _GEN_55; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_57 = _T_10 ? R2Reg : _GEN_56; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_58 = _T_9 ? R1Reg : _GEN_57; // @[Conditional.scala 39:67]
  assign io_a = _T ? R0Reg : _GEN_35; // @[RegisterFile.scala 26:8 RegisterFile.scala 34:12 RegisterFile.scala 37:12 RegisterFile.scala 43:12 RegisterFile.scala 49:12 RegisterFile.scala 55:12 RegisterFile.scala 61:12 RegisterFile.scala 67:12 RegisterFile.scala 73:12]
  assign io_b = _T_8 ? R0Reg : _GEN_58; // @[RegisterFile.scala 27:8 RegisterFile.scala 82:12 RegisterFile.scala 85:12 RegisterFile.scala 88:12 RegisterFile.scala 91:12 RegisterFile.scala 94:12 RegisterFile.scala 97:12 RegisterFile.scala 100:12 RegisterFile.scala 103:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  R0Reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  R1Reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  R2Reg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  R3Reg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  R4Reg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  R5Reg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  R6Reg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  R7Reg = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      R0Reg <= 32'h0;
    end else if (_T) begin
      if (io_writeEnable) begin
        R0Reg <= io_writeData;
      end
    end
    if (reset) begin
      R1Reg <= 32'h0;
    end else if (!(_T)) begin
      if (_T_1) begin
        if (io_writeEnable) begin
          R1Reg <= io_writeData;
        end
      end
    end
    if (reset) begin
      R2Reg <= 32'h0;
    end else if (!(_T)) begin
      if (!(_T_1)) begin
        if (_T_2) begin
          if (io_writeEnable) begin
            R2Reg <= io_writeData;
          end
        end
      end
    end
    if (reset) begin
      R3Reg <= 32'h0;
    end else if (!(_T)) begin
      if (!(_T_1)) begin
        if (!(_T_2)) begin
          if (_T_3) begin
            if (io_writeEnable) begin
              R3Reg <= io_writeData;
            end
          end
        end
      end
    end
    if (reset) begin
      R4Reg <= 32'h0;
    end else if (!(_T)) begin
      if (!(_T_1)) begin
        if (!(_T_2)) begin
          if (!(_T_3)) begin
            if (_T_4) begin
              if (io_writeEnable) begin
                R4Reg <= io_writeData;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      R5Reg <= 32'h0;
    end else if (!(_T)) begin
      if (!(_T_1)) begin
        if (!(_T_2)) begin
          if (!(_T_3)) begin
            if (!(_T_4)) begin
              if (_T_5) begin
                if (io_writeEnable) begin
                  R5Reg <= io_writeData;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      R6Reg <= 32'h0;
    end else if (!(_T)) begin
      if (!(_T_1)) begin
        if (!(_T_2)) begin
          if (!(_T_3)) begin
            if (!(_T_4)) begin
              if (!(_T_5)) begin
                if (_T_6) begin
                  if (io_writeEnable) begin
                    R6Reg <= io_writeData;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      R7Reg <= 32'h0;
    end else if (!(_T)) begin
      if (!(_T_1)) begin
        if (!(_T_2)) begin
          if (!(_T_3)) begin
            if (!(_T_4)) begin
              if (!(_T_5)) begin
                if (!(_T_6)) begin
                  if (_T_7) begin
                    if (io_writeEnable) begin
                      R7Reg <= io_writeData;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
module ControlUnit(
  input  [3:0] io_opcode,
  output [2:0] io_aluOp,
  output       io_memWrite,
  output       io_writeEnable,
  output       io_loadMemory,
  output       io_jumpConditional,
  output       io_jump,
  output       io_loadImmediate,
  output       io_done
);
  wire  _T = 4'h0 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h1 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h2 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_3 = 4'h3 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h4 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_5 = 4'h5 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h6 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h7 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h8 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_9 = 4'h9 == io_opcode; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_0 = _T_9 ? 3'h4 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_2 = _T_8 ? 3'h5 : _GEN_0; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_8 | _T_9; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_5 = _T_7 ? 3'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_7 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_6 ? 1'h0 : _T_7; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_9 = _T_6 ? 3'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_6 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_5 ? 1'h0 : _T_6; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_5 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_14 = _T_5 ? 3'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_5 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_4 | _T_5; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_4 ? 1'h0 : _T_5; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_4 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_4 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_21 = _T_4 ? 3'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_4 ? 1'h0 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_3 ? 3'h3 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_3 | _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_3 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_3 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_3 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_3 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_30 = _T_2 ? 3'h2 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_2 | _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_2 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_2 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_2 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_2 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_2 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_37 = _T_1 ? 3'h1 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_1 | _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_1 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_1 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_1 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_1 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_1 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  assign io_aluOp = _T ? 3'h0 : _GEN_37; // @[ControlUnit.scala 18:12 ControlUnit.scala 33:16 ControlUnit.scala 37:16 ControlUnit.scala 41:16 ControlUnit.scala 59:16 ControlUnit.scala 63:16]
  assign io_memWrite = _T ? 1'h0 : _GEN_41; // @[ControlUnit.scala 19:15 ControlUnit.scala 53:19]
  assign io_writeEnable = _T ? 1'h0 : _GEN_38; // @[ControlUnit.scala 20:18 ControlUnit.scala 34:22 ControlUnit.scala 38:22 ControlUnit.scala 42:22 ControlUnit.scala 46:22 ControlUnit.scala 50:22]
  assign io_loadMemory = _T ? 1'h0 : _GEN_40; // @[ControlUnit.scala 21:17 ControlUnit.scala 49:21]
  assign io_jumpConditional = _T ? 1'h0 : _GEN_43; // @[ControlUnit.scala 23:22 ControlUnit.scala 60:26 ControlUnit.scala 64:26]
  assign io_jump = _T ? 1'h0 : _GEN_42; // @[ControlUnit.scala 22:11 ControlUnit.scala 56:15]
  assign io_loadImmediate = _T ? 1'h0 : _GEN_39; // @[ControlUnit.scala 24:20 ControlUnit.scala 45:24]
  assign io_done = 4'h0 == io_opcode; // @[ControlUnit.scala 25:11 ControlUnit.scala 30:15]
endmodule
module ALU(
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  input  [2:0]  io_sel,
  output [31:0] io_result,
  output        io_compResult
);
  wire  _T = io_sel == 3'h1; // @[ALU.scala 17:16]
  wire [31:0] _T_2 = io_operand1 + io_operand2; // @[ALU.scala 18:30]
  wire  _T_3 = io_sel == 3'h2; // @[ALU.scala 19:23]
  wire [31:0] _T_5 = io_operand1 - io_operand2; // @[ALU.scala 20:30]
  wire  _T_6 = io_sel == 3'h3; // @[ALU.scala 21:23]
  wire [63:0] _T_7 = io_operand1 * io_operand2; // @[ALU.scala 22:30]
  wire  _T_8 = io_sel == 3'h4; // @[ALU.scala 23:22]
  wire  _T_11 = _T_5 == 32'h0; // @[ALU.scala 24:48]
  wire  _T_12 = io_sel == 3'h5; // @[ALU.scala 25:22]
  wire  _T_13 = io_operand1 > io_operand2; // @[ALU.scala 26:35]
  wire  _GEN_0 = _T_12 & _T_13; // @[ALU.scala 25:30]
  wire  _GEN_1 = _T_8 ? _T_11 : _GEN_0; // @[ALU.scala 23:31]
  wire [63:0] _GEN_2 = _T_6 ? _T_7 : {{32'd0}, io_operand2}; // @[ALU.scala 21:32]
  wire  _GEN_3 = _T_6 ? 1'h0 : _GEN_1; // @[ALU.scala 21:32]
  wire [63:0] _GEN_4 = _T_3 ? {{32'd0}, _T_5} : _GEN_2; // @[ALU.scala 19:32]
  wire  _GEN_5 = _T_3 ? 1'h0 : _GEN_3; // @[ALU.scala 19:32]
  wire [63:0] _GEN_6 = _T ? {{32'd0}, _T_2} : _GEN_4; // @[ALU.scala 17:25]
  assign io_result = _GEN_6[31:0]; // @[ALU.scala 14:13 ALU.scala 18:15 ALU.scala 20:15 ALU.scala 22:15]
  assign io_compResult = _T ? 1'h0 : _GEN_5; // @[ALU.scala 13:17 ALU.scala 24:19 ALU.scala 26:19]
endmodule
module CPUTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_run,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite,
  input         io_testerProgMemEnable,
  input  [15:0] io_testerProgMemAddress,
  output [31:0] io_testerProgMemDataRead,
  input         io_testerProgMemWriteEnable,
  input  [31:0] io_testerProgMemDataWrite
);
  wire  programCounter_clock; // @[CPUTop.scala 23:30]
  wire  programCounter_reset; // @[CPUTop.scala 23:30]
  wire  programCounter_io_stop; // @[CPUTop.scala 23:30]
  wire  programCounter_io_jump; // @[CPUTop.scala 23:30]
  wire  programCounter_io_run; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounterJump; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounter; // @[CPUTop.scala 23:30]
  wire  dataMemory_clock; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_address; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_writeEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataWrite; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerEnable; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_testerAddress; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerWriteEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[CPUTop.scala 24:26]
  wire  programMemory_clock; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_address; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_instructionRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerEnable; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_testerAddress; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerWriteEnable; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataWrite; // @[CPUTop.scala 25:29]
  wire  registerFile_clock; // @[CPUTop.scala 26:28]
  wire  registerFile_reset; // @[CPUTop.scala 26:28]
  wire [2:0] registerFile_io_aSel; // @[CPUTop.scala 26:28]
  wire [2:0] registerFile_io_bSel; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_writeData; // @[CPUTop.scala 26:28]
  wire  registerFile_io_writeEnable; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_a; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_b; // @[CPUTop.scala 26:28]
  wire [3:0] controlUnit_io_opcode; // @[CPUTop.scala 27:27]
  wire [2:0] controlUnit_io_aluOp; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_memWrite; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_writeEnable; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_loadMemory; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_jumpConditional; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_jump; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_loadImmediate; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_done; // @[CPUTop.scala 27:27]
  wire [31:0] alu_io_operand1; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_operand2; // @[CPUTop.scala 28:19]
  wire [2:0] alu_io_sel; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_result; // @[CPUTop.scala 28:19]
  wire  alu_io_compResult; // @[CPUTop.scala 28:19]
  wire [31:0] immediateValue = {7'h0,programMemory_io_instructionRead[24:0]}; // @[Cat.scala 29:58]
  wire  conditionalJumping = controlUnit_io_jumpConditional & alu_io_compResult; // @[CPUTop.scala 63:59]
  ProgramCounter programCounter ( // @[CPUTop.scala 23:30]
    .clock(programCounter_clock),
    .reset(programCounter_reset),
    .io_stop(programCounter_io_stop),
    .io_jump(programCounter_io_jump),
    .io_run(programCounter_io_run),
    .io_programCounterJump(programCounter_io_programCounterJump),
    .io_programCounter(programCounter_io_programCounter)
  );
  DataMemory dataMemory ( // @[CPUTop.scala 24:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_dataRead(dataMemory_io_dataRead),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  ProgramMemory programMemory ( // @[CPUTop.scala 25:29]
    .clock(programMemory_clock),
    .io_address(programMemory_io_address),
    .io_instructionRead(programMemory_io_instructionRead),
    .io_testerEnable(programMemory_io_testerEnable),
    .io_testerAddress(programMemory_io_testerAddress),
    .io_testerDataRead(programMemory_io_testerDataRead),
    .io_testerWriteEnable(programMemory_io_testerWriteEnable),
    .io_testerDataWrite(programMemory_io_testerDataWrite)
  );
  RegisterFile registerFile ( // @[CPUTop.scala 26:28]
    .clock(registerFile_clock),
    .reset(registerFile_reset),
    .io_aSel(registerFile_io_aSel),
    .io_bSel(registerFile_io_bSel),
    .io_writeData(registerFile_io_writeData),
    .io_writeEnable(registerFile_io_writeEnable),
    .io_a(registerFile_io_a),
    .io_b(registerFile_io_b)
  );
  ControlUnit controlUnit ( // @[CPUTop.scala 27:27]
    .io_opcode(controlUnit_io_opcode),
    .io_aluOp(controlUnit_io_aluOp),
    .io_memWrite(controlUnit_io_memWrite),
    .io_writeEnable(controlUnit_io_writeEnable),
    .io_loadMemory(controlUnit_io_loadMemory),
    .io_jumpConditional(controlUnit_io_jumpConditional),
    .io_jump(controlUnit_io_jump),
    .io_loadImmediate(controlUnit_io_loadImmediate),
    .io_done(controlUnit_io_done)
  );
  ALU alu ( // @[CPUTop.scala 28:19]
    .io_operand1(alu_io_operand1),
    .io_operand2(alu_io_operand2),
    .io_sel(alu_io_sel),
    .io_result(alu_io_result),
    .io_compResult(alu_io_compResult)
  );
  assign io_done = controlUnit_io_done; // @[CPUTop.scala 34:11 CPUTop.scala 67:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[CPUTop.scala 81:28]
  assign io_testerProgMemDataRead = programMemory_io_testerDataRead; // @[CPUTop.scala 75:28]
  assign programCounter_clock = clock;
  assign programCounter_reset = reset;
  assign programCounter_io_stop = io_done; // @[CPUTop.scala 33:26 CPUTop.scala 68:26]
  assign programCounter_io_jump = controlUnit_io_jump | conditionalJumping; // @[CPUTop.scala 64:26]
  assign programCounter_io_run = io_run; // @[CPUTop.scala 31:25]
  assign programCounter_io_programCounterJump = programMemory_io_instructionRead[15:0]; // @[CPUTop.scala 65:40]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = registerFile_io_b[15:0]; // @[CPUTop.scala 53:25]
  assign dataMemory_io_writeEnable = controlUnit_io_memWrite; // @[CPUTop.scala 55:29]
  assign dataMemory_io_dataWrite = registerFile_io_a; // @[CPUTop.scala 54:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[CPUTop.scala 83:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[CPUTop.scala 80:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[CPUTop.scala 84:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[CPUTop.scala 82:33]
  assign programMemory_clock = clock;
  assign programMemory_io_address = programCounter_io_programCounter; // @[CPUTop.scala 32:28 CPUTop.scala 40:28]
  assign programMemory_io_testerEnable = io_testerProgMemEnable; // @[CPUTop.scala 77:33]
  assign programMemory_io_testerAddress = io_testerProgMemAddress; // @[CPUTop.scala 74:34]
  assign programMemory_io_testerWriteEnable = io_testerProgMemWriteEnable; // @[CPUTop.scala 78:38]
  assign programMemory_io_testerDataWrite = io_testerProgMemDataWrite; // @[CPUTop.scala 76:36]
  assign registerFile_clock = clock;
  assign registerFile_reset = reset;
  assign registerFile_io_aSel = programMemory_io_instructionRead[27:25]; // @[CPUTop.scala 42:24]
  assign registerFile_io_bSel = programMemory_io_instructionRead[24:22]; // @[CPUTop.scala 43:24]
  assign registerFile_io_writeData = controlUnit_io_loadMemory ? dataMemory_io_dataRead : alu_io_result; // @[CPUTop.scala 59:29]
  assign registerFile_io_writeEnable = controlUnit_io_writeEnable; // @[CPUTop.scala 60:31]
  assign controlUnit_io_opcode = programMemory_io_instructionRead[31:28]; // @[CPUTop.scala 41:25]
  assign alu_io_operand1 = registerFile_io_a; // @[CPUTop.scala 48:19]
  assign alu_io_operand2 = controlUnit_io_loadImmediate ? immediateValue : registerFile_io_b; // @[CPUTop.scala 49:19]
  assign alu_io_sel = controlUnit_io_aluOp; // @[CPUTop.scala 50:14]
endmodule
