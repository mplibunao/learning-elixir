defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false

  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

IO.puts "Math.sum(1, 2) -> #{Math.sum(1, 2)}" # 3
# IO.puts Math.do_sum(1, 2) # UndefinedFunctionError
IO.puts "Math.zero?(0) -> #{Math.zero?(0)}"         #=> true
IO.puts "Math.zero?(1) -> #{Math.zero?(1)}"         #=> false
#IO.puts "Math.zero?([1, 2, 3]) -> #{Math.zero?([1, 2, 3])}" #=> ** (FunctionClauseError)
#IO.puts "Math.zero?(0.0) -> #{Math.zero?(0.0)}"       #=> ** (FunctionClauseError)

defmodule Concat do
  # Default arguments
  # since we have multiple clauses, we have to define a function head (function definition)
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

defmodule DefaultTest do
  def dowork(x \\ "hello") do
    x
  end
end

IO.puts Concat.join("Hello", "world")
IO.puts Concat.join("Hello", "world", "_")
