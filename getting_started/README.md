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