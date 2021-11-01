import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val aSel = Input(UInt(3.W)) // Writes to this register
    val bSel = Input(UInt(3.W))
    val writeData = Input(UInt(32.W))
    val writeEnable = Input(Bool())

    val a = Output(UInt(32.W))
    val b = Output(UInt(32.W))
  })

  //Implement this module here
  val R0Reg = RegInit(0.U(32.W))
  val R1Reg = RegInit(0.U(32.W))
  val R2Reg = RegInit(0.U(32.W))
  val R3Reg = RegInit(0.U(32.W))
  val R4Reg = RegInit(0.U(32.W))
  val R5Reg = RegInit(0.U(32.W))
  val R6Reg = RegInit(0.U(32.W))
  val R7Reg = RegInit(0.U(32.W))


  switch(io.aSel) {
    is(0.U) {
      io.a := R0Reg
      when (io.writeEnable) {
        R0Reg := io.writeData
      }
    }
    is(1.U) {
      io.a := R1Reg
      when (io.writeEnable) {
        R1Reg := io.writeData
      }
    }
    is(2.U) {
      io.a := R2Reg
      when (io.writeEnable) {
        R2Reg := io.writeData
      }
    }
    is(3.U) {
      io.a := R3Reg
      when (io.writeEnable) {
        R3Reg := io.writeData
      }
    }
    is(4.U) {
      io.a := R4Reg
      when (io.writeEnable) {
        R4Reg := io.writeData
      }
    }
    is(5.U) {
      io.a := R5Reg
      when (io.writeEnable) {
        R5Reg := io.writeData
      }
    }
    is(6.U) {
      io.a := R6Reg
      when (io.writeEnable) {
        R6Reg := io.writeData
      }
    }
    is(7.U) {
      io.a := R7Reg
      when (io.writeEnable) {
        R7Reg := io.writeData
      }
    }
  }

  switch(io.bSel) {
    is(0.U) {
      io.b := R0Reg
    }
    is(1.U) {
      io.b := R1Reg
    }
    is(2.U) {
      io.b := R2Reg
    }
    is(3.U) {
      io.b := R3Reg
    }
    is(4.U) {
      io.b := R4Reg
    }
    is(5.U) {
      io.b := R5Reg
    }
    is(6.U) {
      io.b := R6Reg
    }
    is(7.U) {
      io.b := R7Reg
    }
  }

}



