### Compiling .ex files

- Compile the `.ex` file using `elixirc`

```
elixirc math.ex
```

- Run iex in the same directory as `.beam` file generated containing the bytecode

```
iex> Math.sum(1,2)
```

### Running .exs files

```
$ elixir math.exs
```

### Playing with iex

- Sometimes iex is better for learning since you can see more info
- If you want just copy modules to load them into memory then copy the commands
- Same thing with running the file seems better
