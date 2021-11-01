import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(4.W))

    val aluOp = Output(UInt(3.W))
    val memWrite = Output(Bool())
    val writeEnable = Output(Bool())
    val loadMemory = Output(Bool())
    val jumpConditional = Output(Bool())
    val jump = Output(Bool())
    val loadImmediate = Output(Bool())
  })

  io.aluOp := 0.U
  io.memWrite := false.B
  io.writeEnable := false.B
  io.loadMemory := false.B
  io.jump := false.B
  io.jumpConditional := false.B
  io.loadImmediate := false.B

  //Implement this module here
  switch(io.opcode) {
    is (1.U) { // ADD
      io.aluOp := 1.U
      io.writeEnable := true.B
    }
    is (2.U) { // SUB
      io.aluOp := 2.U
      io.writeEnable := true.B
    }
    is (3.U) { // MULT
      io.aluOp := 3.U
      io.writeEnable := true.B
    }
    is (4.U) { // LI
      io.loadImmediate := true.B
    }
    is (5.U) { // LD
      io.loadMemory := true.B
    }
    is (6.U) { // SD
      io.memWrite := true.B
    }
    is (7.U) { // JR
      io.jump := true.B
    }
    is (8.U) { // JEQ
      io.aluOp := 4.U
      io.jumpConditional := true.B
    }
    is (9.U) { // JGT
      io.aluOp := 5.U
      io.jumpConditional := true.B
    }
  }
}