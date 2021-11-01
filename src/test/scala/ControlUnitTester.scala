import chisel3._
import chisel3.iotesters.PeekPokeTester

class ControlUnitTester(dut: ControlUnit) extends PeekPokeTester(dut) {

  poke(dut.io.opcode, 1.U)
  expect(dut.io.aluOp, 1.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  step(1)

  poke(dut.io.opcode, 2.U)
  expect(dut.io.aluOp, 2.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  step(1)

}

object ControlUnitTester {
  def main(args: Array[String]): Unit = {
    println("Testing ControlUnit")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ControlUnit"),
      () => new ControlUnit()) {
      c => new ControlUnitTester(c)
    }
  }
}
