defmodule KVServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4040")

    children = [
      # Starts a worker by calling: KVServer.Worker.start_link(arg)
      # {KVServer.Worker, arg}
      {Task.Supervisor, name: KVServer.TaskSupervisor},
      # Modify the Task child_spec by using `Supevisor.child_spec/2`
      Supervisor.child_spec({Task, fn -> KVServer.accept(port) end}, restart: :permanent)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KVServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
