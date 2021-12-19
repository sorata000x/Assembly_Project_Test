INCLUDE chapter5.inc

.386
.MODEL FLAT, stdcall				
PUBLIC a_test_BetterRandomRange

.code

a_test_BetterRandomRange PROC, lower:DWORD, upper:DWORD 

	INVOKE BetterRandomRange, lower, upper

	ret
a_test_BetterRandomRange ENDP

END