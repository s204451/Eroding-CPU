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
