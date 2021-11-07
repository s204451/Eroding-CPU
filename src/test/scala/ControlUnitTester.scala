import chisel3._
import chisel3.iotesters.PeekPokeTester

class ControlUnitTester(dut: ControlUnit) extends PeekPokeTester(dut) {

  poke(dut.io.opcode, 0.U)
  expect(dut.io.aluOp, 0.U)
  expect(dut.io.writeEnable, false.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, true.B)
  step(1)

  poke(dut.io.opcode, 1.U)
  expect(dut.io.aluOp, 1.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 2.U)
  expect(dut.io.aluOp, 2.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 3.U)
  expect(dut.io.aluOp, 3.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 4.U)
  expect(dut.io.aluOp, 0.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, true.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 5.U)
  expect(dut.io.aluOp, 0.U)
  expect(dut.io.writeEnable, true.B)
  expect(dut.io.loadMemory, true.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 6.U)
  expect(dut.io.aluOp, 0.U)
  expect(dut.io.writeEnable, false.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, true.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 7.U)
  expect(dut.io.aluOp, 0.U)
  expect(dut.io.writeEnable, false.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, true.B)
  expect(dut.io.jumpConditional, false.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 8.U)
  expect(dut.io.aluOp, 5.U)
  expect(dut.io.writeEnable, false.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, true.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
  step(1)

  poke(dut.io.opcode, 9.U)
  expect(dut.io.aluOp, 4.U)
  expect(dut.io.writeEnable, false.B)
  expect(dut.io.loadMemory, false.B)
  expect(dut.io.memWrite, false.B)
  expect(dut.io.jump, false.B)
  expect(dut.io.jumpConditional, true.B)
  expect(dut.io.loadImmediate, false.B)
  expect(dut.io.done, false.B)
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
