; if x < 0: x = 0 - x   (absolute value, an if without else)
LOAD R0, [INPUT]
CMP R0, 0
JGE keep                ; jump OVER the body when the condition is false
MOV R1, 0
SUB R1, R0
MOV R0, R1
keep: STORE [OUTPUT], R0
HALT
