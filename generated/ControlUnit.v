module ControlUnit(
  input        clock,
  input        reset,
  input  [3:0] io_opcode,
  output [2:0] io_aluOp,
  output       io_memWrite,
  output       io_writeEnable,
  output       io_loadMemory,
  output       io_jumpConditional,
  output       io_jump,
  output       io_loadImmediate
);
  wire  _T = 4'h1 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h2 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h3 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_3 = 4'h4 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h5 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_5 = 4'h6 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h7 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h8 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h9 == io_opcode; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_0 = _T_8 ? 3'h5 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_2 = _T_7 ? 3'h4 : _GEN_0; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_7 | _T_8; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_5 = _T_6 ? 3'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_6 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_5 ? 1'h0 : _T_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_9 = _T_5 ? 3'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_5 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_4 ? 1'h0 : _T_5; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_4 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_14 = _T_4 ? 3'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_4 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_3 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_3 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_20 = _T_3 ? 3'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_3 ? 1'h0 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_22 = _T_2 ? 3'h3 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_2 ? 1'h0 : _T_3; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_2 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_2 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_2 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_2 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_29 = _T_1 ? 3'h2 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_1 | _T_2; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_1 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_1 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_1 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_1 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_1 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67]
  assign io_aluOp = _T ? 3'h1 : _GEN_29; // @[ControlUnit.scala 17:12 ControlUnit.scala 28:16 ControlUnit.scala 32:16 ControlUnit.scala 36:16 ControlUnit.scala 52:16 ControlUnit.scala 56:16]
  assign io_memWrite = _T ? 1'h0 : _GEN_33; // @[ControlUnit.scala 18:15 ControlUnit.scala 46:19]
  assign io_writeEnable = _T | _GEN_30; // @[ControlUnit.scala 19:18 ControlUnit.scala 29:22 ControlUnit.scala 33:22 ControlUnit.scala 37:22]
  assign io_loadMemory = _T ? 1'h0 : _GEN_32; // @[ControlUnit.scala 20:17 ControlUnit.scala 43:21]
  assign io_jumpConditional = _T ? 1'h0 : _GEN_35; // @[ControlUnit.scala 22:22 ControlUnit.scala 53:26 ControlUnit.scala 57:26]
  assign io_jump = _T ? 1'h0 : _GEN_34; // @[ControlUnit.scala 21:11 ControlUnit.scala 49:15]
  assign io_loadImmediate = _T ? 1'h0 : _GEN_31; // @[ControlUnit.scala 23:20 ControlUnit.scala 40:24]
endmodule
