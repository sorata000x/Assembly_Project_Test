INCLUDE chapter5.inc

.386
.MODEL FLAT, stdcall				
PUBLIC a_test_BetterRandomRange

.code

a_test_BetterRandomRange PROC, lower:DWORD, upper:DWORD 

	INVOKE BetterRandomRange, lower, upper

	ret
a_test_BetterRandomRange ENDP

a_test_RandomString PROC, _size:DWORD, _str:DWORD

	INVOKE RandomString, _size, _str

	ret
a_test_RandomString ENDP

a_test_FiboGenerator PROC, num:DWORD, arr:DWORD

	INVOKE FiboGenerator, num, arr

	ret
a_test_FiboGenerator ENDP

a_test_FindMultiple PROC, K:DWORD, N:DWORD, arr:DWORD

	INVOKE FindMultiple, K, N, arr

	ret
a_test_FindMultiple ENDP

END