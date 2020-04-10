defmodule User do
  defstruct [:email, name: "John", age: 27]
  # defstruct [name: "John", age: 27, :email] # returns an error because nil fields are at the end
end

# enforce certain keys have to be specified when creating struct
defmodule Car do
  @enforce_keys [:make]
  defstruct [:model, :make]
end
