defmodule PatternMatch do
  def swap({a, b}), do: {b.a}
  def equal(a, a), do: true
  def equal(_, _), do: false
end

defmodule Lists do
  def len([]), do: 0
  def len([_h | t]), do: 1 + len(t)

  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  def sum_pairs([]), do: []
  def sum_pairs([h1, h2 | t]), do: [h1 + h2 | sum_pairs(t)]

  def double([]), do: []
  def double([h | t]), do: [2 * h | double(t)]

  def square([]), do: []
  def square([h | t]), do: [h * h | square(t)]

  def map([], _func), do: []

  def map([h | t], func) do
    [func.(h) | map(t, func)]
  end

  # Lists.map([1,2,3], fn x -> x*x*x end)
  # Lists.map([1,2,3], &(&1*&1*&1)) Anonymous

  #Write a function even_length? that uses pattern matching only to return false if the list you pass it has an odd number of elements, true otherwise.
  def even_length?([]) do
    true
  end

  def even_length?([_head | tail]) do
    !even_length?(tail)
  end

  @doc """
  I think MapSet is probably the correct container for our used letters. I was also swayed to use it so I could show you a new library.

Just as a matter of interest, create a new temporary branch and change our implementation to use a list instead.

That shouldn't have been too difficult. So what's the benefit (if any) of using MapSet?
  """

  def make_move(%__MODULE__{game_state: state} = game, _guess)
      when state in [:won, :lost] do
    {game, tally(game)}
  end

  def make_move(game, guess) do
    game =
      MapSet.member?(game.used, guess) &&
        struct(game, game_state: :already_used) ||
        struct(game, used: MapSet.put(game.used, guess))
    {game, tally(game)}
  end

end
