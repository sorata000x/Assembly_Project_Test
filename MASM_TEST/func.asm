; test function to be called in testA.asm

INCLUDE func.inc

.code

isodd PROC,  aIn:DWORD
	
	mov eax, aIn
	and eax, 1

	ret
isodd ENDP

END