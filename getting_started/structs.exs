defmodule User do
  defstruct [:email, name: "John", age: 27]
  # defstruct [name: "John", age: 27, :email] # returns an error because nil fields are at the end
end

IO.inspect(%User{}, label: "Uses default")
IO.inspect(%User{name: "Jane"}, label: "uses default age only")
%User{oops: :field} # error

IO.puts("Accessing and updating")
john = %User{}
john.name
IO.inspect(jane = %{john | name: "Jane"}, label: "| allows underlying maps to share structure in memory")
%{jane | oops: :field}




# enforce certain keys have to be specified when creating struct
defmodule Car do
  @enforce_keys [:make]
  defstruct [:model, :make]
end

%Car{}
%Car{model: "a"}
%Car{make: "hello"}


# protocols

defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  #@fallback_to_any true # alternative to derive that tells protocol to fallback to any when implementation can't be found
  # other option is to derive manually from any by using @derive attribute
  # See OtherCar module below
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

# struct here
defimpl Size, for: User do
  def size(_user), do: 3
end

Size.size("foo")
Size.size({:ok, "hello"})
Size.size(%{label: "some label"})
Size.size(%User{})


# Implementing Any
defimpl Size, for: Any do
  def size(_), do: 0
end

# enforce certain keys have to be specified when creating struct
defmodule OtherCar do
  @enforce_keys [:make]
  @derive [Size] # will implement Size protocol for Car based on implem for Any
  defstruct [:model, :make]
end

Size.size(%OtherCar{make: "me"}) # 0


