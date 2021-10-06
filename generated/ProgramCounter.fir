;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stop : UInt<1>, flip jump : UInt<1>, flip run : UInt<1>, flip programCounterJump : UInt<16>, programCounter : UInt<16>}
    
    reg programCounterReg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 14:34]
    node _T = eq(io.run, UInt<1>("h00")) @[ProgramCounter.scala 16:19]
    node _T_1 = or(io.stop, _T) @[ProgramCounter.scala 16:16]
    when _T_1 : @[ProgramCounter.scala 16:28]
      programCounterReg <= io.programCounter @[ProgramCounter.scala 17:23]
      skip @[ProgramCounter.scala 16:28]
    else : @[ProgramCounter.scala 18:16]
      when io.jump : @[ProgramCounter.scala 19:19]
        programCounterReg <= io.programCounterJump @[ProgramCounter.scala 20:25]
        skip @[ProgramCounter.scala 19:19]
      else : @[ProgramCounter.scala 21:18]
        node _T_2 = add(io.programCounter, UInt<1>("h01")) @[ProgramCounter.scala 22:46]
        node _T_3 = tail(_T_2, 1) @[ProgramCounter.scala 22:46]
        programCounterReg <= _T_3 @[ProgramCounter.scala 22:25]
        skip @[ProgramCounter.scala 21:18]
      skip @[ProgramCounter.scala 18:16]
    io.programCounter <= programCounterReg @[ProgramCounter.scala 25:21]
    
