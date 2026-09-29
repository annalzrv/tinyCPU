; read n, then n numbers; print them in reverse order
; uses register-indirect addressing: [R2] is the cell whose number is in R2
LOAD R0, [INPUT]        ; n
MOV R2, 0               ; i = 0
fill: CMP R2, R0        ; while i < n:
JGE dump
LOAD R1, [INPUT]        ;   memory[i] = next input
STORE [R2], R1
ADD R2, 1               ;   i += 1
JMP fill
dump: CMP R2, 0         ; while i > 0:
JLE end
SUB R2, 1               ;   i -= 1
LOAD R1, [R2]           ;   print memory[i]
STORE [OUTPUT], R1
JMP dump
end: HALT
