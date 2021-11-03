import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val operand1 = Input(UInt(32.W))
    val operand2 = Input(UInt(32.W))
    val sel = Input(UInt(3.W))
    val result = Output(UInt(32.W))
    val compResult = Output(Bool())
  })
  io.compResult := false.B
  io.result := io.operand2

  //Implement this module here
  when (io.sel === 1.U) { // Add
    io.result := io.operand1 + io.operand2
  } .elsewhen (io.sel === 2.U) { // Sub
    io.result := io.operand1 - io.operand2
  } .elsewhen (io.sel === 3.U) { // Mult
    io.result := io.operand1 * io.operand2
  } .elsewhen(io.sel === 4.U) { // JEQ
    io.compResult := io.operand1 - io.operand2 === 0.U
  } .elsewhen(io.sel === 5.U){ // JGT
    io.compResult := (io.operand1 > io.operand2)
  }
}