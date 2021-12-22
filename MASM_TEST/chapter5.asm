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
; Return:
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
; Return:
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

END