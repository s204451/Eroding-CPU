import chisel3._
import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import java.util
// 22: 0000000000000000000000
// 25: 0000000000000000000000000

object Programs{
  val program1 = Array(
    "01001100000000000000000000010011".U(32.W), // 1: R6 = 19
    "01001110000000000000000000000000".U(32.W), // 2: R7 = 0
    "01000010000000000000000000000000".U(32.W), // 3: R1 = X = 0
    "10000011100000000000000000101111".U(32.W), // 4: If X > 19
    "01000100000000000000000000000000".U(32.W), // 5: Y = 0
    "10000101100000000000000000101100".U(32.W), // 6: If Y > 19 loop ended jump to __
    "01000000000000000000000000010100".U(32.W), // 7: R0 = 20
    "00110000100000000000000000000000".U(32.W), // 8: R0 = 20*y
    "00010000010000000000000000000000".U(32.W), // 9: R0 = x+20*y = in_image address
    "01000110000000000000000000000000".U(32.W), // 10: R3 = 0
    "00010110000000000000000000000000".U(32.W), // 11: R3 = 0 + R0 = in_image address
    "01001010000000000000000110010000".U(32.W), // 12: R5 = 400
    "00010111010000000000000000000000".U(32.W), // 13: R3 = x+20*y+400 = out_image address
    "01011000000000000000000000000000".U(32.W), // 14: R4 = memory(R0 (in_image) )
    "10010011110000000000000000010101".U(32.W), // 15: If X == 0 Jump
    "10010101110000000000000000010101".U(32.W), // 16: If Y == 0
    "10010011100000000000000000010101".U(32.W), // 17: If X == 19
    "10010101100000000000000000010101".U(32.W), // 18: If Y == 19
    "10011001100000000000000000010101".U(32.W), // 19: If in:image(x,y) == 0
    "01110000000000000000000000010111".U(32.W), // 20: JR 23  Skip the next 2 lines if none of the above are true
    "01100111110000000000000000000000".U(32.W), // 21: Save 0 to memory(R3) = memory(out_image)
    "01110000000000000000000000101001".U(32.W), // 22: continue (jump)
    "01001010000000000000000000000001".U(32.W), // 23: R5 = 1
    "00100001010000000000000000000000".U(32.W), // 24: SUB R0 R5 , in_image(x1,y)
    "01011000000000000000000000000000".U(32.W), // 25: : Stores the value of memory(R0) in R4
    "10011001110000000000000000010101".U(32.W), // 26: if (in_image(x1,y) == 0)
    "01001010000000000000000000000010".U(32.W), // 27: R5 = 2
    "00010001010000000000000000000000".U(32.W), // 28: ADD R0 R5 , in_image(x+1,y)
    "01011000000000000000000000000000".U(32.W), // 29: Stores the value of memory(R0) in R4
    "10011001110000000000000000010101".U(32.W), // 30:  if (in_image(x+1,y) == 0)
    "01001010000000000000000000010101".U(32.W), // 31: R5 = 21
    "00100001010000000000000000000000".U(32.W), // 32: SUB R0 R5 , in_image(x,y1)
    "01011000000000000000000000000000".U(32.W), // 33: Stores the value of memory(R0) in R4
    "10011001110000000000000000010101".U(32.W), // 34: if (in_image(x,y1) == 0)
    "01001010000000000000000000101000".U(32.W), // 35: R5 = 40
    "00010001010000000000000000000000".U(32.W), // 36: ADD R0 R5 , in_image(x,y+1)
    "01011000000000000000000000000000".U(32.W), // 37: Stores the value of memory(R0) in R4
    "10011001110000000000000000010101".U(32.W), // 38: if (in_image(x,y+1) == 0)
    "01001010000000000000000011111111".U(32.W), // 39: R5 = 255
    "01100111010000000000000000000000".U(32.W), // 40: Save 255 to memory(R3) = memory(out_image)
    "01001010000000000000000000000001".U(32.W), // 41: R5 = 1
    "00010101010000000000000000000000".U(32.W), // 42: Y = Y + 1
    "01110000000000000000000000000110".U(32.W), // 43: Jump back to beginning of loop 2
    "01001010000000000000000000000001".U(32.W), // 44: R5 = 1
    "00010011010000000000000000000000".U(32.W), // 45: X = X + 1
    "01110000000000000000000000000100".U(32.W), // 46: Jumps back to beginning of loop 1
    "00000000000000000000000000000000".U(32.W) // 47: END
  )

