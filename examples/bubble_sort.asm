; read n, then n numbers into memory[0..n-1]; bubble sort; print ascending
; memory[200] = n, memory[201] = passes left   (only 4 registers, so spill to memory)
LOAD R0, [INPUT]
STORE [200], R0
MOV R1, 0               ; write pointer
fill: CMP R1, R0
JGE setup
LOAD R2, [INPUT]
STORE [R1], R2
ADD R1, 1
JMP fill

setup: LOAD R3, [200]
SUB R3, 1               ; n - 1 passes
STORE [201], R3

outer: LOAD R3, [201]   ; while passes > 0:
CMP R3, 0
JLE print
MOV R0, 0               ;     j = 0
inner: LOAD R3, [200]   ;     while j + 1 < n:
MOV R1, R0
ADD R1, 1
CMP R1, R3
JGE end_pass
LOAD R1, [R0]           ;         R1 = a[j]
MOV R2, R0
ADD R2, 1               ;         R2 = j + 1
LOAD R3, [R2]           ;         R3 = a[j+1]
CMP R1, R3
JLE no_swap             ;         if a[j] > a[j+1]: swap
STORE [R0], R3
STORE [R2], R1
no_swap: ADD R0, 1      ;         j += 1
JMP inner
end_pass: LOAD R3, [201]
SUB R3, 1               ;     passes -= 1
STORE [201], R3
JMP outer

print: MOV R0, 0
LOAD R3, [200]
ploop: CMP R0, R3
JGE end
LOAD R1, [R0]
STORE [OUTPUT], R1
ADD R0, 1
JMP ploop
end: HALT
