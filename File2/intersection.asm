	.orig x3000

		AND R0, R0, #0 ; contents of 1st list address
		AND R1, R1, #0 ; contents of 1st list contents
		AND R2, R2, #0 ; contents of 2nd list address
		AND R3, R3, #0 ; contents of 2nd list contents
		AND R4, R4, #0 ; contents of 3rd list address
						; R5 IS THROW AWAY REG
						; R6 AND R7 ARE R0 AND R2 TRAILERS RESPECTIVLEY 
		
		

		LD R0, ADDR1 ;LOADS CONTENTS OF X4000 INTO R0
		LD R4, ADDR3 ; LOADS CONTENTS OF X4002 INTO R4

ZERO	AND R7, R7, #0
		ADD R7, R0, #0
FIN		LDR R0, R0, #0
		BRz DONE	
		LDR R1, R0, #1 ; LOADS R1 WITH CONTNENTS OF R0+1	
		
		
		LD R2, ADDR2 ; LOADS CONTENTS OF X4001 INTO R2
		
LOOP	AND R6, R6, #0
		ADD R6, R2, #0
		LDR R2, R2, #0 ; LOADS R2 WITH CONTENTS OF R2
		BRz ZERO		; IF VALUE IS 0, GO ZERO
		LDR R3, R2, #1 ; LOADS R3 WITH CONTENTS OF R2+1
	
		
		NOT R3, R3
		ADD R3, R3, #1
		ADD R3, R3, R1
		BRnp LOOP
		
							;STORE INFO HERE!!
		
		STR R0, R4, #0		; R0--> MEM[R4]
		LDR R4, R4, #0		; R4 POINTS TO MATCHING ADDRESS
		AND R5, R5, #0		; CLEAR R5(THROW AWAY REG!)
		LDR R5, R0, #0		; R5<--- R0[MEM]
		STR R5, R7, #0		; R5---> MEM[R7]
		AND R5, R5, #0		; CLEAR R5
		LDR R5, R2, #0		; R5<--- R2[MEM]
		STR R5, R6, #0		; R5--->R6[MEM]
		BRnzp FIN
		
DONE	STR R0, R4, #0		; R0--> MEM[R4]
		STR R0, R7, #0
			
		TRAP X25

ADDR1	.FILL X4000
ADDR2	.FILL X4001
ADDR3	.FILL X4002

		.END
