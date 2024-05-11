
#IO.puts("hello world")

#IO.gets("yes or no? ")

#IO.puts(:stderr, "hello world")

filename = "./hello"


# Note: by default file is opened in binary mode
# See https://hexdocs.pm/elixir/File.html to open with utf8 encoding
{:ok, file} = File.open(filename, [:write])
IO.binwrite(file, "world")
File.close(file)
updated_file = File.read!(filename)

IO.puts("Updated file -> #{updated_file}")
