defmodule KV do
  @moduledoc """
  Documentation for `KV`.

  Since we specified KV as the module callback, we have to implement application behaviour
  - add `use Application`
  - define `start/2` function which starts a supervisor

  we can now expect the KV.Registry process to be up as soon as we start `iex -S mix`

    ```
    iex(1)> KV.Registry.create(KV.Registry, "shopping")
    :ok
    iex(2)> KV.Registry.lookup(KV.Registry, "shopping")
    {:ok, #PID<0.151.0>}
    iex(3)>
    ```
  """
  use Application

  @impl true
  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.
    KV.Supervisor.start_link(name: KV.Supervisor)
  end

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello()
      :world

  """
  def hello do
    :world
  end
end