  /*
  object Programs{
  val program1 = Array(
    "0100-110-0000000000000000000010011".U(32.W), // 1: R6 = 19
    "0100-111-0000000000000000000000000".U(32.W), // 2: R7 = 0
    "0100-001-0000000000000000000000000".U(32.W), // 3: R1 = X = 0
    "1000-001-110-0000000000000000101111".U(32.W), // 4: If X > 19
    "0100-010-0000000000000000000000000".U(32.W), // 5: Y = 0
    "1000-010-110-0000000000000000101100".U(32.W), // 6: If Y > 19 loop ended jump to __
    "0100-000-0000000000000000000010100".U(32.W), // 7: R0 = 20
    "0011-000-010-0000000000000000000000".U(32.W), // 8: R0 = 20*y
    "0001-000-001-0000000000000000000000".U(32.W), // 9: R0 = x+20*y = in_image address
    "0100-011-0000000000000000000000000".U(32.W), // 10: R3 = 0
    "0001-011-000-0000000000000000000000".U(32.W), // 11: R3 = 0 + R0 = in_image address
    "0100-101-0000000000000000110010000".U(32.W), // 12: R5 = 400
    "0001-011-101-0000000000000000000000".U(32.W), // 13: R3 = x+20*y+400 = out_image address
    "0101-100-000-0000000000000000000000".U(32.W), // 14: R4 = memory(R0 (in_image) )
    "1001-001-111-0000000000000000010101".U(32.W), // 15: If X == 0 Jump
    "1001-010-111-0000000000000000010101".U(32.W), // 16: If Y == 0
    "1001-001-110-0000000000000000010101".U(32.W), // 17: If X == 19
    "1001-010-110-0000000000000000010101".U(32.W), // 18: If Y == 19
    "1001-100-110-0000000000000000010101".U(32.W), // 19: If in:image(x,y) == 0
    "0111-000-000-0000000000000000010111".U(32.W), // 20: JR 23 - Skip the next 2 lines if none of the above are true
    "0110-011-111-0000000000000000000000".U(32.W), // 21: Save 0 to memory(R3) = memory(out_image)
    "0111-000-000-0000000000000000101001".U(32.W), // 22: continue (jump)
    "0100-101-0000000000000000000000001".U(32.W), // 23: R5 = 1
    "0010-000-101-0000000000000000000000".U(32.W), // 24: SUB R0 R5 , in_image(x-1,y)
    "0101-100-000-0000000000000000000000".U(32.W), // 25: : Stores the value of memory(R0) in R4
    "1001-100-111-0000000000000000010101".U(32.W), // 26: if (in_image(x-1,y) == 0)
    "0100-101-0000000000000000000000010".U(32.W), // 27: R5 = 2
    "0001-000-101-0000000000000000000000".U(32.W), // 28: ADD R0 R5 , in_image(x+1,y)
    "0101-100-000-0000000000000000000000".U(32.W), // 29: Stores the value of memory(R0) in R4
    "1001-100-111-0000000000000000010101".U(32.W), // 30:  if (in_image(x+1,y) == 0)
    "0100-101-0000000000000000000010101".U(32.W), // 31: R5 = 21
    "0010-000-101-0000000000000000000000".U(32.W), // 32: SUB R0 R5 , in_image(x,y-1)
    "0101-100-000-0000000000000000000000".U(32.W), // 33: Stores the value of memory(R0) in R4
    "1001-100-111-0000000000000000010101".U(32.W), // 34: if (in_image(x,y-1) == 0)
    "0100-101-0000000000000000000101000".U(32.W), // 35: R5 = 40
    "0001-000-101-0000000000000000000000".U(32.W), // 36: ADD R0 R5 , in_image(x,y+1)
    "0101-100-000-0000000000000000000000".U(32.W), // 37: Stores the value of memory(R0) in R4
    "1001-100-111-0000000000000000010101".U(32.W), // 38: if (in_image(x,y+1) == 0)
    "0100-101-0000000000000000011111111".U(32.W), // 39: R5 = 255
    "0110-011-101-0000000000000000000000".U(32.W), // 40: Save 255 to memory(R3) = memory(out_image)
    "0100-101-0000000000000000000000001".U(32.W), // 41: R5 = 1
    "0001-010-101-0000000000000000000000".U(32.W), // 42: Y = Y + 1
    "0111-000-000-0000000000000000000110".U(32.W), // 43: Jump back to beginning of loop 2
    "0100-101-0000000000000000000000001".U(32.W), // 44: R5 = 1
    "0001-001-101-0000000000000000000000".U(32.W), // 45: X = X + 1
    "0111-000-000-0000000000000000000100".U(32.W), // 46: Jumps back to beginning of loop 1
    "0000-0000000000000000000000000000".U(32.W) // 47: END
  )
   */

  val program2 = Array(
    "h00000000".U(32.W),
  )
}