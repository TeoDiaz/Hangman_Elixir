defmodule Dictionary do

  @doc """
  def random_word() do
    Enum.random(word_list())
  end

  def word_list do
    contents = File.read!("assets/words.txt")
    list = String.split(contents,  ~r/\n/)
  end
  """
  #Refactor

  def random_world do
    world_list()
    |> Enum.random()
  end

  def world_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/)
  end

end

