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

  //Implement this module here

}