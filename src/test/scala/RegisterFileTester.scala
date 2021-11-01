import chisel3._
import chisel3.iotesters.PeekPokeTester

class RegisterFileTester(dut: RegisterFile) extends PeekPokeTester(dut) {

  poke(dut.io.aSel, 0.U)
  poke(dut.io.bSel, 1.U)
  poke(dut.io.writeData, 100.U)
  poke(dut.io.writeEnable, false.B)
  expect(dut.io.a, 0.U)
  expect(dut.io.b, 0.U)
  step(1)

  poke(dut.io.aSel, 0.U)
  poke(dut.io.bSel, 1.U)
  poke(dut.io.writeData, 100.U)
  poke(dut.io.writeEnable, true.B)
  expect(dut.io.a, 0.U)
  expect(dut.io.b, 0.U)
  step(1)

  poke(dut.io.aSel, 0.U)
  poke(dut.io.bSel, 1.U)
  poke(dut.io.writeData, 100.U)
  poke(dut.io.writeEnable, false.B)
  expect(dut.io.a, 100.U)
  expect(dut.io.b, 0.U)
  step(1)

  poke(dut.io.aSel, 1.U)
  poke(dut.io.bSel, 0.U)
  poke(dut.io.writeData, 200.U)
  poke(dut.io.writeEnable, true.B)
  expect(dut.io.a, 0.U)
  expect(dut.io.b, 100.U)
  step(1)

  poke(dut.io.aSel, 1.U)
  poke(dut.io.bSel, 0.U)
  poke(dut.io.writeData, 200.U)
  poke(dut.io.writeEnable, false.B)
  expect(dut.io.a, 200.U)
  expect(dut.io.b, 100.U)
  step(1)

}

object RegisterFileTester {
  def main(args: Array[String]): Unit = {
    println("Testing RegisterFile")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "RegisterFile"),
      () => new RegisterFile()) {
      c => new RegisterFileTester(c)
    }
  }
}
