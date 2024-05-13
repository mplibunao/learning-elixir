# Get representation of any expression
quote do: sum(1, 2, 3)
# {:sum, [], [1, 2, 3]}
# {function_name, keyword list of metadata, args list} 
quote do: 1 + 2
quote do: %{1 => 2}
quote do: x

# More complex expressions represented as nested structure (called AST in other languages)
# called quoted expressions in elixir
quote do: sum(1, 2 + 3, 4)
# {:sum, [], [1, {:+, [context: Elixir, import: Kernel], [2, 3]}, 4]}


# Get textual representation
Macro.to_string(quote do: sum(1, 2 + 3, 4))


# unquote lets you inject code inside the representation we want to retrieve
number = 13
Macro.to_string(quote do: 11 + unquote(number))
"11 + 13"


