defmodule Debugging do
  def some_fun(a,b,c) do
    name = "wat"
    IO.inspect binding()
  end
end

# binding returns the function args + their values
Debugging.some_fun(1,2,3)

# using the label opts in IO.inspect
[1,2,3]
|> IO.inspect(label: "before")
|> Enum.map(& &1 *2)
|> IO.inspect(label: "after")
|> Enum.sum
