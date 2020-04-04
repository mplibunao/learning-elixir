defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end

# IO.puts Math.sum(1, 2) # 3
# IO.puts Math.do_sum(1, 2) # UndefinedFunctionError

defmodule Concat do
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
