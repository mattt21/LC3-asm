			.ORIG X3000


ANOTHER		JSR START
P1			LEA R0 PLAY1
			LEA R7 P1
			ST R7 PLAYER
			AND R7 R7 #0
			TRAP X22
POLL1		LDI R1 A	
			BRzp POLL1
			LDI R0 B
			AND R2 R2 #0		
			ADD R2 R0 #0
			ST R2 ROW			;STORES ROW LETTER INTO "ROW"
			TRAP X21
POLL2		LDI R1 A	
			BRzp POLL2
			LDI R0 B
			AND R2 R2 #0		
			ADD R2 R0 #0
			ST R2 ROCKS			;STORES ROCK NUMBER INTO "ROCKS"
			TRAP X21
			
		
			

			
			
			
			LD R0 LF
			TRAP X21
			JSR CALC
			LEA R0 ROWA
			LDR R2 R0 #7
			BRnp NADA
			LEA R0 ROWB
			LDR R2 R0 #7
			BRnp NADA
			LEA R0 ROWC
			LDR R2 R0 #7
			BRnp NADA
			LD R0 LF
			TRAP X21
			LEA R0 WINNER2
			TRAP X22
			TRAP X25
			
WINNER1		.STRINGZ "Player 1 Wins."
WINNER2		.STRINGZ "Player 2 Wins."
PLAY1		.STRINGZ "Player 1, choose a row and number of rocks: "
PLAY2		.STRINGZ "Player 2, choose a row and number of rocks: "
			
			
			
NADA		JSR START
P2			LEA R0 PLAY2
			LEA R7 P2
			ST R7 PLAYER
			AND R7 R7 #0
			TRAP X22
POLL3		LDI R1 A	
			BRzp POLL3
			LDI R0 B
			AND R2 R2 #0		
			ADD R2 R0 #0
			ST R2 ROW	
			TRAP X21
POLL4		LDI R1 A	
			BRzp POLL4
			LDI R0 B
			AND R2 R2 #0		
			ADD R2 R0 #0
			ST R2 ROCKS		
			TRAP X21
			
			
			LD R0 LF
			TRAP X21
			JSR CALC			
			LEA R0 ROWA
			LDR R2 R0 #7
			BRnp NADA2
			LEA R0 ROWB
			LDR R2 R0 #7
			BRnp NADA2
			LEA R0 ROWC
			LDR R2 R0 #7
			BRnp NADA2
			LD R0 LF
			TRAP X21
			LEA R0 WINNER1
			TRAP X22
			TRAP X25
			
NADA2		BRnzp ANOTHER
			
ROWA		.STRINGZ "ROW A: ooo"
ROWB		.STRINGZ "ROW B: ooooo"
ROWC		.STRINGZ "ROW C: oooooooo"
			
			
			
			;-------------------------------------------------------------------
			
CALC		ST R7 SAVER7
			LD R3 AVAL
			LD R2 ROW
			NOT R2 R2
			ADD R2 R2 #1
			ADD R2 R2 R3
			BRz AROCK
			LD R3 BVAL
			LD R2 ROW
			NOT R2 R2
			ADD R2 R2 #1
			ADD R2 R2 R3
			BRz BROCK
			LD R3 CVAL
			LD R2 ROW
			NOT R2 R2
			ADD R2 R2 #1
			ADD R2 R2 R3
			BRz CROCK
			BRnzp INVALID			;INVALID INPUT
			

PLAYER		.BLKW #1
ROW			.BLKW #1
ROCKS		.BLKW #1
LF			.FILL X000A
A			.FILL XFE00
B			.FILL XFE02
ASTACK		.FILL X4000
BSTACK		.FILL X3FF5
CSTACK		.FILL X3F38
CONVO		.FILL #-111			
CONVN		.FILL #-48			
AVAL		.FILL X0041
BVAL		.FILL X0042
CVAL		.FILL X0043





AROCK		LD R3 ROCKS
			LD R5 CONVN
			ADD R3 R3 R5
			LEA R0 ROWA
			LD R6 APOINT
			AND R1 R1 #0
AGAIN		JSR POP
			LD R4 CONVO
			ADD R4 R4 R2
			BRnp INVALID				;NOT ENOUGH ROCKS=INVALID
			ADD R3 R3 #-1
			BRz STOP					;TAKEN AWAY ENOUGH ROCKS
			BRn INVALID					;IF ROCK INPUT IS 0=INVALID
			ADD R1 R1 #1
			BRnzp AGAIN
STOP		ADD R1 R1 #1
			BRnzp ACHANGE
			
APOINT		.BLKW #1
BPOINT		.BLKW #1
CPOINT		.BLKW #1
SAVER7		.BLKW #1

			

BROCK		LD R3 ROCKS
			LD R5 CONVN
			ADD R3 R3 R5
			LEA R0 ROWB
			LD R6 BPOINT
			AND R1 R1 #0
AGAIN2		JSR POP
			LD R4 CONVO
			ADD R4 R4 R2
			BRnp INVALID				;NOT ENOUGH ROCKS=INVALID
			ADD R3 R3 #-1
			BRz STOP2					;TAKEN AWAY ENOUGH ROCKS
			BRn INVALID					;IF ROCK INPUT IS 0=INVALID
			ADD R1 R1 #1
			BRnzp AGAIN2
