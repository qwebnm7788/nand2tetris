// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@1
D = M
//반복문 횟수 i = RAM[1]
@i
M = D
//결과값 sum = 0으로 초기화
@sum
M = 0

(LOOP)
	@i
	D = M
	//i == 0 ? 조건검사
	@END
	D;JEQ

	@0
	D = M
	//sum += RAM[0]
	@sum
	M = M + D
	//i--
	@i
	M = M - 1

	@LOOP
	0;JMP

(END)

@sum
D = M
//RAM[2] = sum
@2
M = D
//종료 무한루프
@22
0;JMP
