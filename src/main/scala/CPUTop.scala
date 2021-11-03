import chisel3._
import chisel3.util._

class CPUTop extends Module {
  val io = IO(new Bundle {
    val done = Output(Bool())
    val run = Input(Bool())
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerDataMemEnable = Input(Bool())
    val testerDataMemAddress = Input(UInt(16.W))
    val testerDataMemDataRead = Output(UInt(32.W))
    val testerDataMemWriteEnable = Input(Bool())
    val testerDataMemDataWrite = Input(UInt(32.W))
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerProgMemEnable = Input(Bool())
    val testerProgMemAddress = Input(UInt(16.W))
    val testerProgMemDataRead = Output(UInt(32.W))
    val testerProgMemWriteEnable = Input(Bool())
    val testerProgMemDataWrite = Input(UInt(32.W))
  })

  //Creating components
  val programCounter = Module(new ProgramCounter())
  val dataMemory = Module(new DataMemory())
  val programMemory = Module(new ProgramMemory())
  val registerFile = Module(new RegisterFile())
  val controlUnit = Module(new ControlUnit())
  val alu = Module(new ALU())

  //Connecting the modules
  programCounter.io.run := io.run
  programMemory.io.address := programCounter.io.programCounter
  programCounter.io.stop := false.B
  io.done := false.B

  ////////////////////////////////////////////
  //Continue here with your connections
  ////////////////////////////////////////////
  // The address of instruction is the programcounters output
  programMemory.io.address := programCounter.io.programCounter
  controlUnit.io.opcode := programMemory.io.instructionRead(31, 28) // opcode
  registerFile.io.aSel := programMemory.io.instructionRead(27, 25) // reg1
  registerFile.io.bSel := programMemory.io.instructionRead(24, 22) // reg2

  // Inputs for ALU
  val immediateValue = Cat(0.U(7.W), programMemory.io.instructionRead(24, 0))
  val muxOp2 = Mux(controlUnit.io.loadImmediate, immediateValue, registerFile.io.b)
  alu.io.operand1 := registerFile.io.a
  alu.io.operand2 := muxOp2
  alu.io.sel := controlUnit.io.aluOp

  // Data Memory
  dataMemory.io.address := registerFile.io.a(15,0)
  dataMemory.io.dataWrite := registerFile.io.b
  dataMemory.io.writeEnable := controlUnit.io.memWrite

  // Register File
  val writeData = Mux(controlUnit.io.loadMemory, dataMemory.io.dataRead, alu.io.result)
  registerFile.io.writeData := writeData
  registerFile.io.writeEnable := controlUnit.io.writeEnable

  // Input for ProgramCounter
  val conditionalJumping = controlUnit.io.jumpConditional && alu.io.compResult
  programCounter.io.jump := controlUnit.io.jump || conditionalJumping
  programCounter.io.programCounterJump := programMemory.io.instructionRead(15, 0)

  when(programCounter.io.programCounter >= 48.U) {
    programCounter.io.stop := true.B
    io.done := true.B
  }

  //This signals are used by the tester for loading the program to the program memory, do not touch
  programMemory.io.testerAddress := io.testerProgMemAddress
  io.testerProgMemDataRead := programMemory.io.testerDataRead
  programMemory.io.testerDataWrite := io.testerProgMemDataWrite
  programMemory.io.testerEnable := io.testerProgMemEnable
  programMemory.io.testerWriteEnable := io.testerProgMemWriteEnable
  //This signals are used by the tester for loading and dumping the data memory content, do not touch
  dataMemory.io.testerAddress := io.testerDataMemAddress
  io.testerDataMemDataRead := dataMemory.io.testerDataRead
  dataMemory.io.testerDataWrite := io.testerDataMemDataWrite
  dataMemory.io.testerEnable := io.testerDataMemEnable
  dataMemory.io.testerWriteEnable := io.testerDataMemWriteEnable
}