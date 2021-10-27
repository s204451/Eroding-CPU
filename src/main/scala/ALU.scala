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
  io.result := 0.U

  //Implement this module here

}