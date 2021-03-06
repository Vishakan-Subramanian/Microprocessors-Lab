;COUNT NO. OF 0S AND 1S IN 16-BIT NUMBER
;16-BIT NUMBER HERE: 2144H

START:					;INIT SOME VALUES
MOV R0, #00
MOV R1, #21H
MOV R2, #44H

MOV A, R1				;FIRST 8-BITS

LOOP1:
CLR C					;CLEAR CARRY FLAG
RRC A					;ROTATE WITH CARRY
JNC SKIP1				;IF CARRY = 0, GO TO NEXT BIT
INC R4					;IF CARRY = 1, INC R4

SKIP1:
INC R3
CJNE R3, #08H, LOOP1	;TILL R3 REACHES 08H, DO LOOP1

MOV A, R2				;NEXT 8-BITS

LOOP2:					;REPEAT THE SAME PROCESS
CLR C
RRC A
JNC SKIP2
INC R4

SKIP2:
INC R3
CJNE R3, #10H, LOOP2

;R4 - NO. OF ONES
;(16 - R4) - NO. OF ZEROES
;R5 - NO. OF ZEROES

CLR C
MOV A, #10H				;SUBTRACT 16 FROM R4
SUBB A, R4				;TO GET NO. OF ZEROES
MOV R5, A

HERE:
SJMP HERE
