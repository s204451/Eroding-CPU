module ALU(
  input         clock,
  input         reset,
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
  wire  _T_15 = _T_5 > 32'h0; // @[ALU.scala 26:50]
  wire  _GEN_0 = _T_12 & _T_15; // @[ALU.scala 25:30]
  wire  _GEN_1 = _T_8 ? _T_11 : _GEN_0; // @[ALU.scala 23:31]
  wire [63:0] _GEN_2 = _T_6 ? _T_7 : 64'h0; // @[ALU.scala 21:32]
  wire  _GEN_3 = _T_6 ? 1'h0 : _GEN_1; // @[ALU.scala 21:32]
  wire [63:0] _GEN_4 = _T_3 ? {{32'd0}, _T_5} : _GEN_2; // @[ALU.scala 19:32]
  wire  _GEN_5 = _T_3 ? 1'h0 : _GEN_3; // @[ALU.scala 19:32]
  wire [63:0] _GEN_6 = _T ? {{32'd0}, _T_2} : _GEN_4; // @[ALU.scala 17:25]
  assign io_result = _GEN_6[31:0]; // @[ALU.scala 14:13 ALU.scala 18:15 ALU.scala 20:15 ALU.scala 22:15]
  assign io_compResult = _T ? 1'h0 : _GEN_5; // @[ALU.scala 13:17 ALU.scala 24:19 ALU.scala 26:19]
endmodule
