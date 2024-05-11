# Use processes that loop infinitely, maintain state, and send/receive messages
# Note that the `start_link` function starts a new process that runs the `loop/1` function, starting with an empty map. The `loop/1` (private) function then waits for messages and performs the appropriate action for each message. We made `loop/1` private by using `defp` instead of `def`. In the case of a `:get` message, it sends a message back to the caller and calls `loop/1` again, to wait for a new message. While the `:put` message actually invokes `loop/1` with a new version of the map, with the given `key` and `value` store
defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end 
  end
end

# Run the following:
# elixirc kv.exs (iex kv.ex doesn't seem to load the module)
# iex
# {:ok, pid} = KV.start_link()
# send(pid, {:get, :hello, self()})
# flush()
# send(pid, {:put, :hello, :world})
# send(pid, {:get, :hello, self()})
# flush()
# Process.register(pid, :kv)
# send(:kv, {:get, :hello, self()})
# flush()
