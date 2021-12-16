INCLUDE func.inc

.386
.MODEL FLAT, stdcall				
PUBLIC test1

.code

test1 PROC
	
	mov eax, 3
	INVOKE isodd, eax

	ret
test1 ENDP

END