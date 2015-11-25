defmodule Dojo do

  def decode(file) do
    # We read the file (must have the dimensions 27x4)
    {:ok, str} = File.read(file)
    # we remove the end lines and split it into 4 elements of 9
    String.split(str, "\n")
    # delete the last empty array element
     |> List.delete("")
    # we make a list of lists of 3 elements
     |> Enum.map(fn(x) ->
        String.codepoints(x)
        |> Enum.chunk(3)
      end)
    # we make a list of lists of 3 elements
     |> transpose
    # apply the join, match and return as a single string
     |> analyze
  end

  def analyze(list) do
    numbers = Enum.map(list, fn(x) ->
      Enum.join(x)
      |> translate_to_number
    end)
    |> Enum.join
  end

  def translate_to_number(str) do
    case str do
      "     |  |   " -> 1
      " _  _||_    " -> 2
      " _  _| _|   " -> 3
      "   |_|  |   " -> 4
      " _ |_  _|   " -> 5
      " _ |_ |_|   " -> 6
      " _   |  |   " -> 7
      " _ |_||_|   " -> 8
      " _ |_||_|   " -> 8
      " _ |_| _|   " -> 9
      " _ | ||_|   " -> 0
    end
  end

  def transpose([[]|_]), do: []
  def transpose(a) do
    [Enum.map(a, &hd/1) | transpose(Enum.map(a, &tl/1))]
  end

end
