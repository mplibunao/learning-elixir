defmodule KV.Supervisor do
  use Supervisor

  @moduledoc """
  This is a module based supervisor
  Use this if the supervisor is not on the top of the supervisor tree

  3 ways to define child specification:
    - map with child specification in children
    - {Module, start link arg} passed to children with module having the `child_spec` function
    - Module (this is what we use) in children with `child_spec` func in module

  you can check the child_spec by running the ff inside `iex -S mix`

    ```
    iex(1)> KV.Registry.child_spec([])
    %{id: KV.Registry, start: {KV.Registry, :start_link, [[]]}}
    iex(2)> KV.Bucket.child_spec([])
    %{id: KV.Bucket, start: {KV.Bucket, :start_link, [[]]}}
    ```

  naming the KV.Registry process solves this by allowing us to use the module name as the identifier

  > Note: This is okay since Registry is not dynamically generated unlike buckets which can cause memory leaks

    ```
    iex(1)> KV.Supervisor.start_link([])
    {:ok, #PID<0.147.0>}
    iex(2)> KV.Registry.create(KV.Registry, "shopping")
    :ok
    iex(3)> KV.Registry.lookup(KV.Registry, "shopping")
    {:ok, #PID<0.149.0>}
    ```
  """

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {KV.Registry, name: KV.Registry},
      {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
