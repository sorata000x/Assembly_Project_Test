INCLUDE Irvine32.inc

.386
.MODEL FLAT, stdcall				

.code

stub PROC

	ret
stub ENDP

; --------------------------------
; IntCalc
; 
; Description:
;   performe integer calculation A = (A + B) - (C + D)
; 
; Receive:
;   EAX = A, EBX = B, ECX = C, EDX = D
; 
; Return: 
;   EAX = (A + B) - (C + D)
; ---------------------------------
IntCalc PROC

	add eax, ebx	; A = A + B
	add ecx, edx   ; C = C + D
	sub eax, ecx	; A = (A + B) - (C + D)

	ret
IntCalc ENDP

; Function Test
test_stub PROC, debug:BYTE

	call stub
	mov eax, TRUE

	ret
test_stub ENDP

test_IntCalc PROC, debug: BYTE

	mov eax, 1
	mov ebx, 2
	mov ecx, 3
	mov edx, 4
	call IntCalc
	.IF eax == -4
		mov eax, TRUE
	.ELSE
		mov eax, FALSE
	.ENDIF

	ret
test_IntCalc ENDP

END