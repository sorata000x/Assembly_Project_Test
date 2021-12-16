; Function template to use in .cpp
; change 'func' to your function name

.386
.MODEL FLAT, C				; the "C" arg passed here is required for functions to be recognized at linking stage

.code

isodd PROC  aIn:DWORD
	
	mov eax, aIn
	and eax, 1

	ret
isodd ENDP

END