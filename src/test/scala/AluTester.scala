import chisel3._
import chisel3.iotesters.PeekPokeTester

class AluTester(dut: ALU) extends PeekPokeTester(dut) {

  poke(dut.io.operand1, 203.U)
  poke(dut.io.operand2, 102.U)
  poke(dut.io.sel, 1.U)
  expect(dut.io.result, 305.U)
  expect(dut.io.compResult, false.B)
  val res = dut.io.result
  println("" + res)
  step(1)

  poke(dut.io.operand1, 203)
  poke(dut.io.operand2, 23)
  poke(dut.io.sel, 2.U)
  expect(dut.io.result, 180.U)
  expect(dut.io.compResult, false.B)
  step(1)

  poke(dut.io.operand1, 5)
  poke(dut.io.operand2, 4)
  poke(dut.io.sel, 3.U)
  expect(dut.io.result, 20.U)
  expect(dut.io.compResult, false.B)
  step(1)

  poke(dut.io.operand1, 203)
  poke(dut.io.operand2, 203)
  poke(dut.io.sel, 4.U)
  expect(dut.io.result, 0.U)
  expect(dut.io.compResult, true.B)
  step(1)

  poke(dut.io.operand1, 203)
  poke(dut.io.operand2, 23)
  poke(dut.io.sel, 5.U)
  expect(dut.io.result, 0.U)
  expect(dut.io.compResult, true.B)
  step(1)

  poke(dut.io.operand1, 203)
  poke(dut.io.operand2, 23)
  poke(dut.io.sel, 0.U)
  expect(dut.io.result, 0.U)
  expect(dut.io.compResult, false.B)
  step(1)

}

object AluTester {
  def main(args: Array[String]): Unit = {
    println("Testing ALU")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ALU"),
      () => new ALU()) {
      c => new AluTester(c)
    }
  }
}
