; if x > 0: print 1  elif x < 0: print -1  else: print 0
LOAD R0, [INPUT]
CMP R0, 0
JG positive
JL negative
MOV R1, 0
JMP show
positive: MOV R1, 1
JMP show
negative: MOV R1, -1
show: STORE [OUTPUT], R1
HALT
