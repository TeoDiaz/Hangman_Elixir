defmodule Dictionary do

  def random_word do
    word_list()
    |> Enum.random()
  end

  def word_list do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

@doc """
  def random_word() do
    Enum.random(word_list())
  end

  def word_list do
    contents = File.read!("assets/words.txt")
    list = String.split(contents,  ~r/\n/)
  end
  """
end


