// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(INFLOOP)
	//2중 for루프의 i,j 변수 초기화	
	@i
	M = 0
	@j
	M = 0

	//내부 for루프는 32회 (512/16)
	@32
	D = A
	@inner
	M = D

	//외부 for루프는 256회
	@256
	D = A
	@outer
	M = D

	//SCREEN영역의 주소로 초기화
	@SCREEN
	D = A
	@addr
	M = D

	//키보드 입력 확인 (아무 입력이 없다면 0이므로 WHITELOOP1로 이동)
	@KBD
	D = M
	@WHITELOOP1
	D;JEQ

	(BLACKLOOP1)
		//j = 0
		@j
		M = 0
		(BLACKLOOP2)
			//현재 위치에 -1 저장
			@addr
			A = M
			M = -1

			//주소 한칸 이동
			@addr
			M = M + 1

			//j++
			@j
			M = M + 1

			//j - inner를 D에 저장
			@inner
			D = M
			@j
			D = M - D

			//j-inner가 0이라면 내부 for루프 종료
			@BLACKEND2
			D; JEQ

			@BLACKLOOP2
			0; JMP
		(BLACKEND2)
		//i++
		@i
		M = M + 1

		//i - outer를 D에 저장
		@outer
		D = M
		@i
		D = M - D

		//i-outer = 0이면 외부 for루프 종료
		@BLACKEND1
		D; JEQ

		@BLACKLOOP1
		0; JMP
	(BLACKEND1)

	@DONE
	0; JMP

	(WHITELOOP1)
		@j
		M = 0
		(WHITELOOP2)
			@addr
			A = M
			M = 0			//이번엔 0으로 clear

			@addr
			M = M + 1

			@j
			M = M + 1

			@inner
			D = M
			@j
			D = M - D

			@WHITEEND2
			D; JEQ

			@WHITELOOP2
			0; JMP
		(WHITEEND2)
		@i
		M = M + 1

		@outer
		D = M
		@i
		D = M - D

		@WHITEEND1
		D; JEQ

		@WHITELOOP1
		0; JMP
	(WHITEEND1)
	
	(DONE)
	@INFLOOP
	0;JMP
	