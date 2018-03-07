defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  def main(input) do
    input
    |> hash_input
  end

  def hash_input(input) do
<<<<<<< HEAD
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
=======
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
>>>>>>> 852ab69... Adds hash input function
  end
end
