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

## Command line

The course's Python emulator, which the tracer matches. Python 3.11+.

```bash
python3 -m tinycpu run examples/sum.asm --input "2 3"
python3 -m tinycpu trace examples/max.asm --input "2 7"
python3 -m tinycpu debug examples/max.asm --input "2 7"
```
