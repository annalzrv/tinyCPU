; N! mod 2^32  (registers wrap at 2^32 by themselves, so no extra work)
LOAD R0, [INPUT]        ; k = n
MOV R1, 1               ; result = 1

outer: CMP R0, 0        ; while k > 0:
JLE done
MOV R2, 0               ;   acc = 0
MOV R3, R0              ;   count = k
inner: CMP R3, 0        ;   while count > 0:      (this is result * k)
JLE mult_done
ADD R2, R1              ;     acc += result
SUB R3, 1               ;     count -= 1
JMP inner
mult_done: MOV R1, R2   ;   result = acc
SUB R0, 1               ;   k -= 1
JMP outer

done: STORE [OUTPUT], R1
HALT
