INCLUDE chapter5.inc
    
.code

; Exercise 5
; ---------------------------------------------
; BetterRandomRange
;
; Description: generate random integer between M to N-1
; 
; Receive: lower = lower bound = M
;          upper = upper bound = N
;
; Return:  EAX = random integer between M and N-1
; ---------------------------------------------
BetterRandomRange PROC, lower:DWORD, upper:DWORD

     mov eax, upper
     sub eax, lower                               ; eax = up - low
     call RandomRange                             ; generate random integer between 0 and up-low
     add eax, lower                               ; add this integer by low

     ret
BetterRandomRange ENDP

; Exercise 6
; ---------------------------------------------
; RandomString
;
; Description: generate a random string with length L
;
; Receives: _size = length of the string L
;           _str  = pointer to the destination string 
;
; Modify: _str
; ---------------------------------------------
RandomString PROC, _size:DWORD, _str:DWORD
     pushad
     mov ecx, _size                               ; set loop count = length of the string
     mov edi, _str
L1:
     mov eax, 26                                  ; generate random 0-26 number (for 26 alphabet number)
     call RandomRange
     add eax, 65                                  ; add 65 to become cap alphabets
     mov [edi], al                                ; copy to the string
     inc edi                                      ; increament to the next element
     loop L1                                      ; repeat
     mov al, 0                                    ; terminate with null
     mov [edi], al

     popad
     ret
RandomString ENDP

; Exercise 10
; ---------------------------------------------
; FiboGenerator
; 
; Description: generate N numbers of fibonacci number and store in an array
; 
; Receives: num = number of fibonacci number to generate
;           arr = pointer to destination array
; 
; Modify: arr
;
; Note: can only generate N >= 2 fibonacci numbers
; ---------------------------------------------
FiboGenerator PROC, num:DWORD, arr:DWORD
     pushad 

     mov ecx, num        ; set counter
     sub ecx, 2          ; first 2 will be menually generated
     mov edi, arr

     ; first 2 fibonacci numbers
     mov eax, 1   
     mov [edi], eax
     add edi, TYPE arr
     mov ebx, 1
     mov [edi], ebx
     add edi, TYPE arr
L1:
     mov edx, eax        ; reserve eax
     add eax, ebx        ; eax = eax + ebx
     mov ebx, edx        ; ebx = old eax
     mov [edi], eax      ; record fibo number
     add edi, TYPE arr   ; go next
     loop L1

     popad
     ret
FiboGenerator ENDP

; Exercise 11
; ---------------------------------------------
; FindMultiple
; 
; Description: finds all multiples of K that are less than N and map to an array arr.
; 
; Receives: K = factor
;           N = target multiple
;           arr = pointer to destination array (DWORD)
; 
; Modify: arr
;
; Logic: for(int i=1; i<N; i++){
;	 	  if(i%K == 0)
;			arr[i-1] = 1; // arr index go from 0
;	    }
; 
; Note: 
;  - using DIV instruction (chapter 6) and .IF directive (chapter 7)
;  - assuming arr is storing int (DWORD)
; ---------------------------------------------
FindMultiple PROC, K:DWORD, N:DWORD, arr:DWORD
	pushad

	mov edi, arr
	mov esi, 1					; i = 1
	mov ecx, N
	mov ebx, K
L1:
	.IF esi > N
		jmp _exit
	.ENDIF
	mov eax, esi
	and edx, 0					; clean remainder
	div bx						; edx = i%K
	.IF edx == 0
		mov eax, 1
		mov [edi], eax				; arr[i-1] = 1
	.ENDIF
	add edi, 4					; go to next index
	inc esi						; i++
	loop L1

_exit:

	popad
	ret
FindMultiple ENDP

END