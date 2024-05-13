defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets value with the given `key` from `bucket`
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts `value` with given `key` into the `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
end
