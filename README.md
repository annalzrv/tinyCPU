# TinyCPU

A tiny 32-bit teaching processor and a visual tracer for it.

## Run

Open `index.html` in a browser. One file, no dependencies, works offline.

Online: <https://annalzrv.github.io/tinyCPU/>

## Use

- Pick an example or paste a program. It assembles as you type.
- Enter input numbers in the Ports panel, space-separated.
- **Step** runs one instruction, **Back** undoes one, **Run** animates, **To end** runs until HALT.
- Click a row in the trace to jump to that moment.
- `⌘/Ctrl + Enter` steps, `⇧ ⌘/Ctrl + Enter` runs to the end.

## The machine

Four registers `R0`–`R3`, 240 memory cells, four flags `ZF SF CF OF`, and two ports: `[INPUT]` reads the next number, `[OUTPUT]` prints one.

```asm
LOAD R0, [INPUT]
LOAD R1, [INPUT]
ADD R0, R1
STORE [OUTPUT], R0
HALT
```

Decisions are `CMP a, b` followed by a jump: `JE JNE JL JLE JG JGE`. Jumps go to labels written `name:`.

```asm
loop: CMP R0, 0
JLE done
ADD R1, R0
SUB R0, 1
JMP loop
done: STORE [OUTPUT], R1
HALT
```

Specification: [docs/architecture.md](docs/architecture.md) · Syntax: [docs/assembly_syntax.md](docs/assembly_syntax.md)

## Examples

`sum` · `max` · `abs_ifelse` · `sign_ifelse` · `sum_1_to_n` · `multiply` · `factorial` · `reverse` · `bubble_sort`

## Command line

The course's Python emulator, which the tracer matches. Python 3.11+.

```bash
PYTHONPATH=src python3 -m tinycpu run examples/sum.asm --input "2 3"
PYTHONPATH=src python3 -m tinycpu trace examples/max.asm --input "2 7"
PYTHONPATH=src python3 -m tinycpu debug examples/max.asm --input "2 7"
```
