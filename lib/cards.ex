defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
   values = ["Ace", "Two", "Three", "Four", "Five"] 
   suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

   # Comprehension is basically a map
   for suit <- suits, value <- values do
     "#{value} of #{suit}"
   end 
  end

  def shuffle(deck) do
   Enum.shuffle(deck) 
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

        iex(1)> deck = Cards.create_deck
        iex(2)> Cards.contains?(deck, "Ace of Spades")
        true

  """
  def contains?(deck, card) do
   Enum.member?(deck, card) 
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards you should get

  ## Examples

        iex(1)> deck = Cards.create_deck
        iex(2)> {hand, deck} = Cards.deal(deck, 1)
        iex(3)> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    # Doesn't really convert to binary
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    # Pipe operator requires us to have consistent 1st arguments
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