STOP2		ADD R1 R1 #1
			BRnzp BCHANGE
			

CROCK		LD R3 ROCKS
			LD R5 CONVN
			ADD R3 R3 R5
			LEA R0 ROWC
			LD R6 CPOINT
			AND R1 R1 #0
AGAIN3		JSR POP
			LD R4 CONVO
			ADD R4 R4 R2
			BRnp INVALID				;NOT ENOUGH ROCKS=INVALID
			ADD R3 R3 #-1
			BRz STOP3					;TAKEN AWAY ENOUGH ROCKS
			BRn INVALID					;IF ROCK INPUT IS 0=INVALID
			ADD R1 R1 #1
			BRnzp AGAIN3
STOP3		ADD R1 R1 #1
			BRnzp CCHANGE

			
			
			
INVALID		LEA R0 FALSE
			TRAP X22
			LD R0 LF
			TRAP X21
			LD R0 PLAYER
			JMP R0

			
			
			

			
ACHANGE		LEA R0 ROWA
			AND R3 R3 #0
			LDR R4 R0 #9
			BRz A1
			STR R3 R0 #9
			ADD R1 R1 #-1
			BRz WHORE
A1			LDR R4 R0 #8
			BRz A2
			STR R3 R0 #8
			ADD R1 R1 #-1
			BRz WHORE
A2			LDR R4 R0 #7
			BRz WHORE
			STR R3 R0 #7
			ADD R1 R1 #-1
WHORE		LD R7 SAVER7
			RET
		
			

BCHANGE		LEA R0 ROWB
			AND R3 R3 #0
			LDR R4 R0 #11
			BRz BEE1
			STR R3 R0 #11
			ADD R1 R1 #-1
			BRz FUK
BEE1		LDR R4 R0 #10
			BRz BEE2
			STR R3 R0 #10
			ADD R1 R1 #-1
			BRz FUK
BEE2		LDR R4 R0 #9
			BRz BEE3
			STR R3 R0 #9
			ADD R1 R1 #-1
			BRz FUK
BEE3		LDR R4 R0 #8
			BRz BEE4
			STR R3 R0 #8
			ADD R1 R1 #-1
			BRz FUK
BEE4		LDR R4 R0 #7
			BRz FUK
			STR R3 R0 #7
			ADD R1 R1 #-1
FUK			LD R7 SAVER7
			RET

CCHANGE		LEA R0 ROWC
			AND R3 R3 #0
			LDR R4 R0 #14
			BRz C1
			STR R3 R0 #14
			ADD R1 R1 #-1
			BRz SHIT
C1			LDR R4 R0 #13
			BRz C2
			STR R3 R0 #13
			ADD R1 R1 #-1
			BRz SHIT
C2			LDR R4 R0 #12
			BRz C3
			STR R3 R0 #12
			ADD R1 R1 #-1
			BRz SHIT
C3			LDR R4 R0 #11
			BRz C4
			STR R3 R0 #11
			ADD R1 R1 #-1
			BRz SHIT
C4			LDR R4 R0 #10
			BRz C5
			STR R3 R0 #10
			ADD R1 R1 #-1
			BRz SHIT
C5			LDR R4 R0 #9
			BRz C6
			STR R3 R0 #9
			ADD R1 R1 #-1
			BRz SHIT
C6			LDR R4 R0 #8
			BRz C7
			STR R3 R0 #8
			ADD R1 R1 #-1
			BRz SHIT
C7			LDR R4 R0 #7
			BRz SHIT
			STR R3 R0 #7
			ADD R1 R1 #-1		
SHIT		LD R7 SAVER7
			RET
			
			
			
			
			
			
			;----------------------------------------------------
						

			
			;-------------------------------------------------------------
			
START		ST R7 SAVER7
			LD R0 LF
			TRAP X21
			LD R6 ASTACK		;R6 STARTS AT X4000
			LEA R0 ROWA
			TRAP X22
LOOP1		LDR R2 R0 #0		;LOAD R2 WITH ASCII CODES
			ST R6 APOINT
			BRz EOT1
			ADD R0 R0 #1		;INCREMENT R1 TO NEXT CHARACTER
			JSR PUSH
			BRnzp LOOP1
EOT1		LD R0 LF
			TRAP X21
			
			LD R6 BSTACK
			LEA R0 ROWB
			TRAP X22
LOOP2		LDR R2 R0 #0
			ST R6 BPOINT
			BRz EOT2
			ADD R0 R0 #1
			JSR PUSH
			BRnzp LOOP2
EOT2		LD R0 LF
			TRAP X21
			
			LD R6 CSTACK
			LEA R0 ROWC
			TRAP X22
LOOP3		LDR R2 R0 #0
			ST R6 CPOINT
			BRz EOT3
			ADD R0 R0 #1
			JSR PUSH
			BRnzp LOOP3
EOT3		LD R0 LF
			LD R0 LF
			TRAP X21
			LD R7 SAVER7
			RET
			
			;----------------------------------------------------------
			
PUSH		ADD R6 R6 #-1
			STR R2 R6 #0
			RET
			
POP			LDR R2 R6 #0
			ADD R6 R6 #1
			RET
			
			;----------------------------------------------------------
		
		


FALSE		.STRINGZ "Invalid move. Try again."
AADDR		.BLKW #1
BADDR		.BLKW #1
CADDR		.BLKW #1

			.END