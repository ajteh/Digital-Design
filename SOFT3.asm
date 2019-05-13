.CSEG
.ORG 0x10
MOV R1,0x00
MOV R2,0x00
MOV R3,0x04
MOV R5,0X00
MOV R6,0x00
IN R1,0x9A
;IN R2,0x9B


SHIFT:	CLC
		LSR R1
		
		LSR R2
		SUB R3,0x01
		BRNE SHIFT
		
MOV R3,0x04
ROTATE: ROL R2
		SUB R3,0x01
		BRNE ROTATE
LSR R1
MULT: 	LSL R1
		CLC
		LSR R2
		BRCS ADDD
		CMP R2,0X00
		BREQ OUTPUT
		BRNE MULT		
		
ADDD: 	ADD R5,R1
		CLC
		BRNE MULT
						
OUTPUT:	OUT R5, 0x42