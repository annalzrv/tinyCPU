; a * b for b >= 0, by repeated addition (there is no MUL)
LOAD R0, [INPUT]        ; a
LOAD R1, [INPUT]        ; b  (how many times to add)
MOV R2, 0               ; result
loop: CMP R1, 0
JLE done                ; while b > 0:
ADD R2, R0              ;     result += a
SUB R1, 1               ;     b -= 1
JMP loop
done: STORE [OUTPUT], R2
HALT
