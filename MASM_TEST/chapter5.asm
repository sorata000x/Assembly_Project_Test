INCLUDE chapter5.inc
    
.code

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

END