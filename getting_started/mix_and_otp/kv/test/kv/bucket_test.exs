defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = start_supervised(KV.Bucket)
    %{bucket: bucket} # ExUnit will merge this into the test context
  end

  test "stores value by key", %{bucket: bucket} do
    # access bucket from test context
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "deletes value by key and returns the key of the deleted value", %{bucket: bucket} do
    KV.Bucket.put(bucket, "apple", 1)
    assert KV.Bucket.get(bucket, "apple") == 1
    assert KV.Bucket.delete(bucket, "apple") == 1
    assert KV.Bucket.get(bucket, "apple") == nil
  end
end
