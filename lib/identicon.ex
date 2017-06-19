defmodule Identicon do
  @moduledoc """
    Provides identicon generation
  """

  @doc """
    Returns an identicon for a given string

  ## Examples
      iex> Identicon.main "hello, elixir"
      %Identicon.Image{color: {187, 59, 194},
        hex: [187, 59, 194, 54, 124, 10, 66, 193, 71, 200, 184, 122, 3, 207, 46, 82]}
  """

  def main(input) do
    input
      |> hash_input
      |> pick_color
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _wtf]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
