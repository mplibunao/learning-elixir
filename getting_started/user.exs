defmodule User do
  defstruct [:email, name: "John", age: 27]
  # defstruct [name: "John", age: 27, :email] # returns an error because nil fields are at the end
end

defimpl Size, for: User do
  def size(_user), do: 3
end

# enforce certain keys have to be specified when creating struct
defmodule Car do
  @enforce_keys [:make]
  @derive [Size] # will implement Size protocol for Car based on implem for Any
  defstruct [:model, :make]
end
