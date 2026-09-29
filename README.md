# TinyCPU

A tiny 32-bit teaching processor from the MIPT Python course (week 2, *how computers execute programs*), plus a visual tracer so you can watch it run.

## Run the tracer

Open **`index.html`** in any browser. Double-click it. That's it.

It is one file with no dependencies: no Python, no install, no internet, works on Mac, Windows and Linux, and on a phone.

If GitHub Pages is enabled for this repo it is also online at <https://annalzrv.github.io/tinyCPU/>.

### Using it

- Pick an example from the dropdown, or paste your own program on the left. It re-assembles as you type and marks the line with an error.
- Type input numbers into the field in the **Ports** panel, space-separated.
- **Step** runs one instruction, **Back** undoes one, **Run** animates at the speed on the slider, **To end** runs until HALT.
- The line about to run is highlighted in the editor. Registers that just changed turn coral. Flags that are set turn green, and the row under them shows which jumps would fire right now.
- The memory grid shows all 240 cells. The last written cell is coral, and cells a register points at have a green outline.
- Every step is logged in the **Trace** table. Click a row to rewind or fast-forward to that moment.
- The **Cheat sheet** at the bottom lists every instruction, the jumps and the flags. Click its title to fold it.
- Shortcuts: `⌘/Ctrl + Enter` step, `⇧ ⌘/Ctrl + Enter` run to end. The Theme button at the bottom right switches light/dark.

## The machine in one minute

Four registers `R0`–`R3`, 240 memory cells, four flags `ZF SF CF OF`, and two ports: `[INPUT]` reads the next input number, `[OUTPUT]` prints one.

```asm
LOAD R0, [INPUT]      ; read a number into R0
LOAD R1, [INPUT]
ADD R0, R1            ; R0 = R0 + R1
STORE [OUTPUT], R0    ; print R0
HALT
```

There is no `if` and no `while`. You compare with `CMP a, b`, which sets the flags, and then jump with `JE JNE JL JLE JG JGE`, which read them. A jump goes to a label, written `name:` before a line.

```asm
loop: CMP R0, 0       ; while R0 > 0:
JLE done              ;   (leave when R0 <= 0)
ADD R1, R0            ;   R1 += R0
SUB R0, 1             ;   R0 -= 1
JMP loop
done: STORE [OUTPUT], R1
HALT
```

Full specification: [docs/architecture.md](docs/architecture.md). Syntax: [docs/assembly_syntax.md](docs/assembly_syntax.md).

## Examples

| file | what it shows |
|---|---|
| `sum.asm` | read two numbers, add, print |
| `max.asm` | an `if` with CMP and a jump |
| `abs_ifelse.asm`, `sign_ifelse.asm` | if / if-elif-else |
| `sum_1_to_n.asm` | a `while` loop |
| `multiply.asm` | multiplication by repeated addition (there is no MUL) |
| `factorial.asm` | a loop inside a loop; N! mod 2³² |
| `reverse.asm` | an array in memory using a pointer register `[R2]` |
| `bubble_sort.asm` | sorting with only four registers |

## Command line (optional)

The original Python emulator from the course is included. The tracer's engine is a port of it, checked against it on thousands of random programs, so both give the same answers. Use the CLI if you want to run a program exactly the way the contest checker does:

```bash
PYTHONPATH=src python3 -m tinycpu run examples/sum.asm --input "2 3"
PYTHONPATH=src python3 -m tinycpu trace examples/max.asm --input "2 7"
PYTHONPATH=src python3 -m tinycpu debug examples/max.asm --input "2 7"
```

Needs Python 3.11+. `run` prints the answer, `trace` prints a table, `debug` steps interactively (Enter to step, `q` to quit). Tests: `python3 -m unittest discover -s tests`.
